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
    weak var scanneDelegate: ScannerVCDelegate!
}
