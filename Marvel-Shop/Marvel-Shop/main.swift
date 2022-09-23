//
//  main.swift
//  Marvel-Shop
//
//  Created by Bartu Gençcan on 22.09.2022.
//

import Foundation

var user: Character?
var selectedItem: Item?
var cart: [Item]?

// Hero Items
var shield = Item(index:"1", name: "Vibranium Shield", forWho: "Captain America", price: "1000", description: "This shield is composed of a unique combination of Vibranium, steel alloy and a unknown third catalyst, that has never been duplicated, called Proto-Adamantium.")
var webShooter = Item(index:"2", name: "Web Shooters", forWho: "Spider-Man", price: "750", description: "Spider-Man's web-shooters are twin devices, which he wears on his wrists beneath the gauntlets of his costume, that can shoot thin strands of a special web fluid at high pressure.")
var markArmor = Item(index:"0", name: "Mark IV Armor", forWho: "Iron Man", price: "2500", description: "The Mark LXXXV (Mark 85) is Tony Stark's eighty-fifth, final and ultimate Iron Man Armor. The armor is equipped with enhanced nano-structure and is exceptionally more durable and efficient in combat than its base model the Mark L. ")

// Villain Items
var gauntlet = Item(index: "0", name: "Infinity Gauntlet", forWho: "Thanos", price: "999999999", description: "The Infinity Gauntlet was a powerful Dwarven-made Uru glove that was designed to channel the power of all six Infinity Stones.")
var pumpkinBombs = Item(index: "1", name: "Pumpkin Bombs", forWho: "Green Goblin", price: "200", description: "The Pumpkin Bomb resembles a miniature Jack-o'-lantern and, when thrown, ignites almost soundlessly and produces enough heat to melt through a 3-inch (76 mm) thick sheet of steel. The Goblin stores these in his glider")
var wings = Item(index: "2", name: "Vulture Wings", forWho: "Vulture", price: "150", description: "Vulture's wings are capable of launching simple energized knife-like projectiles. Vulture's wings grants him airborne speeds of up to 95 mph and enhanced strength.")


var heroItemArray: [Item] = [markArmor,shield,webShooter]
var villainItemArray: [Item] = [gauntlet,pumpkinBombs,wings]

func failedEntry() -> Void{
    print("Please enter an available option.")
}

func heroDiscount(item: Item, index: Int) -> [Item]{
    var discountedItem = item
    discountedItem.price = String(Int(item.price)! - (Int(item.price)! / 25))
    
    heroItemArray.remove(at: index)
    heroItemArray.append(discountedItem)
    
    return heroItemArray
}

func villainDiscount(item: Item, index: Int) -> [Item]{
    var discountedItem = item
    discountedItem.price = String(Int(item.price)! - (Int(item.price)! / 25))
    
    villainItemArray.remove(at: index)
    villainItemArray.append(discountedItem)
    
    return villainItemArray
}

func addToCart(item: Item) {
    cart?.append(item)
    
}

func newBudget(item: Item) -> String{
    var userBudget = user?.budget
    
    if let budget = Int(user!.budget){
        if let price = Int(item.price){
            userBudget = String(budget - price)
        }
    }
    
    return userBudget!
}

func removedArray(itemArray: [Item], index: String) -> [Item]{
    var newArray = itemArray
    newArray.remove(at: Int(index)!)
    
    return newArray
}

print("Please select a character.")
print("0 - Iron Man")
print("1 - Captain America")
print("2 - Spider-man")
print("3 - Thanos")
print("4 - Vulture")
print("5 - Green Goblin")
var name = readLine()?.lowercased()

switch name {
case "0":
    print("")
    print("Welcome Mr.Stark.")
    user = Character(name: "Tony Stark", gender: "Male", age: "52", job: "Hero", budget: "10000")
case "1":
    print("")
    print("Welcome Mr.Rogers")
    user = Character(name: "Steve Rogers", gender: "Male", age: "104", job: "Hero", budget: "700")
case "2":
    print("")
    print("Welcome Mr.Parker")
    user = Character(name: "Peter Parker", gender: "Male", age: "20", job: "Hero", budget: "500")
case "3":
    print("")
    print("Welcome Thanos")
    user = Character(name: "Thanos", gender: "Male", age: "1000", job: "Villain", budget: "99999")
case "4":
    print("")
    print("Welcome Mr.Toomes")
    user = Character(name: "Adrian Toomes", gender: "Male", age: "76", job: "Villain", budget: "400")
case "5":
    print("")
    print("Welcome Mr.Osborn")
    user = Character(name: "Norman Osborn", gender: "Male", age: "40", job: "Hero", budget: "7000")
default:
    break
}

print("")

if let user = user {
    if(user.job == "Hero"){
        switch user.name {
        case "Tony Stark":
            print("Mark IV Armor is discounted %25 for you Mr.Stark!")
            print("")
            for item in heroDiscount(item: markArmor, index: 0) {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Mr.Stark.")
        case "Steve Rogers":
            print("Vibranium Shield is discounted %25 for you Mr.Rogers!")
            print("")
            for item in heroDiscount(item: shield, index: 1) {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Mr.Rogers.")
        case "Peter Parker":
            print("Web Shooters are discounted %25 for you Mr.Parker!")
            print("")
            for item in heroDiscount(item: webShooter, index: 2) {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Mr.Parker.")
        default:
            break
        }
    }
    else if(user.job == "Villain"){
        switch user.name {
        case "Thanos":
            print("Infinity Gauntlet is free for you almighty Thanos!")
            print("")
            villainItemArray[0].price = "0"
            for item in villainItemArray {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Thanos.")
        case "Adrian Toomes":
            print("Vulture Wings are discounted %25 for you Mr.Toomes!")
            print("")
            for item in villainDiscount(item: wings, index: 2) {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Mr.Toomes.")
        case "Norman Osborn":
            print("Pumpkin Bombs are discounted %25 for you Mr.Osborn!")
            print("")
            for item in villainDiscount(item: pumpkinBombs, index: 1) {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Mr.Osborn.")
        default:
            break
        }
    }
    print("")
    print("Your budget is \(user.budget)")
    
    let selectedIndex = readLine()
    print("")
    
    if user.job == "Hero" {
        switch selectedIndex {
        case "0":
            selectedItem = markArmor
        case "1":
            selectedItem = shield
        case "2":
            selectedItem = webShooter
        default:
            break
        }
    }else if(user.job == "Villain"){
        switch selectedIndex {
        case "0":
            selectedItem = gauntlet
        case "1":
            selectedItem = pumpkinBombs
        case "2":
            selectedItem = wings
        default:
            break
        }
    }
    if let selectedItem = selectedItem {
        cart = []
        if cart != nil {
            addToCart(item: selectedItem)
            print("")
        }
        print("\(selectedItem.name) has been added to your cart \(user.name).")
        print("")
        print("Your new budget is \(newBudget(item: selectedItem))")
        print("")
    }
}

print("1- Cart")
print("2- Shop")
var selectedOption = readLine()

switch selectedOption {
    
    case "1":
    for item in cart! {
        print("\(item.name)")
    }
    
    default:
        break
}





