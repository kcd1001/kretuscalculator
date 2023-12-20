//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct CapCoatSandDBTSToggle: View {
    
    @State var showingCapCoat : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingCapCoat) {
            Text("Cap Coat")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        if showingCapCoat == true {
            IndustrialSandTSCapCoat()
                .environmentObject(SandDBTS_TSAC3)
                .environmentObject(SandDBTS_TSBC3)
                .environmentObject(SandDBTS_TSColorantC3)


            
            
        }
    }
}

struct CapCoatSandDBTSToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
