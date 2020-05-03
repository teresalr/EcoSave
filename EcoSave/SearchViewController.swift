//
//  SearchViewController.swift
//  EcoSave
//
//  Created by Dhaval Sharma (student LM) on 5/3/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit
import WebKit

class SearchViewController: UIViewController, WKUIDelegate {

    @IBOutlet var web: WKWebView!
    var link : String?
    
    override func loadView() {
    //    let webConfiguration = WKWebViewConfiguration()

     web = WKWebView()
     web.uiDelegate = self
        view = web
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = link{
            let myURL = URL(string:url)
            let myRequest = URLRequest(url: myURL!)
            web.load(myRequest)
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
