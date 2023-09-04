//
//  Order.swift
//  OrderApp
//
//  Created by Julia Parker on 6/16/23.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
