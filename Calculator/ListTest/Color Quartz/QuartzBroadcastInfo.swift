//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct QuartzBroadcastInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Quartz/Industrial Sand Broadcast"), message:
                    Text("Mixing Ratio: 50 lbs \n\n Coverage Rates: \n Q-Grade: 0.25 lb/sf \n F-Grade: 0.5 lb/sf\n XF-Grade: 0.75 lb/sf"), dismissButton: .default(Text("Close")))
        }
    }
}

struct QuartzBroadcast_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
