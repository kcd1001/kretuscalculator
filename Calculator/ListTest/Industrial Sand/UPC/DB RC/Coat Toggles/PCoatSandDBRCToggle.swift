//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct PCoatSandDBRCToggle: View {
    
    @State var showingPCoat : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingPCoat) {
            Text("Prime Coat")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        
        if showingPCoat == true {
            PCoatIndustrialSandDBRC()
                .environmentObject(TSA_SandDBRC)
                .environmentObject(TSB_SandDBRC)
        }
    }
}

struct PCoatSandDBRCToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
