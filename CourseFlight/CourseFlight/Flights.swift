//
//  Flights.swift
//  CourseFlight
//
//  Created by 1800 on 1/18/18.
//  Copyright © 2018 1800. All rights reserved.
//

import Foundation

//ModalView - setting up data structure

struct Flights:Decodable {
    let id: Int
    let departure_date: String
    let airline_code: String
    let flight_number: String
    let departure_city: String
    let departure_airport: String
    let arrival_city: String
    let arrival_airport: String
    let scheduled_duration: String
    let arrival_date: String
    let created_at: String
    let updated_at: String
    
    
}
