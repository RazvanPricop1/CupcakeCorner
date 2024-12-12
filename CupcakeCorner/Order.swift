//
//  Order.swift
//  CupcakeCorner
//
//  Created by Razvan Pricop on 04.11.24.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type = 0
    var quantity = 0
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        loadFromDefaults()
    }
    
    func loadFromDefaults() {
        let defaults = UserDefaults.standard
        name = defaults.string(forKey: "name") ?? ""
        streetAddress = defaults.string(forKey: "streetAddress") ?? ""
        city = defaults.string(forKey: "city") ?? ""
        zip = defaults.string(forKey: "zip") ?? ""
        print("a")
    }
    
    func saveToDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "name")
        defaults.set(streetAddress, forKey: "streetAddress")
        defaults.set(city, forKey: "city")
        defaults.set(zip, forKey: "zip")
        print("b")
        
        //TODO: Fix the numerous calls to this function
    }
}
