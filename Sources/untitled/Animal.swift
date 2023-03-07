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