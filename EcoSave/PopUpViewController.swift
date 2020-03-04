//
//  PopUpViewController.swift
//  EcoSave
//
//  Created by Dhaval Sharma (student LM) on 2/27/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var barcode : String?
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var descriptor: UILabel!
    
    var rating : Int?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Indetifies Rating
        
        if barcode == "078783508037"{
            rating = 1
        }
        else if barcode == "602652181030"{
            rating = 2
        }
        else if barcode == "052000001730"{
            rating = 3
        }
        else if barcode == "014100043706"{
            rating = 4
        }
        else if barcode == "078783508037"{
            rating = 5
        }
        
        //Sets color based on rating
        if rating == 1{
            descriptor.text = "Terrible"
            descriptor.textColor = UIColor.red
        }
        else if rating == 2{
            descriptor.text = "Bad"
            descriptor.textColor = UIColor.orange
        }
        else if rating == 3{
            descriptor.text = "Decent"
            descriptor.textColor = UIColor(red: 247/255, green: 227/255, blue: 0, alpha: 1)
        }
        else if rating == 4{
            descriptor.text = "Great"
            descriptor.textColor = UIColor(red: 183/255, green: 255/255, blue: 0, alpha: 1)
        }
        else if rating == 5{
            descriptor.text = "Amazing"
            descriptor.textColor = UIColor.green
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
