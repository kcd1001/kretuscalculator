//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct SandSGBroadcastInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Industrial Sand SG Broadcast"), message:
                    Text("Mixing Ratio: 50 lbs \n\n Coverage Rates: \n 60, 30, or 20 mesh: 1 lb/sf "), dismissButton: .default(Text("Close")))
        }
    }
}

struct SandSGBroadcast_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
