import Flutter
import UIKit
import NetworkExtension

public class VPNManagerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "vpn_manager", binaryMessenger: registrar.messenger())
        let instance = VPNManagerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "disconnectVPN" {
            let manager = NEVPNManager.shared()
            manager.connection.stopVPNTunnel()
            result(nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}