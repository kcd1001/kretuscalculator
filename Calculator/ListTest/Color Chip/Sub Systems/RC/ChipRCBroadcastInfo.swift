//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipRCBroadcastInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip Broadcast"), message:
                    Text("Mixing Ratio: N/A \n\n Coverage Rates: \n 1/4\" Chip: 0.1 lb/sf \n 1/8\" Chip: 0.1 lb/sf"), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipRCBroadcast_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
