package io.dero.dero;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.PowerManager;
import android.os.RemoteException;
import android.util.Log;
//import android.support.annotation.RequiresApi;
import androidx.annotation.RequiresApi;
import androidx.core.app.NotificationCompat;

import derocore.RPC;

public class ForegroundService extends Service {

    static final int MSG_REQUEST = 1;

    static final int MSG_RESPONSE = 2;

    static final int MSG_STOP_SERVICE = 3;

    static final int MSG_PING = 4;

    //    private static final String TAG = ForegroundService.class.getSimpleName();
    private static final int ONGOING_NOTIFICATION_ID = 1;

    private String CHANNEL_ID = "dero_channel_id";

    private PowerManager.WakeLock wakeLock;

    private static String LOG_TAG = "DERO.SERVICE.FOREGROUND";

    private RPC deroRPC = new RPC();

    // required for foregroundService since android O
    @RequiresApi(26)
    private void createNotificationChannel() {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, "deromob_service", NotificationManager.IMPORTANCE_MIN);
            channel.setSound(null, null);
            NotificationManager notificationManager = getSystemService(NotificationManager.class);
            notificationManager.createNotificationChannel(channel);
        }
    }

//    /**
//     * activity lifetime message channel
//     * use this channel to actively send data to main activity
//     */
//    private Messenger mainActivityMessageSender;

//    /**
//     * if wallet is not open and main activity is die, close the service
//     */
//    private class stopServiceTask extends AsyncTask<Void, Void, Integer> {
//        protected Integer doInBackground(Void... params) {
//            SystemClock.sleep(1000);
//            boolean isActivityAlive;
//
//            while (true) {
//                isActivityAlive = true;
//                if (mainActivityMessageSender != null) {
//                    Message respMessage = Message.obtain(null, MSG_PING);
//                    try {
//                        mainActivityMessageSender.send(respMessage);
//                    } catch (Exception e) {
//                        // activity is die
//                        Log.e(LOG_TAG, "stopServiceTask:" + e.toString());
//                        isActivityAlive = false;
//                    }
//
//                    Log.d(LOG_TAG, "wallet open:"+String.valueOf(deroRPC.hasWalletInstance())+";activity:"+String.valueOf(isActivityAlive));
//
//                    if (!deroRPC.hasWalletInstance() && !isActivityAlive) {
//                        Log.d(LOG_TAG, "no wallet instance, no activity");
//                        break;
//                    }
//                } else {
//                    Log.e(LOG_TAG, "mainActivityMessageSender is null");
//                }
//                SystemClock.sleep(1000);
//            }
//
//            return 1;
//        }
//
//        protected void onPostExecute(Integer result) {
//            Log.e(LOG_TAG, "stopServiceTask:exit foreground service");
//            stopForeground(true);
//            stopSelf();
//        }
//    }

    /**
     * Handler of incoming messages from clients.
     * todo implement timeout
     */
    private class IncomingHandler extends Handler {
        @Override
        public void handleMessage(Message msg) {
//            Log.d(LOG_TAG, "msg received, type: " + msg.what);
            switch (msg.what) {
                case MSG_PING:
//                    Log.d(LOG_TAG, "ping from main");
//                    mainActivityMessageSender = msg.replyTo;
//                    Log.d(LOG_TAG, mainActivityMessageSender.toString());
                    break;
                case MSG_STOP_SERVICE:
                    if (!deroRPC.hasWalletInstance()) {
                        Log.d(LOG_TAG, "stop service");
                        stopForeground(true);
                        stopSelf();
                    }
                    break;
                case MSG_REQUEST:
                    // do job and send response to client
                    try {
                        // hold native result
                        byte[] nativeResult = null;
                        String nativeErrorMessage = null;

                        // extract data from request
                        Bundle data = msg.getData();
                        String method = data.getString("method");

//                        Log.e(LOG_TAG, method);

                        byte[] args = data.getByteArray("args");

                        // call native with those params
                        try {
                            nativeResult = deroRPC.callNative(method, args);
                        } catch (Exception e) {
//                            Log.e(LOG_TAG, "native:" + method + " failed" + e.getMessage());
                            nativeErrorMessage = e.getMessage();
                        }

                        Bundle respData = new Bundle();

                        if (nativeErrorMessage != null) {
                            respData.putString("type", "error");
                            respData.putString("message", nativeErrorMessage);
                        } else {
                            respData.putString("type", "success");
                            respData.putByteArray("data", nativeResult);
                        }

                        Message respMessage = Message.obtain(null, MSG_RESPONSE);
                        respMessage.setData(respData);

                        try {
                            if (msg.replyTo != null)
                                msg.replyTo.send(respMessage);
                        } catch (RemoteException e) {
                            // The client is dead.
                        }
                    } catch (Exception e) {
                        //
//                        Log.e(LOG_TAG, e.getMessage());
                    }
                    break;
                default:
                    super.handleMessage(msg);
            }
        }
    }

    /**
     * Target we publish for clients to send messages to IncomingHandler.
     */
    final Messenger mMessenger = new Messenger(new IncomingHandler());

    @Override
    public void onCreate() {
        super.onCreate();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            // build notification channel
            createNotificationChannel();
        }

        // start a new thread

        PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
        wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, ForegroundService.class.getName());
    }


    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {

//        Log.d(LOG_TAG, "startID: " + startId + ";flags" + flags);

        if (intent.getAction().equals("start")) {
//            // show app info setting for the app
//            PackageManager pm = getApplicationContext().getPackageManager();
//            Intent notificationIntent = pm.getLaunchIntentForPackage(getApplicationContext().getPackageName());

//            // currently show the main activity
//            Intent notificationIntent = new Intent(ForegroundService.this, MainActivity.class);
//            notificationIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK
//                    | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
//            PendingIntent pendingIntent = PendingIntent.getActivity(this, 0,
//                    notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT);

            // Create an explicit intent for an Activity in your app
            Intent notificationIntent = new Intent(this, MainActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            intent.setAction(Intent.ACTION_VIEW);
            int uniqueInt = (int) (System.currentTimeMillis() & 0xfffffff);
            PendingIntent pendingIntent = PendingIntent.getActivity(this, uniqueInt, notificationIntent, PendingIntent.FLAG_ONE_SHOT);


            String channelId = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O ? CHANNEL_ID : "";
            Notification notification =
                    new NotificationCompat.Builder(this, channelId)
//                            .setOngoing(true)
                            .setPriority(NotificationCompat.PRIORITY_MIN)
                            .setContentIntent(pendingIntent)
                            .setAutoCancel(true)
                            .build();

            startForeground(ONGOING_NOTIFICATION_ID, notification);
//             prevent service stop when screen lock
            acquireWakeLock();

        } else {
            stopSelf();
            stopForeground(true);
        }

        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    /**
     * When binding to the service, we return an interface to our messenger
     * for sending messages to the service.
     */
    @Override
    public IBinder onBind(Intent intent) {
//        new stopServiceTask().execute();
        return mMessenger.getBinder();
    }

    private void acquireWakeLock() {
        if (!wakeLock.isHeld())
            wakeLock.acquire();
    }
}