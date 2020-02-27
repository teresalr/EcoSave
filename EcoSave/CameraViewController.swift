//
//  CameraViewController.swift
//  EcoSave
//
//  Created by Teresa Lu-Romeo (student LM) on 2/21/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController,  AVCaptureMetadataOutputObjectsDelegate, ScannerDelegate {

    private var scanner: Scanner?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scanner = Scanner(withDelegate: self)
        
        guard let scanner = self.scanner else {
            return
        }
        
        scanner.requestCaptureSessionStartRunning()
    }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // Mark - AVFoundation delegate methods
        public func metadataOutput(_ output: AVCaptureMetadataOutput,
                                   didOutput metadataObjects: [AVMetadataObject],
                                   from connection: AVCaptureConnection) {
            guard let scanner = self.scanner else {
                return
            }
            scanner.metadataOutput(output,
                                   didOutput: metadataObjects,
                                   from: connection)
        }
        
        // Mark - Scanner delegate methods
        func cameraView() -> UIView
        {
            return self.view
        }
        
        func delegateViewController() -> UIViewController
        {
            return self
        }
        
        func scanCompleted(withCode code: String)
        {
            print(code)
            performSegue(withIdentifier: "popUpSegue", sender: CameraViewController())
            scanner?.requestCaptureSessionStopRunning()
        }
    }

