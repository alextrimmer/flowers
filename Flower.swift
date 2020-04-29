//
//  Flower.swift
//  flowerFinal
//
//  Created by Nermin Dedovic on 3/9/20.
//  Copyright © 2020 Nermin Dedovic. All rights reserved.
//

import Foundation
import UIKit.UIImage

let flowers : [Flower] = [
    
    Flower(name: "Salmonberry", type: .rose, description: "A beautiful purple flower that glistens in the rain. These rare beauties can only be found three months of the year, after a week-long torrent drenches the Arizona desert. Many have died from heat exhaustion in search of them.", science: "Rubus spectabilis" , price: 5, image: UIImage(named: "RosaSalmonberry")!),
    Flower(name: "Mountain Aven", type: .rose, description: "The perfect flower for living rooms and bathrooms. Rumors say a bumblebee hides in each flower, waiting to attack the one who buys it. Have no fear - Flowers R Us can confirm our avens are bee free!", science: "Dryas octopetala" , price: 3, image: UIImage(named: "RosaMountainAvens")!),
    Flower(name: "Rose", type: .rose, description: "The classic rose. Many a heart has been taken by its thorns. It is the flower that both draws blood and makes the heart beat, and generations to come will share our fascination with it.", science: "Rosa" , price: 6, image: UIImage(named: "Rose")!),
    
    
    Flower(name: "Marigold", type: .daisy, description: "Many have swooned the one they love with marigolds. We give you - our valued customers - the Flowers R Us promise: they will love our precious, orange marigolds.", science: "Calendula officials" , price: 5, image: UIImage(named: "Marigold")!),
    Flower(name: "Waterlily", type: .daisy, description: "No life is complete without a waterlily. Why? These beautiful flowers are known to bring prosperity and wealth to any home that houses them.", science: "Waterlily" , price: 2, image: UIImage(named: "Waterlily")!),
    Flower(name: "Mum", type: .daisy, description: "These rare white mums were harvested from Everest’s slopes. Many a sly investor has attempted to climb it in search of these beauties, but many die on the way up - and the most unlucky die on the way back down. As such, only sherpas are allowed to pick these impossibly rare flowers.", science: "Chrysanthemums" , price: 12, image: UIImage(named: "Whitechrysanthemum")!),
    
    
    
    Flower(name: "Sky Lupine", type: .legume, description: "Named the sky lupine for its uncanny knack of growing on the slopes of mountains, these rare flowers are often sold at caravans and market stalls. The lupine’s gentle buds will fill with your garden with life and are heralded for their good luck.", science: "Lupinus Nanus" , price: 5, image: UIImage(named: "SkyLupine")!),
    Flower(name: "Calliandra", type: .legume, description: "A rare flower farmed from the depths of the rainforest. Many have perished at the claws of tigers and other poisons of the forest, but those who buy calliandras turn a blind eye, preferring to let nature run its due course on those foolish enough to pick them.", science: "Calliandra emarginata" , price: 14, image: UIImage(named: "Calliandra")!),
    Flower(name: "Sickle", type: .legume, description: "The pollen from this flower will attract friendly bugs to play. Ladybugs are known to gather on its stem. Our sickles are the perfect outdoor flower.", science: "Dichrostachys cinerea" , price: 4, image: UIImage(named: "sickle")!),
    
    
    Flower(name: "Lily", type: .lily, description: "Everybody’s favorite flower - but don't let that fool you. There's a reason many beautiful women are named after it, and there are just as many beautiful women waiting to enter your life when you give them one.", science: "Lilium" , price: 3, image: UIImage(named: "Lily")!),
    Flower(name: "Tulip", type: .lily, description: "A great addition to windowsills and ledges, the tulip is a ubiquitous flower. Rarely do homes lack one, and most gardens are filled with a bushel or two. Add these to your cart now and you can turn your shrubberies into spectacles.", science: "Tulipa" , price: 3, image: UIImage(named: "Tulip")!),
    Flower(name: "Mariposa", type: .lily, description: "Dazzle and hypnotize with these gorgeous petals. The mariposa is most famous for leading famed 1960's actor Dean Walsh to his death when he toppled from the Hollywood Cliffs while gazing at mariposas on one of his nightly walks.", science: "Calochortus" , price: 5, image: UIImage(named: "Mariposa")!)
    
        
]





class Flower {
    
    
    //FAMILYSHORT -> FAMILYLONG
    enum `Type`: String {
        case rose = "Rosaceae"
        case daisy = "Asteraceae"
        case legume = "Fabaceae"
        case lily = "Liliaceae"
    }
    
    
    var name: String
    var type: Type
    var description : String
    var family : String
    var science : String
    var price : Int
    var image : UIImage
    
    init(name: String, type: Type, description: String, science: String, price: Int, image: UIImage) {
        self.name = name
        self.type = type
        self.description = description
        self.family = self.type.rawValue
        self.science = science
        self.price = price
        self.image = image
    }
    
    
}
