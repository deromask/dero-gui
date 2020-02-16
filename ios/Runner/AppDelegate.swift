import UIKit
import Flutter
import Derocore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let derocore = DerocoreRPC();
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let derocoreChannel = FlutterMethodChannel(name: "io.deromask.deromob", binaryMessenger: controller.binaryMessenger)
    
    derocoreChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // Note: this method is invoked on the UI thread.
        guard call.method == "call_native" else {
            result(FlutterMethodNotImplemented)
            return
        }
        
        guard let callArgs = call.arguments else {
            result("iOS could not recognize flutter arguments in method: (callNative)")
            return
        }
        
        if let unpackedCallArgs = callArgs as? [String: Any],
            let method = unpackedCallArgs["method"] as? String,
            let args_flutter = unpackedCallArgs["args"] as? FlutterStandardTypedData {
            //            let args_byte = Data(args_flutter.data)
            let args_byte = args_flutter.data as Data
            //            var args_byte = [UInt8](args_flutter.data)
            do {
                let derocoreResult = try self!.derocore!.callNative(method, args: args_byte)
                let resultBytes = FlutterStandardTypedData(bytes: derocoreResult)
                result(resultBytes)
            } catch let error {
                result(FlutterError(code: "native_exception",
                                    message: error.localizedDescription,
                                    details: nil))
            }
        } else {
            result("iOS could not extract flutter arguments in method: (sendParams)")
        }
        
        result("end of line function")
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func applicationWillResignActive(_ application: UIApplication) {
        // save wallet and release memory
        self.derocore!.cleanUp()
    }
    
}
