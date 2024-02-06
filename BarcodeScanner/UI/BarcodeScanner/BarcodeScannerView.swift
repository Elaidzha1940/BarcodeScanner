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
 @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 70)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                
                Text(viewModel.statusText)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(viewModel.statusColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
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
