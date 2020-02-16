package io.dero.dero;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.content.ComponentCallbacks2;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;

import androidx.core.content.ContextCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity implements ComponentCallbacks2 {

  private static String LOG_TAG = "DERO.MAIN.ACTIVITY";


  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "io.deromask.deromob")
            .setMethodCallHandler(
                    (methodCall, result) -> {
                      switch (methodCall.method) {
                        case "call_native":
                          try {
                            if (!methodCall.hasArgument("method")) {
                              result.error("call_native", "Send argument as Map<\"method\", string>", null);
                              return;
                            }
                            if (!methodCall.hasArgument("args")) {
                              result.error("call_native", "Send argument as Map<\"args\", byte[]>", null);
                              return;
                            }

                            try {
                              String method = methodCall.argument("method");
                              byte[] args = methodCall.argument("args");
                              sendRequest(method, args, result);
                              return;
                            } catch (Exception e) {
                              result.error("call_native", e.getMessage(), null);
                              return;
                            }
                          } catch (Exception e) {
                            result.error("call_native", e.getMessage(), null);
                          }
                          break;
                        default:
                          result.notImplemented();
                      }
                    }
            );
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

//    MethodChannel methodChannel = new MethodChannel(getFlutterView(), "io.deromask.deromob");
//    methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
//      @Override
//      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                /*
//                java part act as a proxy to exchange byte[] data between go module and dart
//                 */
//        switch (methodCall.method) {
//          case "call_native":
//            try {
//              if (!methodCall.hasArgument("method")) {
//                result.error("call_native", "Send argument as Map<\"method\", string>", null);
//                return;
//              }
//              if (!methodCall.hasArgument("args")) {
//                result.error("call_native", "Send argument as Map<\"args\", byte[]>", null);
//                return;
//              }
//
//              try {
//                String method = methodCall.argument("method");
//                byte[] args = methodCall.argument("args");
//                sendRequest(method, args, result);
//                return;
//              } catch (Exception e) {
//                result.error("call_native", e.getMessage(), null);
//                return;
//              }
//            } catch (Exception e) {
//              result.error("call_native", e.getMessage(), null);
//            }
//            break;
//          default:
//            result.notImplemented();
//        }
//      }
//    });

    doStartService();
  }

  @Override
  protected void onStart() {
    super.onStart();
    doBindService();
  }

  @Override
  protected void onStop() {
    Log.d(LOG_TAG, "onStop");
    if (isFinishing()) {
      Log.d(LOG_TAG, "onStop:isFinishing");
      // Here  you can be sure the Activity will be destroyed eventually
      // tell the service to do clean up
//            incomingMessenger = null;
      requestStopService();
    }
    super.onStop();
//        doUnbindService();
  }

//    @Override
//    protected void onPause() {
//        super.onPause();
//    }

  @Override
  protected void onResume() {
    super.onResume();
    doStartService();
    doBindService();
  }

  @Override
  protected void onDestroy() {
    requestStopService();
//        incomingMessenger = null;
    super.onDestroy();
    doUnbindService();
  }

  @Override
  protected void onNewIntent(Intent intent) {
    super.onNewIntent(intent);
    int flags = intent.getFlags();
    Log.d(LOG_TAG, "onNewIntent:flags:"+flags);
  }

  public void doStartService() {

    Intent intent = new Intent(this, ForegroundService.class);
    intent.setAction("start");
    intent.putExtra("title", "deromob");
    intent.putExtra("text", "text");
    intent.putExtra("subText", "subText");
    intent.putExtra("ticker", "ticker");
    intent.putExtra("timeout", 10000);

    ContextCompat.startForegroundService(getApplicationContext(), intent);
//        startService(intent);
  }

  public void doStopService() {
    Intent serviceIntent = new Intent(this, ForegroundService.class);
    stopService(serviceIntent);
  }

  /**
   * Messenger for communicating with service.
   */
  Messenger foregroundService = null;
  /**
   * Flag indicating whether we have called bind on the service.
   */
  boolean mIsBound;

  /**
   * Class for interacting with the main interface of the service.
   */
  private ServiceConnection mConnection = new ServiceConnection() {
    public void onServiceConnected(ComponentName className,
                                   IBinder service) {
      foregroundService = new Messenger(service);

//            initIncomingHandlerCallback();
    }

    public void onServiceDisconnected(ComponentName className) {
      // This is called when the connection with the service has been
      // unexpectedly disconnected -- that is, its process crashed.
      foregroundService = null;
    }
  };


  void doUnbindService() {
    if (mIsBound) {
      // If we have received the service, and hence registered with
      // it, then now is the time to unregister.
      if (foregroundService != null) {
        try {
          Message msg = Message.obtain(null,
                  ForegroundService.MSG_STOP_SERVICE);
          foregroundService.send(msg);
        } catch (RemoteException e) {
          // There is nothing special we need to do if the service
          // has crashed.
//                    Log.e(LOG_TAG, e.getMessage());
        }
      }

      // Detach our existing connection.
      unbindService(mConnection);
      mIsBound = false;
    }
  }

  void doBindService() {
    // Attempts to establish a connection with the service.  We use an
    // explicit class name because we want a specific service
    // implementation that we know will be running in our own process
    // (and thus won't be supporting component replacement by other
    // applications).
    if (bindService(new Intent(MainActivity.this, ForegroundService.class),
            mConnection, Context.BIND_AUTO_CREATE)) {
      mIsBound = true;
      Log.d(LOG_TAG, "ForegroundService binded");
    } else {
      Log.e(LOG_TAG, "Error: The requested service doesn't " +
              "exist, or this client isn't allowed access to it.");
    }
  }

  // a callback to be called from service
  private Messenger incomingMessenger = new Messenger(new Handler(new Handler.Callback() {
    @Override
    public boolean handleMessage(Message msg) {
//                        Log.d(LOG_TAG, "msg reply received, type: " + msg.what);
      if (msg.what == ForegroundService.MSG_PING) {
        Log.e(LOG_TAG, "ping from service");
      }

      return true;
    }
  }));

  // pass incomingHandlerCallback to service
  // service will call this callback and receive data back
  private void initIncomingHandlerCallback() {
    if (foregroundService != null) {
      try {
//                Messenger respMessenger = new Messenger(new Handler(incomingHandlerCallback));

        // create new message
        Message msg = Message.obtain(null,
                ForegroundService.MSG_PING);
        // service will extract and save this respMessenger for further communication
        msg.replyTo = incomingMessenger;
        foregroundService.send(msg);
      } catch (RemoteException e) {
        Log.e(LOG_TAG, "initIncomingHandlerCallback exception");
        Log.e(LOG_TAG, e.getMessage());
      }
    } else {
      Log.d(LOG_TAG, "main:initIncomingHandlerCallback");
    }
  }

  // todo implement timeout
  private void sendRequest(String method, byte[] args, MethodChannel.Result result) {
//        Log.d(LOG_TAG, "main:sendRequest:method=" + method);
    if (foregroundService != null) {
      try {
        // called when reply received from service
        // this messenger is sent to the service. the service use this messenger to reply to the requester
        // we're creating new messenger for each call so the caller will get the right response corresponding to caller's request
        Handler.Callback callback = new Handler.Callback() {
          @Override
          public boolean handleMessage(Message msg) {
//                        Log.d(LOG_TAG, "msg reply received, type: " + msg.what);
            if (msg.what == ForegroundService.MSG_RESPONSE) {
              // extract data and pass back to flutter
              Bundle msgData = msg.getData();

              String resultType = msgData.getString("type");

              if (resultType.equals("error")) {
                String errorMsg = msgData.getString("message");
                result.error("call_native", errorMsg, null);
              }
              if (resultType.equals("success")) {
                byte[] resultData = msgData.getByteArray("data");
                result.success(resultData);
              }
            }

            return true;
          }
        };

        Messenger respMessenger = new Messenger(new Handler(callback));

        // create new message
        Message msg = Message.obtain(null,
                ForegroundService.MSG_REQUEST);
        msg.replyTo = respMessenger;
        // add data
        Bundle b = new Bundle();
        b.putString("method", method);
        b.putByteArray("args", args);
        msg.setData(b);
        // send message contain request's data to service
        foregroundService.send(msg);
//                Log.d(LOG_TAG, "main:sendRequest:method=" + method + "sent");
      } catch (RemoteException e) {
//                Log.e(LOG_TAG, e.getMessage());
      }
    } else {
//            Log.d(LOG_TAG, "main:sendRequest:service=null:method=" + method);
    }
  }

  private void sendRequest(String method, byte[] args) {
    // fire and forget, no need to get result back
//        Log.d(LOG_TAG, "main:sendRequest:method=" + method);
    if (foregroundService != null) {
      try {
        // create new message
        Message msg = Message.obtain(null,
                ForegroundService.MSG_REQUEST);
        // add data
        Bundle b = new Bundle();
        b.putString("method", method);
        b.putByteArray("args", args);
        msg.setData(b);
        // send message contain request's data to service
        foregroundService.send(msg);
//                Log.d(LOG_TAG, "main:sendRequest:method=" + method + "sent");
      } catch (RemoteException e) {
//                Log.e(LOG_TAG, e.getMessage());
      }
    } else {
//            Log.d(LOG_TAG, "main:sendRequest:service=null:method=" + method);
    }
  }

  private void sendRequest(String method) {
    // fire and forget, no need to get result back
//        Log.d(LOG_TAG, "main:sendRequest:method=" + method);
    if (foregroundService != null) {
      try {
        // create new message
        Message msg = Message.obtain(null,
                ForegroundService.MSG_REQUEST);
        // add data
        Bundle b = new Bundle();
        b.putString("method", method);
        msg.setData(b);
        // send message contain request's data to service
        foregroundService.send(msg);
//                Log.d(LOG_TAG, "main:sendRequest:method=" + method + "sent");
      } catch (RemoteException e) {
        Log.e(LOG_TAG, e.getMessage());
      }
    } else {
      Log.d(LOG_TAG, "main:sendRequest:service=null:method=" + method);
    }
  }

  private void requestStopService() {
    if (foregroundService != null) {
      try {
        // create new message
        Message msg = Message.obtain(null,
                ForegroundService.MSG_STOP_SERVICE);
        foregroundService.send(msg);
        Log.d(LOG_TAG, "requestStopService sent");
      } catch (RemoteException e) {
        Log.e(LOG_TAG, e.getMessage());
      }
    }
  }

  /**
   * Release memory when the UI becomes hidden or when system resources become low.
   *
   * @param level the memory-related event that was raised.
   */
  public void onTrimMemory(int level) {
    // Determine which lifecycle or system event was raised.
    // force restart to release some memory
    switch (level) {

      case ComponentCallbacks2.TRIM_MEMORY_RUNNING_LOW:
        sendRequest("force_restart");
        break;
      case ComponentCallbacks2.TRIM_MEMORY_RUNNING_CRITICAL:
        sendRequest("force_restart");
        break;

      case ComponentCallbacks2.TRIM_MEMORY_COMPLETE:
        sendRequest("force_restart");
        break;
      default:
                /*
                  Release any non-critical data structures.

                  The app received an unrecognized memory level value
                  from the system. Treat this as a generic low-memory message.
                */
        break;
    }
  }

}
