//
//  DescriptionViewController.swift
//  CourseFlight
//
//  Created by 1800 on 1/18/18.
//  Copyright © 2018 1800. All rights reserved.
//

import UIKit

//

class DescriptionViewController: UIViewController {

    @IBOutlet var lblDeparture: UILabel!
    
    @IBOutlet var lblAirlineCode: UILabel!
    
    @IBOutlet var lblFlightNumber: UILabel!
    
    @IBOutlet var lblDepartureCity: UILabel!
    
    @IBOutlet var lblDepartureAirport: UILabel!
    
    @IBOutlet var lblArrivalAirport: UILabel!
    
    
    var flight:Flights?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        lblDeparture.text = flight?.departure_date
        lblAirlineCode.text = flight?.airline_code
        lblFlightNumber.text = flight?.flight_number
        lblDepartureCity.text = flight?.departure_city
        lblDepartureAirport.text = flight?.departure_airport
        lblArrivalAirport.text = flight?.arrival_airport
    
    }
  

}
