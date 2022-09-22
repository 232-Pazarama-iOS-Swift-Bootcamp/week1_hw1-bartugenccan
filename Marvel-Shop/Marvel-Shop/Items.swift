//
//  Items.swift
//  Marvel-Shop
//
//  Created by Bartu Gençcan on 22.09.2022.
//

import Foundation

struct Item {
    var name: String
    var forWho: String
    var price: String
    var description: String
    
    static var heroItemArray: [Item] = [Item(name: "Vibranium Shield", forWho: "Captain America", price: "1000",description: "This shield is composed of a unique combination of Vibranium, steel alloy and a unknown third catalyst, that has never been duplicated, called Proto-Adamantium."), Item(name: "Web Shooters", forWho: "Spider-Man", price: "750", description: "Spider-Man's web-shooters are twin devices, which he wears on his wrists beneath the gauntlets of his costume, that can shoot thin strands of a special web fluid at high pressure."), Item(name: "Mark IV Armor", forWho: "Iron Man", price: "2500", description: "The Mark LXXXV (Mark 85) is Tony Stark's eighty-fifth, final and ultimate Iron Man Armor. The armor is equipped with enhanced nano-structure and is exceptionally more durable and efficient in combat than its base model the Mark L. ")]
    
    static var villainItemArray: [Item] = [Item(name: "Infinity Gauntlet", forWho: "Thanos", price: "????",description: "The Infinity Gauntlet was a powerful Dwarven-made Uru glove that was designed to channel the power of all six Infinity Stones."), Item(name: "Vulture Wings", forWho: "Vulture", price: "700", description: "Vulture's wings are capable of launching simple energized knife-like projectiles. Vulture's wings grants him airborne speeds of up to 95 mph and enhanced strength."), Item(name: "Pumpkin Bomb", forWho: "Green Goblin", price: "150", description: "The Pumpkin Bomb resembles a miniature Jack-o'-lantern and, when thrown, ignites almost soundlessly and produces enough heat to melt through a 3-inch (76 mm) thick sheet of steel. The Goblin stores these in his glider.")]
}
