//
//  Order.swift
//  AgriUber
//
//  Created by Nguyen Xuan Phu on 4/2/21.
//  Copyright © 2021 Nguyen Xuan Phu. All rights reserved.
//

import Foundation

class Order {
    
    var order_id: String
    var date_time: String
    var state: String
    var start_location: String
    var end_location: String
    
    init(order_id: String ,date_time: String, state: String, start_location: String, end_location: String
) {
        self.order_id = order_id
        self.date_time = date_time
        self.state = state
        self.start_location = start_location
        self.end_location = end_location
    }
}
