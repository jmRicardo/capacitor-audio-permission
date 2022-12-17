import Foundation
import Capacitor
import AVFoundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AudioPermissionsPlugin)
public class AudioPermissionsPlugin: CAPPlugin {
    private let implementation = AudioPermissions()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc override public func requestPermissions(_ call: CAPPluginCall) {
        Task(priority: .background) {
                guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                    call.resolve(["status": "denied"])
                    return
                }
        }
        call.resolve(["status": "granted"])
    }
    
    @objc override public func checkPermissions(_ call: CAPPluginCall) {
        let recordPermission = AVAudioSession.sharedInstance().recordPermission;
        
        var recordState: String;
        
        switch recordPermission {
        case .denied:
            recordState = "denied"
        case .granted:
            recordState = "granted"
        case .undetermined:
            recordState = "undetermined"
        @unknown default:
            recordState = "undetermined"
        }
        
        call.resolve(["status": recordState])
    }
    


}

extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}
