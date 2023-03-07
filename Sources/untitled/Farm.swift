import Foundation

class Farm {
    let farmPtr: UnsafeMutableRawPointer

    init() {
        functionsPtr.initialize(to: functionsMap as! NSMutableDictionary)
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
        Unmanaged<T>.fromOpaque(animalPtr).takeUnretainedValue()
    }

    func nativeSpeak(animalName: String, message: String) {
        let animalNamePtr = animalName.withCString { $0 }
        let messagePtr = message.withCString { $0 }

        nativeSpeakFunc(farmPtr, animalNamePtr, messagePtr)
    }
}