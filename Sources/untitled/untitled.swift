import Foundation

@main
public struct untitled {
    public static func main() {
        let farm = Farm()
        farm.addAnimal(instance: Cow(), name: "Bessie")
        farm.addAnimal(instance: Horse(), name: "Johnnie")

        let _: Cow = farm.getAnimal(name: "Bessie")
        let _: Horse = farm.getAnimal(name: "Johnnie")

        farm.nativeSpeak(animalName: "Bessie", message: "Hello MOOO")
    }
}