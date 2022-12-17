import Foundation

@objc public class AudioPermissions: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
