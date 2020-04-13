//
//  ShoppingViewController.swift
//  EcoSave
//
//  Created by Teresa Lu-Romeo (student LM) on 2/21/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }
     @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbView: UITableView!
    
    
    let foodProduct = ["Apple","Apple sauce","Apple chips","Apple juice", "Banana","Banana chips","Cereal", "Cinnamon rolls","Ice cream","Potato chips", "Pop corn","Plastic bag",]
    
        
        var searchThings = [String]()
        var searching = false
    }

    extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource{
        
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


    extension ShoppingViewController: UISearchBarDelegate
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

