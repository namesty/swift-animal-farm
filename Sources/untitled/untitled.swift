import Foundation

protocol Animal {
    func speak(message: String);
}

class Cow: Animal {
    func speak(message: String) {
        print("Moo: " + message)
    }
}

class Horse: Animal {
    func speak(message: String) {
        print("Yeee ha: " + message)
    }
}

func native_speak(
        context: UnsafeMutableRawPointer,
        message: UnsafePointer<Int8>
) {
    let instance = Unmanaged<AnyObject>.fromOpaque(context).takeUnretainedValue() as! Animal
    let length = strlen(message)
    let buffer = UnsafeBufferPointer(
            start: message.withMemoryRebound(to: UInt8.self, capacity: length) { $0 },
            count: length
    )
    let string = String(decoding: buffer, as: UTF8.self)

    instance.speak(message: string)
}

class Farm {
    var animals = [String: UnsafeMutableRawPointer]()

    init() { }

    func addAnimal<T: AnyObject & Animal>(instance: T, name: String) {
        let animalPtr = Unmanaged.passRetained(instance).toOpaque()
        animals[name] = animalPtr
    }

    func getAnimal<T: AnyObject & Animal>(name: String) -> T? {
        guard let ptr = animals[name] else {
            return nil
        }

        return Unmanaged<T>.fromOpaque(ptr).takeUnretainedValue()
    }
}

@main
public struct untitled {
    public static func main() {
        let farm = Farm()
        farm.addAnimal(instance: Cow(), name: "Bessie")
        farm.addAnimal(instance: Horse(), name: "Johnnie")

        if let cow: Cow = farm.getAnimal(name: "Bessie") {
            cow.speak(message: "Hello, world!")
        } else {
            print("No animal found with name 'Bessie'")
        }

        if let horse: Horse = farm.getAnimal(name: "Johnnie") {
            horse.speak(message: "Hello, world!")
        } else {
            print("No animal found with name 'Johnnie'")
        }
    }
}