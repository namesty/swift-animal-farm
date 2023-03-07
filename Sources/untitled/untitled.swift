import Foundation

@main
public struct untitled {
    public static func main() {
        var functionsTable = FunctionsTable()
        let farm = Farm(functionsTable: functionsTable)
        farm.addAnimal(instance: Cow(), name: "Bessie")
        farm.addAnimal(instance: Horse(), name: "Johnnie")

        let _: Cow = farm.getAnimal(name: "Bessie")
        let _: Horse = farm.getAnimal(name: "Johnnie")

        farm.nativeSpeak(animalName: "Bessie", message: "Hello MOOO")
    }
}