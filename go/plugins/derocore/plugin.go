package derocore

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
)

const channelName = "io.deromask.deromob"

type DeroCorePlugin struct {

}

var _ flutter.Plugin = &DeroCorePlugin{} // compile-time type check

var rpc *RPC

// InitPlugin initializes the path provider plugin.
func (p *DeroCorePlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	rpc = NewRPC()
	channel := plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	channel.HandleFunc("call_native", p.CallNative)
	return nil
}

func (p *DeroCorePlugin) CallNative(arguments interface{}) (reply interface{}, err error) {
	argsMap := arguments.(map[interface{}]interface{})
	method := argsMap["method"].(string)

	if argsMap["args"] != nil {
		method_args := argsMap["args"].([]byte)
		return rpc.CallNative(method, method_args)
	}


	return rpc.CallNative(method, nil)
}

