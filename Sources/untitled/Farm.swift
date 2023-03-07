import Foundation

class Farm {
    let farmPtr: UnsafeMutableRawPointer

    init(functionsTable: FunctionsTable) {
        let functionsPtr = UnsafeMutableRawPointer.allocate(
                byteCount: MemoryLayout<FunctionsTable>.size,
                alignment: MemoryLayout<FunctionsTable>.alignment
        )
        functionsPtr.assumingMemoryBound(to: FunctionsTable.self).initialize(to: functionsTable)

        farmPtr = createFarmFunc(functionsPtr)
    }

    func addAnimal<T: AnyObject & Animal>(instance: T, name: String) {
        let animalPtr = Unmanaged.passRetained(instance).toOpaque()
        let animalNamePtr = name.withCString { $0 }
        addAnimalFunc(farmPtr, animalNamePtr, animalPtr)
    }

    func getAnimal<T: AnyObject & Animal>(name: String) -> T {
        let animalNamePtr = name.withCString { $0 }
        let animalPtr = getAnimalFunc(farmPtr, animalNamePtr)
        return Unmanaged<T>.fromOpaque(animalPtr).takeUnretainedValue()
    }

    func nativeSpeak(animalName: String, message: String) {
        let animalNamePtr = animalName.withCString { $0 }
        let messagePtr = message.withCString { $0 }

        nativeSpeakFunc(farmPtr, animalNamePtr, messagePtr)
    }
}