//
//  CoveColorInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 7/18/22.
//

import SwiftUI

struct BroadcastCoveColorChipInfo: View {
    
    @State var showingAlert = false
    var body: some View {
        
        Button(action: {
            self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Epoxy Cove Color Chip Broadcast"), message:
                    Text("Mixing Ratios:\n N/A \n\nCoverage Rates:\n @1/4\" Chip: 0.1 lb/sf \n @1/8\" Chip: 0.15 lb/sf "), dismissButton: .default(Text("Close")))
        }
    }
}

struct BroadcastCoveColorChipInfo_Previews: PreviewProvider {
    static var previews: some View {
        PCoatCoveColorInfo()
    }
}
