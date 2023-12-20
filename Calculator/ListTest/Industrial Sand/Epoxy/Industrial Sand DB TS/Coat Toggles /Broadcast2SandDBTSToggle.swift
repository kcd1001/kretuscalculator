//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct Broadcast2SandDBTSToggle: View {
    
    @State var showingBroadcast : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingBroadcast) {
            Text("Broadcast 2")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        if showingBroadcast == true {
            Broadcast2SandDBTS()
                .environmentObject(SandDBTS_TSAC3)
                .environmentObject(SandDBTS_TSBC3)
                .environmentObject(SandDBTS_TSColorantC3)
                .environmentObject(TSABC_SandDBTS)
                .environmentObject(TSBBC_SandDBTS)
                .environmentObject(TSColorantBC_SandDBTS)
                .environmentObject(SandDBTS_TSAC4)
                .environmentObject(SandDBTS_TSBC4)
                .environmentObject(SandDBTS_TSColorantC4)
            
        }
    }
}

struct Broadcast2SandDBTSToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
