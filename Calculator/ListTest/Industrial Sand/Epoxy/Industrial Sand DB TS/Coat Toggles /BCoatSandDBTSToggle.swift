//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct BCoatSandDBTSToggle: View {
    
    @State var showingBCoat : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingBCoat) {
            Text("Base Coat")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        
        if showingBCoat == true {
            BCoat1IndustrialSandDBTS()
                .environmentObject(TSABC_SandDBTS)
                .environmentObject(TSBBC_SandDBTS)
                .environmentObject(TSColorantBC_SandDBTS)
            
            
        }
    }
}

struct BCoatSandDBTSToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
