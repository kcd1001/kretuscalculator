//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct Broadcast2Toggle: View {
    
    @State var showingBroadcast2 : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingBroadcast2) {
            Text("Broadcast 2")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        
        if showingBroadcast2 == true {
            Broadcast2QuartzDB()
                .environmentObject(quartzTS_TSAC3)
                .environmentObject(quartzTS_TSBC3)
                .environmentObject(quartzTS_TSColorantC3)
        }
    }
}

struct Broadcast2Toggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
