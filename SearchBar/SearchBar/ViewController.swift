//
//  ViewController.swift
//  SearchBar
//
//  Created by Gaurang Patel on 10/07/17.
//  Copyright © 2017 Gaurang Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    var searchActive : Bool = false
    
    let states: [String] = ["Alaska","Alabama","Arkansas","American Samoa",
                  "Arizona",
                  "California",
                  "Colorado",
                  "Connecticut",
                  "District of Columbia",
                  "Delaware",
                  "Florida",
                  "Georgia",
                  "Guam",
                  "Hawaii",
                  "Iowa",
                  "Idaho",
                  "Illinois",
                  "Indiana",
                  "Kansas",
                  "Kentucky",
                  "Louisiana",
                  "Massachusetts",
                  "Maryland",
                  "Maine",
                  "Michigan",
                  "Minnesota",
                  "Missouri",
                  "Mississippi",
                  "Montana",
                  "North Carolina",
                  " North Dakota",
                  "Nebraska",
                  "New Hampshire",
                  "New Jersey",
                  "New Mexico",
                  "Nevada",
                  "New York",
                  "Ohio",
                  "Oklahoma",
                  "Oregon",
                  "Pennsylvania",
                  "Puerto Rico",
                  "Rhode Island",
                  "South Carolina",
                  "South Dakota",
                  "Tennessee",
                  "Texas",
                  "Utah",
                  "Virginia",
                  "Virgin Islands",
                  "Vermont",
                  "Washington",
                  "Wisconsin",
                  "West Virginia",
                  "Wyoming"]
    
    var states2 = [String]()
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return states2.count
        }
        else {
            return states.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searchActive {
            cell.textLabel?.text = states2[indexPath.row]
        } else
        {
        cell.textLabel?.text = states[indexPath.row]
        }
        return cell
    }
    
    
    // search bar
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if  searchText == "" {
            searchActive = false
            tableview.reloadData()
        } else {
            let search = searchText
            
            states2 = states.filter({ (s1 : String) -> Bool in
                  searchActive = true
                tableview.reloadData()
               //  return s1.hasPrefix(search)
            return s1.localizedCaseInsensitiveContains(search)
                
            })
            
            print(states2)
        }
        tableview.reloadData()
    
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
        view.endEditing(true)
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableview.reloadData()
        searchActive = false
    view.endEditing(true)
    }
    
    
    
    
    
    
    
    
}
/*
 let array1 = ["hello" , "hey" , "how are you" , "welcome" , "gujarat" , "goa" , "rajastan"]
 do {
 let array2: [String] =  try array1.filter({ (str: String) -> Bool in
 return str.hasPrefix("\(searchtext)")
 })
 print(array2)
 }
 catch {
 print(error.localizedDescription)
 }
 
 func capitalfirstchaar(n1: String) -> String {
 var new = n1.first?.debugDescription.uppercased()
 print(new!)
 new = new! + n1.characters.dropFirst()
 var ns = ""
 print(new)
 for i in (new?.characters)! {
 let n = String(i)
 ns.append(n)
 }
 print(ns)
 return new!
 
 }
 
 
 
 
*/

