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
    var body: some View {
        
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 70)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                
                Text("Not Yet Scanned")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.green)
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
