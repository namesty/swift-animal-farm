import Foundation

struct FunctionsTable {
    let speak: @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>) -> Void = { animalPtr, messagePtr in
        let length = strlen(messagePtr)
        let buffer = UnsafeBufferPointer(
                start: messagePtr.withMemoryRebound(to: UInt8.self, capacity: length) { $0 },
                count: length
        )
        let message = String(decoding: buffer, as: UTF8.self)
        let animal = Unmanaged<AnyObject>.fromOpaque(animalPtr).takeUnretainedValue() as! Animal
        animal.speak(message: message)
    }
}
