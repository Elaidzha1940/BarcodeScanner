//  /*
//
//  Project: BarcodeScanner
//  File: BarcodeScannerView.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.02.2024
//
//  */

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScannerView()
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
        }
    }
}

#Preview {
    BarcodeScannerView()
        .preferredColorScheme(.dark)
}
