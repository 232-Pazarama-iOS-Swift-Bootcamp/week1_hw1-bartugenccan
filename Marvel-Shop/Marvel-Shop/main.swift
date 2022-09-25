
//
//  newShop.swift
//  Marvel-Shop
//
//  Created by Bartu Gençcan on 25.09.2022.
//

import Foundation

var user: Character?
var cart: [Item]?
var shop: [Item]?
var personalItem: Item?

// Heros
var ironman = Character(index:"0", name: "Tony Stark", gender: "Male", age: "52", job: "Hero", budget: "5000")
var captainAmerica = Character(index:"1", name: "Steve Rogers", gender: "Male", age: "102", job: "Hero", budget: "1000")
var spiderman = Character(index:"2", name: "Peter Parker", gender: "Male", age: "16", job: "Hero", budget: "900")

// Villians
var thanos = Character(index:"3", name: "Thanos", gender: "Male", age: "1000", job: "Villain", budget: "99999")
var greenGoblin = Character(index:"4", name: "Norman Osborn", gender: "Male", age: "50", job: "Villain", budget: "5000")
var vulture = Character(index:"5", name: "Adrian Toomes", gender: "Male", age: "76", job: "Villain", budget: "1000")

// Hero Items
var shield = Item(index:"1", name: "Vibranium Shield", forWho: "Steve Rogers", price: "1000", description: "This shield is composed of a unique combination of Vibranium, steel alloy and a unknown third catalyst, that has never been duplicated, called Proto-Adamantium.")
var webShooter = Item(index:"2", name: "Web Shooters", forWho: "Peter Parker", price: "750", description: "Spider-Man's web-shooters are twin devices, which he wears on his wrists beneath the gauntlets of his costume, that can shoot thin strands of a special web fluid at high pressure.")
var markArmor = Item(index:"0", name: "Mark IV Armor", forWho: "Tony Stark", price: "2500", description: "The Mark LXXXV (Mark 85) is Tony Stark's eighty-fifth, final and ultimate Iron Man Armor. The armor is equipped with enhanced nano-structure and is exceptionally more durable and efficient in combat than its base model the Mark L. ")

// Villain Items
var gauntlet = Item(index: "0", name: "Infinity Gauntlet", forWho: "Thanos", price: "999999999", description: "The Infinity Gauntlet was a powerful Dwarven-made Uru glove that was designed to channel the power of all six Infinity Stones.")
var pumpkinBombs = Item(index: "1", name: "Pumpkin Bombs", forWho: "Norman Osborn", price: "200", description: "The Pumpkin Bomb resembles a miniature Jack-o'-lantern and, when thrown, ignites almost soundlessly and produces enough heat to melt through a 3-inch (76 mm) thick sheet of steel. The Goblin stores these in his glider")
var wings = Item(index: "2", name: "Vulture Wings", forWho: "Adrian Toomes", price: "150", description: "Vulture's wings are capable of launching simple energized knife-like projectiles. Vulture's wings grants him airborne speeds of up to 95 mph and enhanced strength.")

var allCharacters: [Character] = [ironman, captainAmerica, spiderman, thanos, greenGoblin, vulture]
var allItems: [Item] = [markArmor,shield,webShooter,gauntlet,pumpkinBombs,wings]

var heroItemArray: [Item] = [markArmor,shield,webShooter]
var villainItemArray: [Item] = [gauntlet,pumpkinBombs,wings]

func discountItem(item: Item) -> String{
    var item = item
    item.price = String(Int(item.price)! - (Int(item.price)! / 25))
    
    return item.price
}

func personalShop(){
    if user?.job == "Villain"{
        for item in villainItemArray {
            if item.forWho == user?.name {
                if(item.name == "Infinity Gauntlet"){
                    personalItem = item
                    personalItem?.price = "0"
                    print("\(personalItem!.name) - \(personalItem!.price)$")
                }else {
                    personalItem = item
                    personalItem?.price = discountItem(item: item)
                    print("\(personalItem!.name) - \(personalItem!.price)$")
                }
            }
        }
    }else if user?.job == "Hero"{
        for item in heroItemArray {
            if item.forWho == user?.name {
                personalItem = item
                personalItem?.price = discountItem(item: item)
                print("\(personalItem!.name) - \(personalItem!.price)$")
            }
        }
    }
}

func marvelShop(){
    for item in allItems {
        print("\(item.name) - \(item.price)$")
        print("")
    }
}

func buyItem(item: Item) -> String{
    var newBudget = user?.budget
    newBudget = String(Int(user!.budget)! - Int(item.price)!)
    
    return newBudget!
}

func userOption(){
    print("Do you want to buy the item now or do you want to look at other items ? (You cannot buy them.)")
    print("")
    print("0 - Buy your item.")
    print("1 - Look at other items.")
    
    let option = readLine()?.lowercased()
    
    switch option {
    case "0":
        print("Your new budget is \(buyItem(item: personalItem!))$.")
        print("")
        print("Thank you for shopping from us!")
    case "1":
        marvelShop()
        userOption()
    default:
        print("Please select an available option")
        userOption()
    }
}


func selectCharacter(){
    for char in allCharacters {
        print("\(char.index)- \(char.name)")
    }
    let name = readLine()?.lowercased()
    
    switch name {
    case "0":
        user = ironman
    case "1":
        user = captainAmerica
    case "2":
        user = spiderman
    case "3":
        user = thanos
    case "4":
        user = greenGoblin
    case "5":
        user = vulture
    default:
        print("Please select an available option.")
        print("")
        selectCharacter()
    }
}

selectCharacter()

if user != nil {
    print("Your budget is \(user!.budget)$")
    print("")
    if(user!.name == "Thanos"){
        print("Infinty Gauntlet is ready to be used almighty Thanos!")
    }else {
        print("Here is the %25 discounted item for you \(user!.name)")
        print("")
    }
    personalShop()
    print("")
    userOption()
}
