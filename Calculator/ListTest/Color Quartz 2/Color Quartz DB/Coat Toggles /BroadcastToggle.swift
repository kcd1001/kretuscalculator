//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct BroadcastToggle: View {
    
    @State var showingBroadcast : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingBroadcast) {
            Text("Broadcast 1")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        
        if showingBroadcast == true {
            BroadcastQuartzDB()
                .environmentObject(quartzTS_TSAC3)
                .environmentObject(quartzTS_TSBC3)
                .environmentObject(quartzTS_TSColorantC3)
        }
    }
}

struct BroadcastToggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
