//
//  StatsViewController.swift
//  EcoSave
//
//  Created by Teresa Lu-Romeo (student LM) on 2/21/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }
     @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbView: UITableView!
    
    
    let foodProduct = ["Apple","Apple suace","Apple chips","apple juice", "banana","banana chips","cereal", "cinnanon rolls","ice cream","potato chips", "pop corn","plastic bag",]
    
        
        var searchThings = [String]()
        var searching = false
    }

    extension StatsViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searching == true{
                return searchThings.count
            }
            else{
                return foodProduct.count
            }
    //         return foodProduct.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

                    if searching == false {
                    
                        cell?.textLabel?.text = foodProduct[indexPath.row]
                       
                    }
                    else{
                     cell?.textLabel?.text = searchThings[indexPath.row]
                    }
            
               return cell!
            
        }
        
    }


    extension StatsViewController: UISearchBarDelegate
    {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String ){
            searchThings = foodProduct.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searching = true
            tbView.reloadData()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searching = false
            searchBar.text = ""
            tbView.reloadData()
        }
    }

