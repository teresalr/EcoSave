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
        rating = 3
        
        //Sets color based on rating
        if rating == 1{
            descriptor.text = "Terrible"
            
        }
        else if rating == 2{
            descriptor.text = "Bad"
        }
        else if rating == 3{
            descriptor.text = "Decent"
        }
        else if rating == 4{
            descriptor.text = "Great"
        }
        else if rating == 5{
            descriptor.text = "Amazing"
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
