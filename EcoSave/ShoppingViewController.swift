//
//  ShoppingViewController.swift
//  EcoSave
//
//  Created by Teresa Lu-Romeo (student LM) on 2/21/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    var final : String = "https://www.ewg.org/foodscores/products/?search="
    
    @IBOutlet weak var input: UITextField!
   
    @IBAction func search(_ sender: UIButton) {
        if var str = input.text{
            for i in 0...str.count-1{
                if str[str.index(str.startIndex, offsetBy: i)] == " "{
                    let index = str.index(str.startIndex, offsetBy: i)
                    str.remove(at: index)
                    str.insert("+", at: index)
                }
            }
            final += str
        }
        performSegue(withIdentifier: "searchSegue", sender: ShoppingViewController())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchViewController{
            let vc = segue.destination as? SearchViewController
            vc?.link = final
        }
    }
    
        
    }


