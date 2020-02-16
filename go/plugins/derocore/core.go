package derocore

import (
	"derocore/plugins/derocore/model"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"github.com/deroproject/derosuite/address"
	"github.com/deroproject/derosuite/config"
	"github.com/deroproject/derosuite/crypto"
	"github.com/deroproject/derosuite/globals"
	"github.com/deroproject/derosuite/transaction"
	"github.com/deroproject/derosuite/walletapi"
	"github.com/golang/protobuf/proto"
	"github.com/pkg/errors"
	"github.com/romana/rlog"
	"io/ioutil"
	"net/http"
	"os"
	"runtime/debug"
	"sort"
	"strings"
	"sync"
	"time"
)

const EXEPTION_NO_WALLET_INSTANCE = "EXEPTION_NO_WALLET_INSTANCE"
const EXCEPTION_METHOD_NOT_IMPLEMENTED = "EXCEPTION_METHOD_NOT_IMPLEMENTED"

const DEFAULT_REMOTE_NODE = "https://rwallet.dero.live"
const DEFAULT_TICKER_API = "https://ticker.deromask.io/ticker"

// a global var holding current dero price
// updated in a loop
var ticker model.Ticker

func globalInit() {
	globals.Arguments = map[string]interface{}{}

	/// todo add option to switch between mainnet and testnet
	//globals.Arguments["--testnet"] = true
	//globals.Config = config.Testnet

	globals.Arguments["--testnet"] = false
	globals.Config = config.Mainnet

	debug.SetGCPercent(30)
}

type RPC struct {
	w         *walletapi.Wallet
	app_state *model.AppSettings // global setting for all wallet
	sync.RWMutex
}

//var rpc *RPC // desktop only, remove on mobile

func NewRPC() *RPC {
	rlog.Info("initialize rpc")
	globalInit()
	d := &RPC{}
	// set default app setting
	d.app_state = &model.AppSettings{}
	d.app_state.DaemonAddress = DEFAULT_REMOTE_NODE

	go func() {
		// save wallet every 20s
		for {
			time.Sleep(time.Duration(30 * time.Second))
			if d.w != nil {
				err := d.w.Save_Wallet()
				if err != nil {
					rlog.Info(err.Error())
				} else {
					rlog.Info("wallet saved")
				}
			}
		}
	}()

	// update at least once on start
	go updateTicker()

	// update ticker only when wallet is opened to reduce server load
	go func() {
		for {
			if d.w != nil {
				updateTicker()
			}
			time.Sleep(time.Duration(30 * time.Second))
		}
	}()

	return d
}

func updateTicker() {
	//fmt.Println("updating ticker")

	resp, err := http.Get(DEFAULT_TICKER_API)
	if err != nil {
		rlog.Error(err.Error())
		return
	}

	if resp.StatusCode == http.StatusOK {
		bodyBytes, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			rlog.Info(err.Error())
			return
		}

		err = json.Unmarshal(bodyBytes, &ticker)

		if err != nil {
			rlog.Info(err.Error())
		}
	}
}
func (r *RPC) setWallet(wallet *walletapi.Wallet) {
	r.Lock()
	defer r.Unlock()
	r.w = wallet
}
func (r *RPC) setAppSettings(app_state *model.AppSettings) {
	r.Lock()
	defer r.Unlock()
	r.app_state = app_state
}
func (r *RPC) getAppSettings() *model.AppSettings {
	r.Lock()
	defer r.Unlock()
	return r.app_state
}

// os native code can call these function
func (r *RPC) IsWalletInSync() bool {
	if r.w == nil {
		return false
	}

	if r.w.Get_Daemon_TopoHeight()-r.w.Get_TopoHeight() < 5 {
		return true
	}
	return false
}
func (r *RPC) HasWalletInstance() bool {
	return r.w != nil
}
func (r *RPC) CleanUp() {
	rlog.Info("clean up wallet")
	r.Lock()
	defer r.Unlock()

	_ = r.w.Save_Wallet()

	rlog.Info("clean up wallet success")
}
func (r *RPC) CallNative(method string, args []byte) (resp []byte, err error) {
	switch method {
	case "change_name":
		return r.changeName(args)
	case "create_new_wallet":
		return r.createNewWallet(args)
	case "open_wallet":
		return r.openWallet(args)
	case "recover_wallet":
		return r.recoverWallet(args)
	case "create_demo_wallet":
		return r.createDemoWallet(args)
	case "set_mode":
		return r.setMode(args)
	case "set_online":
		return r.setOnline(args)
	case "set_offline":
		return r.setOffline(args)
	case "set_daemon_address":
		return r.setWalletDaemonAddress(args)
	case "get_state":
		return r.syncState(args)
	case "get_seed":
		return r.getSeed(args)
	case "get_transfers":
		return r.getTransfers(args)
	case "close":
		return r.closeWallet(args)
	case "delete":
		return r.deleteWallet(args)
	case "create_tx":
		return r.createTx(args)
	case "create_tx_max":
		return r.createTxMax(args)
	case "check_password":
		return r.checkPassword(args)
	case "change_password":
		return r.changePassword(args)
	case "validate_address":
		return r.validateAddress(args)
	case "rescan_blockchain":
		return r.rescanBlockchain(args)
	//case "get_transfer_fee":
	//	return r.GetTransferFee(args)
	//case "get_max_send":
	//	return r.GetMaxSend(args)
	//case "is_max_send":
	//	return r.IsMaxSend(args)
	case "relay_tx":
		return r.relayTx(args)
	default:
		return nil, errors.New(EXCEPTION_METHOD_NOT_IMPLEMENTED)
	}
}

/*
expose api to flutter
data exchanged using protobuf
todo: DRY check for wallet instance using decorator
*/

func (r *RPC) createNewWallet(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	params := &model.CreateNewWalletParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}
	w, err := walletapi.Create_Encrypted_Wallet_Random(params.GetFilename(), params.GetPassword())
	if err != nil {
		return
	}

	w.SetDaemonAddress(r.getAppSettings().DaemonAddress)
	w.SetInitialHeight(int64(-1)) // set to daemon height
	w.SetOnlineMode()

	go func() {
		er := r.w.Save_Wallet()
		if er != nil {
			rlog.Info(er.Error())
		} else {
			rlog.Info("wallet saved")
		}
	}()

	r.setWallet(w)

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) openWallet(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	params := &model.OpenWalletParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}
	rlog.Infof("open wallet at %v", params.GetFilename())
	w, err := walletapi.Open_Encrypted_Wallet(params.GetFilename(), params.GetPassword())
	if err != nil {
		rlog.Info(err.Error())
		return
	}

	rlog.Infof("openwallet:saved daemon: %v", w.GetDaemonAddress())

	if w.GetDaemonAddress() == "" {
		w.SetDaemonAddress(r.getAppSettings().DaemonAddress)
	}
	w.SetOnlineMode()

	//_ = w.Save_Wallet()

	r.setWallet(w)

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)

	return
}

func recoverWalletFromSpendKey(filename, password, seed_key_string string) (w *walletapi.Wallet, err error) {
	var seedkey crypto.Key

	seed_raw, err := hex.DecodeString(seed_key_string) // hex decode
	if len(seed_key_string) != 64 || err != nil {      //sanity check
		err = errors.New("Seed must be 64 chars hexadecimal chars")
	}

	copy(seedkey[:], seed_raw[:32])

	w, err = walletapi.Create_Encrypted_Wallet(filename, password, seedkey)
	if err != nil {
		err = errors.New(fmt.Sprintf("Error while recovering wallet using seed key err %s\n", err))
	}

	return w, nil
}

func (r *RPC) recoverWallet(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	params := &model.RecoverWalletParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		rlog.Info(err.Error())
		return
	}

	var w *walletapi.Wallet

	if params.GetType() == "SPEND_KEY" {
		w, err = recoverWalletFromSpendKey(params.GetFilename(), params.GetPassword(), params.GetData())
	}

	if params.GetType() == "SEED" {
		w, err = walletapi.Create_Encrypted_Wallet_From_Recovery_Words(params.GetFilename(), params.GetPassword(), params.GetData())
	}

	if params.GetType() == "VIEW_KEY" {
		w, err = walletapi.Create_Encrypted_Wallet_ViewOnly(params.GetFilename(), params.GetPassword(), params.GetData())
	}

	if err != nil {
		rlog.Info(err.Error())
		return
	}

	if w.Daemon_Endpoint == "" {
		w.SetDaemonAddress(r.getAppSettings().DaemonAddress)
	}

	//rlog.Infof("recover wallet with start height: %v", params.GetStartHeight())
	w.SetInitialHeight(params.GetStartHeight())

	w.SetOnlineMode()

	go func() {
		er := r.w.Save_Wallet()
		if er != nil {
			rlog.Info(er.Error())
		} else {
			rlog.Info("wallet saved")
		}
	}()

	r.setWallet(w)

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

// recover a demo wallet for app store reviewer
// todo add real account on production
func (r *RPC) createDemoWallet(args []byte) (resp []byte, err error) {
	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}
	resp, err = proto.Marshal(result)

	rlog.Info("create demo wallet success")

	return
}

func (r *RPC) setOnline(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	r.w.SetOnlineMode()

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) setOffline(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) setMode(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	params := &model.SetModeParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	if r.w.GetDaemonAddress() == "" {
		r.w.SetDaemonAddress(DEFAULT_REMOTE_NODE)
	}

	if params.Mode {
		r.w.SetOnlineMode()
	} else {
		r.w.SetOfflineMode()
	}

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) setWalletDaemonAddress(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	params := &model.SetDaemonAddressParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	r.w.SetDaemonAddress(params.GetAddress())
	go func() {
		er := r.w.Save_Wallet()
		if er != nil {
			rlog.Info(er.Error())
		} else {
			rlog.Info("setWalletDaemonAddress: wallet saved")
		}
	}()

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)

	return
}

func (r *RPC) checkPassword(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()
	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	params := &model.CheckPasswordParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	valid := r.w.Check_Password(params.GetPassword())

	result := &model.BoolResult{
		Result:   valid,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)

	return
}

func (r *RPC) changePassword(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()
	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	params := &model.ChangePasswordParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	err = r.w.Set_Encrypted_Wallet_Password(params.GetPassword())

	if err != nil {
		rlog.Info(err.Error())
		return nil, errors.New("change password failed")
	}

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) changeName(args []byte) (resp []byte, err error) {

	params := &model.ChangeNameParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	currentWalletPath := r.w.Get_Wallet_Path()

	r.w.Close_Encrypted_Wallet()
	if r.w != nil {
		r.setWallet(nil)
	}

	err = os.Rename(currentWalletPath, params.GetFilepath())
	if err != nil {
		return
	}

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) getSeed(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	params := &model.GetSeedParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	seed := r.w.GetSeedinLanguage(params.GetLang())
	result := &model.GetSeedResult{
		Seed: seed,
	}

	resp, err = proto.Marshal(result)

	return
}

func (r *RPC) getTransfers(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	p := &model.GetTransfersParam{}
	err = proto.Unmarshal(args, p)
	if err != nil {
		return
	}
	var result model.GetTransfersResult

	in_entries := r.w.Show_Transfers(p.GetIn(), p.GetIn(), false, false, false, false, p.GetMinHeight(), p.GetMaxHeight())
	out_entries := r.w.Show_Transfers(false, false, p.GetOut(), false, false, false, p.GetMinHeight(), p.GetMaxHeight())

	//rlog.Info(in_entries)
	//rlog.Info(out_entries)

	for j := range in_entries {
		result.Desc = append(result.Desc, &model.TransferDetails{
			Txid:            in_entries[j].TXID.String(),
			PaymentId:       hex.EncodeToString(in_entries[j].PaymentID),
			BlockHeight:     in_entries[j].Height,
			BlockTopoheight: in_entries[j].TopoHeight,
			Amount:          in_entries[j].Amount,
			UnlockTime:      in_entries[j].Unlock_Time,
			SecretTxKey:     in_entries[j].Secret_TX_Key,
			Type:            "in",
		})

	}

	for j := range out_entries {
		result.Desc = append(result.Desc, &model.TransferDetails{
			Txid:            out_entries[j].TXID.String(),
			PaymentId:       hex.EncodeToString(out_entries[j].PaymentID),
			BlockHeight:     out_entries[j].Height,
			BlockTopoheight: out_entries[j].TopoHeight,
			Amount:          out_entries[j].Amount,
			UnlockTime:      out_entries[j].Unlock_Time,
			SecretTxKey:     out_entries[j].Secret_TX_Key,
			Type:            "out",
		})
	}

	// sort entries

	sort.Slice(result.Desc, func(i, j int) bool { return result.Desc[i].BlockHeight > result.Desc[j].BlockHeight })

	//fmt.Printf("%v", result)
	resp, err = proto.Marshal(&result)

	return
}

// transfer everything
func (r *RPC) createTxMax(args []byte) (resp []byte, err error) {
	p := &model.TransfersEverythingParam{}
	var result model.TxInfo

	err = proto.Unmarshal(args, p)
	if err != nil {
		return
	}

	if len(p.GetPaymentId()) > 0 && (len(p.GetPaymentId()) == 64 || len(p.GetPaymentId()) == 16) != true {
		err = errors.New("invalid_payment_id")
		return
	}
	if _, err := hex.DecodeString(p.GetPaymentId()); err != nil {
		err = errors.New("invalid_payment_id")
		return nil, err
	}

	valid_address, err := globals.ParseValidateAddress(p.GetAddress())
	if err != nil {
		return
	}

	fees_per_kb := uint64(0)
	mixin := uint64(0)

	tx, inputs, _, err := r.w.Transfer_Everything(*valid_address, p.GetPaymentId(), 0, fees_per_kb, mixin)
	_ = inputs
	if err != nil {
		return
	}

	err = r.w.SendTransaction(tx)

	if err != nil {
		return
	}

	result.Fee = tx.RctSignature.Get_TX_Fee()
	result.Hash = tx.GetHash().String()
	result.Blob = tx.Serialize()

	resp, err = proto.Marshal(&result)

	return
}

func (r *RPC) createTx(args []byte) (resp []byte, err error) {

	p := &model.TransfersParam{}
	var result model.TxInfo

	rlog.Debugf("transfer handler")
	defer rlog.Debugf("transfer  handler finished")

	err = proto.Unmarshal(args, p)
	if err != nil {
		return
	}

	rlog.Debugf("Len destinations %d %+v", len(p.Destinations), p)

	if len(p.GetPaymentId()) > 0 && (len(p.GetPaymentId()) == 64 || len(p.GetPaymentId()) == 16) != true {
		err = errors.New("invalid_payment_id")
		return
	}
	if _, err := hex.DecodeString(p.GetPaymentId()); err != nil {
		err = errors.New("invalid_payment_id")
		return nil, err
	}

	var address_list []address.Address
	var amount_list []uint64

	for i := range p.Destinations {
		a, err := globals.ParseValidateAddress(p.Destinations[i].Address)
		if err != nil {
			err = errors.New(fmt.Sprintf("Parsing address failed %s err %s\n", p.Destinations[i].Address, err))
			rlog.Info("invalid address")
			return nil, err
		}
		address_list = append(address_list, *a)

		amount, err := globals.ParseAmount(p.Destinations[i].GetHumanAmount())

		if err != nil {
			rlog.Info("invalid amount")
			err = errors.New(fmt.Sprintf("Parsing amount failed %s err %s\n", p.Destinations[i].GetHumanAmount(), err))
			return nil, err
		}

		amount_list = append(amount_list, amount)
	}

	fees_per_kb := uint64(0) // fees  must be calculated by walletapi

	tx, inputs, input_sum, change, err := r.w.Transfer(address_list, amount_list, p.GetUnlockTime(), p.GetPaymentId(), fees_per_kb, p.Mixin)

	_ = inputs

	if err != nil {
		return
	}

	rlog.Infof("Inputs Selected for %s \n", globals.FormatMoney(input_sum))
	amount := uint64(0)
	for i := range amount_list {
		amount += amount_list[i]
	}

	rlog.Infof("Transfering total amount %s \n", globals.FormatMoney(amount))
	rlog.Infof("change amount ( will come back ) %s \n", globals.FormatMoney(change))
	rlog.Infof("fees %s \n", globals.FormatMoney(tx.RctSignature.Get_TX_Fee()))

	if input_sum != (amount + change + tx.RctSignature.Get_TX_Fee()) {
		rlog.Info("checksum failed")
		panic(fmt.Sprintf("Inputs %d != outputs ( %d + %d + %d )", input_sum, amount, change, tx.RctSignature.Get_TX_Fee()))
	}

	//if p.GetDoNotRelay() == false { // if we do not relay the tx, the user must submit it manually
	//	// TODO
	//	err = r.w.SendTransaction(tx)
	//
	//	if err == nil {
	//		rlog.Infof("Transaction sent successfully. txid = %s", tx.GetHash())
	//	} else {
	//		rlog.Warnf("Transaction sending failed txid = %s, err %s", tx.GetHash(), err)
	//		//return nil, &jsonrpc.Error{Code: -2, Message: fmt.Sprintf("Transaction sending failed txid = %s, err %s", tx.GetHash(), err)}
	//		err = errors.newProtoMessage("transaction_relay_failed")
	//		return
	//	}
	//}

	result.Fee = tx.RctSignature.Get_TX_Fee()
	result.Hash = tx.GetHash().String()
	result.Blob = tx.Serialize()

	resp, err = proto.Marshal(&result)

	return
}

func (r *RPC) relayTx(args []byte) (resp []byte, err error) {
	p := &model.TxInfo{}

	err = proto.Unmarshal(args, p)
	if err != nil {
		return
	}

	tx := &transaction.Transaction{}

	err = tx.DeserializeHeader(p.GetBlob())

	if err != nil {
		err = errors.New("error when deserial tx: " + err.Error())
		return
	}

	err = r.w.SendTransaction(tx)

	if err != nil {
		rlog.Info("send tx err: " + err.Error())
		return
	}

	result := &model.BoolResult{
		Result:   true,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)

	return
}

func (r *RPC) closeWallet(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w != nil {
		r.w.Close_Encrypted_Wallet()
		r.setWallet(nil)
	}

	result := &model.CloseWalletResult{
		Status: "ok",
	}

	resp, err = proto.Marshal(result)

	return
}

func (r *RPC) deleteWallet(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	currentWalletPath := r.w.Get_Wallet_Path()

	r.w.Close_Encrypted_Wallet()
	r.setWallet(nil)

	err = os.Remove(currentWalletPath)
	if err != nil {
		return
	}

	result := &model.DeleteWalletResult{
		Status: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) syncState(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	if r.w == nil {
		err = errors.New(EXEPTION_NO_WALLET_INSTANCE)
		return
	}

	params := &model.WalletStateParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	app_state := params.GetAppSettings()
	if app_state != nil {
		r.setAppSettings(app_state)
		if app_state.DaemonAddress != "" {
			r.w.SetDaemonAddress(app_state.DaemonAddress)
		} else {
			r.w.SetDaemonAddress(DEFAULT_REMOTE_NODE)
		}
	}

	mature, locked := r.w.Get_Balance()
	balance := mature + locked

	state := &model.WalletState{
		Address:          r.w.GetAddress().String(),
		Height:           r.w.Get_Height(),
		TopoHeight:       r.w.Get_TopoHeight(),
		DaemonAddress:    r.w.GetDaemonAddress(),
		DaemonHeight:     r.w.Get_Daemon_Height(),
		DaemonTopoHeight: r.w.Get_Daemon_TopoHeight(),
		Mode:             r.w.GetMode(),
		MatureBalance:    mature,
		LockedBalance:    locked,
		Balance:          balance,
		WalletPath:       r.w.Get_Wallet_Path(),
		Seed:             r.w.GetSeed(),
		SpendKey:         r.w.GetSpendKey(),
		ViewKey:          r.w.GetViewWalletKey(),
		IsViewOnly:       r.w.IsViewOnly(),
		TxFee:            r.w.GetFee(),
		Price:            ticker.PriceUSD,
	}

	resp, err = proto.Marshal(state)

	return
}

func (r *RPC) setCleanupInterval(args []byte) (resp []byte, err error) {
	r.Lock()
	defer r.Unlock()

	params := &model.SetCleanupIntervalParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}

	result := &model.SetCleanupIntervalResult{
		Status: true,
	}

	resp, err = proto.Marshal(result)

	return
}

func (r *RPC) rescanBlockchain(args []byte) (resp []byte, err error) {
	//r.Lock()
	//defer r.Unlock()

	params := &model.RescanParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}
	r.w.SetOfflineMode()
	r.w.SetInitialHeight(params.GetHeight())
	r.w.Clean()               // clean existing data from wallet
	r.w.Rescan_From_Height(0) // we are setting it to zero, it will be automatically convert to start height if it is set
	r.w.SetOnlineMode()

	go func() {
		_ = r.w.Save_Wallet()
	}()

	result := &model.RescanResult{
		Status: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}

func (r *RPC) validateAddress(args []byte) (resp []byte, err error) {
	params := &model.ValidateAddressParam{}
	err = proto.Unmarshal(args, params)
	if err != nil {
		return
	}
	valid := false
	_, err = address.NewAddress(strings.TrimSpace(params.GetAddress()))
	if err == nil {
		valid = true
	}

	result := &model.BoolResult{
		Result:   valid,
		FailSafe: "ok",
	}

	resp, err = proto.Marshal(result)
	return
}
