//  /*
//
//  Project: BarcodeScanner
//  File: ScannerVC.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.02.2024
//
//  */

import UIKit
import AVFoundation

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
}

final class ScannerVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scanneDelegate: ScannerVCDelegate
    
    init(scanneDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        //self.previewLayer = previewLayer
        self.scanneDelegate = scanneDelegate
    }
    
    // No Storyboard
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupCaptureSession() {
        guard let videoCaptureDivice = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDivice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            return
        }
        
        scanneDelegate.didFind(barcode: barcode)
    }
}
