import Foundation

typealias HostFunction = ([UnsafeMutableRawPointer]) -> Void
let functionsMap: [String: HostFunction] = [
    "speak": {
        args in
        let animal_ptr = args[0]
        let message_ptr = args[1]
        let length = strlen(message_ptr)
        let buffer = UnsafeBufferPointer(
                start: message_ptr.withMemoryRebound(to: UInt8.self, capacity: length) { $0 },
                count: length
        )
        let message = String(decoding: buffer, as: UTF8.self)
        let animal = Unmanaged<AnyObject>.fromOpaque(animal_ptr).takeUnretainedValue() as! Animal
        animal.speak(message: message)
    }
]

let functionsPtr = UnsafeMutablePointer<NSMutableDictionary>.allocate(capacity: 1)