//  /*
//
//  Project: BarcodeScanner
//  File: BarcodeScannerView.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.02.2024
//
//  */

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedVType = AlertItem(title: "Invalid Scan Type",
                                               message: "The value scanned is not valid. This app scans EAN-8 and EAN-13",
                                               dismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 70)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
                
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
        .preferredColorScheme(.dark)
}
