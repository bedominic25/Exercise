//
//  ViewController.swift
//  CourseFlight
//
//  Created by 1800 on 1/18/18.
//  Copyright © 2018 1800. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var tableView: UITableView!
    
    var flights = [Flights]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        downloadJSON {
            //reloadview after download json
            self.tableView.reloadData()
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDescription", sender: self)
    }
    
    //pass flight info from cell to next view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DescriptionViewController {
            destination.flight = flights[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    //set cell Row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = String(flights[indexPath.row].id)
        
        cell.textLabel?.layer.cornerRadius = (cell.textLabel?.frame.height)! / 2
        
        return cell
    }
    
    // download JSON
    func downloadJSON (completed: @escaping () -> ()) {
        
        let jsonUrlString = "https://glacial-caverns-15124.herokuapp.com/flights/all"
        let url = URL(string: jsonUrlString)
        
        //parse json
        URLSession.shared.dataTask(with: url!) {(data, response, error ) in
            
            if error == nil {
                do {
                    self.flights = try JSONDecoder().decode([Flights].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                } catch {
                    print("JSON error")
                }
            }
            
        }.resume()
    }


}




