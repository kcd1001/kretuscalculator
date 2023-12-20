//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct TCoatSandDBRCToggle: View {
    
    @State var showingTCoat : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingTCoat) {
            Text("Top Coat")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        if showingTCoat == true {
            IndustrialSandRCTopCoat()
                .environmentObject(SandDBRC_TSAC4)
                .environmentObject(SandDBRC_TSBC4)
                .environmentObject(SandDBRC_TSColorantC4)
        }
    }
}

struct TCoatSandDBRCToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
