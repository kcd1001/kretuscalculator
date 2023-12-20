//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct Broadcast2SandDBRCToggle: View {
    
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
            Broadcast2SandDBRC()
                .environmentObject(SandDBRC_TSAC3)
                .environmentObject(SandDBRC_TSBC3)
                .environmentObject(SandDBRC_TSColorantC3)
                .environmentObject(TSABC_SandDBRC)
                .environmentObject(TSBBC_SandDBRC)
                .environmentObject(TSColorantBC_SandDBRC)
                .environmentObject(SandDBRC_TSAC4)
                .environmentObject(SandDBRC_TSBC4)
                .environmentObject(SandDBRC_TSColorantC4)
            
        }
    }
}

struct Broadcast2SandDBRCToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
