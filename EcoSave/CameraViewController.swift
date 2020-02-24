//
//  CameraViewController.swift
//  EcoSave
//
//  Created by Teresa Lu-Romeo (student LM) on 2/21/20.
//  Copyright © 2020 Teresa Lu-Romeo (student LM). All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                         AVMetadataObject.ObjectType.code39,
                                         AVMetadataObject.ObjectType.code39Mod43,
                                         AVMetadataObject.ObjectType.code93,
                                         AVMetadataObject.ObjectType.code128,
                                         AVMetadataObject.ObjectType.ean8,
                                         AVMetadataObject.ObjectType.ean13,
                                         AVMetadataObject.ObjectType.aztec,
                                         AVMetadataObject.ObjectType.pdf417,
                                         AVMetadataObject.ObjectType.itf14,
                                         AVMetadataObject.ObjectType.dataMatrix,
                                         AVMetadataObject.ObjectType.interleaved2of5,
                                         AVMetadataObject.ObjectType.qr]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

                // Get the back-facing camera for capturing videos
                guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
                    print("Failed to get the camera device")
                    return
                }
                
                do {
                    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
                    let input = try AVCaptureDeviceInput(device: captureDevice)
                    
                    // Set the input device on the capture session.
                    captureSession.addInput(input)
                    
                    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
                    let captureMetadataOutput = AVCaptureMetadataOutput()
                    captureSession.addOutput(captureMetadataOutput)
                    
                    // Set delegate and use the default dispatch queue to execute the call back
                    captureMetadataOutput.setMetadataObjectsDelegate(self as? AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
                    captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
        //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                    
                } catch {
                    // If any error occurs, simply print it out and don't continue any more.
                    print(error)
                    return
                }
                
                // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                videoPreviewLayer?.frame = view.layer.bounds
                view.layer.addSublayer(videoPreviewLayer!)
                
                // Start video capture.
                captureSession.startRunning()
                
                // Initialize QR Code Frame to highlight the QR code
                qrCodeFrameView = UIView()
                
                if let qrCodeFrameView = qrCodeFrameView {
                    qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                    qrCodeFrameView.layer.borderWidth = 2
                    view.addSubview(qrCodeFrameView)
                    view.bringSubviewToFront(qrCodeFrameView)
                }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
