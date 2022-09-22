//
//  main.swift
//  Marvel-Shop
//
//  Created by Bartu Gençcan on 22.09.2022.
//

import Foundation


print("Please enter your name.")
var name = readLine()?.lowercased()

print("Please enter your gender.")
var gender = readLine()?.lowercased()

print("Please enter your age.")
var age = readLine()?.lowercased()

print("Please enter your job.")
var job = readLine()?.lowercased()

print("Please enter your budget.")
var budget = readLine()

var user = Character(name: name!,gender: gender!, age: age!, job: job!, budget: budget!)

print("So your Name: \(user.name), Gender: \(user.gender), Age:\(user.age), Job: \(user.job). Is this correct y/n?")

var isCorrect = readLine()?.lowercased()

if(isCorrect == "y"){
    switch user.gender {
    case "Male":
        print("Welcome sir!")
    case "Female":
        print("Welcome madam!")
    default:
        break
    }
}else if(isCorrect == "n") {
    print("Please restart the app.")
}

print("We have these items in our shop right now.")

if(user.job == "hero"){
    for item in Item.heroItemArray {
        print("\(item.name)")
    }
}else {
    for item in Item.villainItemArray {
        print("\(item.name)")
    }
}




