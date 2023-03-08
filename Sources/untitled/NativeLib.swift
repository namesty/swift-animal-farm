import Foundation
import Glibc

let NativeLib = dlopen("/path/to/libanimal_farm.so", RTLD_NOW)!

typealias AddAnimalFunc = @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>, UnsafeRawPointer) -> Void
let addAnimalSymbol = dlsym(NativeLib, "add_animal")
let addAnimalFunc = unsafeBitCast(addAnimalSymbol, to: AddAnimalFunc.self)

typealias NativeSpeakFunc = @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>, UnsafePointer<Int8>) -> Void
let nativeSpeakSymbol = dlsym(NativeLib, "native_speak")
let nativeSpeakFunc = unsafeBitCast(nativeSpeakSymbol, to: NativeSpeakFunc.self)

typealias GetAnimalFunc = @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>) -> UnsafeRawPointer
let getAnimalSymbol = dlsym(NativeLib, "get_animal")
let getAnimalFunc = unsafeBitCast(getAnimalSymbol, to: GetAnimalFunc.self)

typealias CreateFarmFunc = @convention(c) (UnsafeMutableRawPointer) -> UnsafeMutableRawPointer
let createFarmSymbol = dlsym(NativeLib, "create_farm")
let createFarmFunc = unsafeBitCast(createFarmSymbol, to: CreateFarmFunc.self)
