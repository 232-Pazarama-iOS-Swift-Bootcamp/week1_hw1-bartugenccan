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

// Items
var shield = Item(index:"0", name: "Vibranium Shield", forWho: "Captain America", price: "1000", description: "This shield is composed of a unique combination of Vibranium, steel alloy and a unknown third catalyst, that has never been duplicated, called Proto-Adamantium.")
var webShooter = Item(index:"1", name: "Web Shooters", forWho: "Spider-Man", price: "750", description: "Spider-Man's web-shooters are twin devices, which he wears on his wrists beneath the gauntlets of his costume, that can shoot thin strands of a special web fluid at high pressure.")
var markArmor = Item(index:"2", name: "Mark IV Armor", forWho: "Iron Man", price: "2500", description: "The Mark LXXXV (Mark 85) is Tony Stark's eighty-fifth, final and ultimate Iron Man Armor. The armor is equipped with enhanced nano-structure and is exceptionally more durable and efficient in combat than its base model the Mark L. ")

var heroItemArray: [Item]

func failedEntry() -> Void{
    print("Please enter an available option.")
}

func discount(item: Item) -> String{
    let result = String(Int(item.price)! - (Int(item.price)! / 25))
    return result
}

func addToCart(item: Item){
    cart?.append(item)
}

func removedArray(itemArray: [Item], index: String) -> [Item]{
    var newArray = itemArray
    newArray.remove(at: Int(index)!)
    
    return newArray
}

print("Please select a hero.")
print("0 - Iron Man")
print("1 - Captain America")
print("2 - Spider-man")
var name = readLine()?.lowercased()

switch name {
case "0":
    print("")
    print("Welcome Mr.Stark.")
    user = Character(name: "Tony Stark", gender: "Male", age: "52", job: "Hero", budget: "10000")
case "1":
    print("")
    print("Welcome Mr.Rogers")
    user = Character(name: "Steve Rogers", gender: "Male", age: "104", job: "Hero", budget: "500")
case "2":
    print("")
    print("Welcome Mr.Parker")
    user = Character(name: "Peter Parker", gender: "Male", age: "20", job: "Hero", budget: "250")
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
            markArmor.price = discount(item: markArmor)
            heroItemArray = [shield, webShooter, markArmor]
            for item in heroItemArray {
                print("\(item.name) - \(item.price)")
                print("")
            }
        case "Steve Rogers":
            print("Vibranium Shield is discounted %25 for you Mr.Rogers!")
            print("")
            shield.price = discount(item: shield)
            heroItemArray = [shield, webShooter, markArmor]
            for item in heroItemArray {
                print("\(item.name) - \(item.price)")
                print("")
            }
        case "Peter Parker":
            print("Web Shooters are discounted %25 for you Mr.Parker!")
            print("")
            webShooter.price = discount(item: webShooter)
            heroItemArray = [shield, webShooter, markArmor]
            for item in heroItemArray {
                print("\(item.index)- \(item.name) - \(item.price)")
                print("")
            }
            print("Please select an item to add to your cart Mr.Parker.")
            print("")
            let selectedIndex = readLine()
            
            switch selectedIndex {
            case "0":
                selectedItem = shield
            case "1":
                selectedItem = webShooter
            case "2":
                selectedItem = markArmor
            default:
                break
            }
            
            if let selectedItem = selectedItem {
                cart = []
                if cart != nil {
                    addToCart(item: selectedItem)
                }
                let removedList = removedArray(itemArray: heroItemArray, index: selectedIndex!)
                print("\(selectedItem.name) has been added to your cart Mr.Parker.")
                print("")
                print("Updated Shop")
                for item in removedList {
                    print("\(item.index)- \(item.name) - \(item.price)")
                }
            }
        default:
            break
        }
    }
}





