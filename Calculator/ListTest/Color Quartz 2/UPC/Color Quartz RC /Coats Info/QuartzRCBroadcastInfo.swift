//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct QuartzRCBroadcastInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Quartz Broadcast"), message:
                    Text("Mixing Ratio: 50 lbs \n\n Coverage Rates: \n Q-Grade: 1 lb/sf \n F-Grade: 1 lb/sf\n XF-Grade: 1 lb/sf"), dismissButton: .default(Text("Close")))
        }
    }
}

struct QuartzRCBroadcast_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
