import Foundation
import Glibc

let nativeLib = dlopen("/path/to/libmyrustlib.so", RTLD_NOW)!

typealias AddAnimalFunc = @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>, UnsafeRawPointer) -> Void
let addAnimalSymbol = dlsym(nativeLib, "add_animal")
let addAnimalFunc = unsafeBitCast(addAnimalSymbol, to: AddAnimalFunc.self)

typealias NativeSpeakFunc = @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>, UnsafePointer<Int8>) -> Void
let nativeSpeakSymbol = dlsym(nativeLib, "native_speak")
let nativeSpeakFunc = unsafeBitCast(nativeSpeakSymbol, to: NativeSpeakFunc.self)

typealias GetAnimalFunc = @convention(c) (UnsafeRawPointer, UnsafePointer<Int8>) -> UnsafeRawPointer
let getAnimalSymbol = dlsym(nativeLib, "native_speak")
let getAnimalFunc = unsafeBitCast(getAnimalSymbol, to: GetAnimalFunc.self)

typealias CreateFarmFunc = (UnsafeMutablePointer<NSDictionary>?) -> UnsafeMutableRawPointer
let createFarmSymbol = dlsym(nativeLib, "native_speak")
let createFarmFunc = unsafeBitCast(createFarmSymbol, to: CreateFarmFunc.self)
