//
//  TodoItem.swift
//  todotdd
//
//  Created by kevin on 07/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation


struct TodoItem {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title:String, itemDescription:String? = nil, timestamp:Double? = nil, location: Location? = nil) {
       self.title = title
       self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}
