//
//  ShoppingCart.swift
//  flowerFinal
//
//  Created by Nermin Dedovic on 3/10/20.
//  Copyright © 2020 Nermin Dedovic. All rights reserved.
//

import Foundation




class ShoppingCart {
    
    
    var dic : [String : Int]
    var flowersByPrice : [String : Int]
    var size : Int
    
    
    init() {
        self.dic = [String : Int]()
        self.flowersByPrice = [String : Int]()
        self.size = 0
    }
    
    func addToCart(flower : Flower, quantity: Int) {
        if dic[flower.name] != nil {
            dic[flower.name]! += quantity
        } else {
            dic[flower.name] = quantity
            flowersByPrice[flower.name] = flower.price
            size += 1
        }
            
    }
    
    func getPrice() -> Int {
        var price = 0
        for (flower, quantity) in dic {
             price += flowersByPrice[flower]! * quantity
        }
        return price
    }
    
    
    func outputCartInfo() -> String {
        var output : String = ""
        
        if self.size == 0 {
            return "No items have been added to the shopping cart, add some items!"
        }
        
        for (flower, quantity) in dic  {
            let str1 = flower.padding(toLength: 15, withPad: "-", startingAt: 0)
            let x = String(quantity) + "x"
            let str2 = x.padding(toLength: 7, withPad: " ", startingAt: 0)
            let y =  String(flowersByPrice[flower]!) + "$"
            let str3 = y.padding(toLength: 7, withPad: " ", startingAt: 0)
            output += str1 + str2 + str3
            output += "\n \n"
        }
        
        return output
        
    }
    
    func getKeys() -> [String] {
        var x : [String] = []
        for key in dic.keys {
            x.append(key)
        }
        return x
    }
    
    func getKeys2() -> [String] {
        var x : [String] = []
        x.append("---")
        for key in dic.keys {
            x.append(key)
        }
        return x
    }
    
    func removeFromCart(flower : String) {
        if flower == "---" || size == 0 {
             return
        }
        
        if dic[flower] != nil {
            dic.remove(at: dic.index(forKey: flower)!)
            flowersByPrice.remove(at: flowersByPrice.index(forKey: flower)!)
            size -= 1
        }
        
    }
    
    func clearCart() {
        dic.removeAll()
        flowersByPrice.removeAll()
        size = 0
    }
    
    
    
    
    
}


