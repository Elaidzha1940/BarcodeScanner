//  /*
//
//  Project: BarcodeScanner
//  File: BarcodeScannerViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.02.2024
//
//  */

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusColor: Color {
        scannedCode.isEmpty ? .red.opacity(0.6) : .green.opacity(0.6)
    }
}
