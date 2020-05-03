//
//  PopUpViewController.swift
//  EcoSave
//
//  Created by Dhaval Sharma (student LM) on 2/27/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit
import WebKit

class PopUpViewController: UIViewController, WKUIDelegate {
    
    var barcode : String?
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var descriptor: UILabel!
    
    var rating : Int?
   
    @IBOutlet var myWebView: WKWebView!
    
    override func loadView() {
       //    let webConfiguration = WKWebViewConfiguration()

        myWebView = WKWebView()
        myWebView.uiDelegate = self
           view = myWebView
       }
    override func viewDidLoad() {
        if var b = barcode{
            b.remove(at: b.startIndex)
            barcode = b
        }
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.ewg.org/foodscores/products/" + barcode!)
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
//
//        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//        let image = renderer.image { ctx in
//            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//        }
        //Identifies Rating

        if barcode == "0078783508037"{
            rating = 1
        }
        else if barcode == "0602652181030"{
            rating = 2
        }
        else if barcode == "0052000001730"{
            rating = 3
        }
        else if barcode == "0014100043706"{
            rating = 4
        }
        else {
            rating = 5
        }

        print(rating)
//        //Sets color based on rating
//        if rating == 1{
//            descriptor.text = "Terrible"
//            descriptor.textColor = UIColor.red
//        }
//        else if rating == 2{
//            descriptor.text = "Bad"
//            descriptor.textColor = UIColor.orange
//        }
//        else if rating == 3{
//            descriptor.text = "Decent"
//            descriptor.textColor = UIColor(red: 247/255, green: 227/255, blue: 0, alpha: 1)
//        }
//        else if rating == 4{
//            if let x = descriptor.text {
//                descriptor.text = "Great"
//            }
//            else {
//                print("you are a fool")
//            }
//            descriptor.textColor = UIColor(red: 183/255, green: 255/255, blue: 0, alpha: 1)
//        }
//        else if rating == 5{
//            descriptor.text = "Amazing"
//            descriptor.textColor = UIColor.green
//        }
//
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
