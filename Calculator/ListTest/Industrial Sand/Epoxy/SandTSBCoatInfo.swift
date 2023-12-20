//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct SandTSBCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Coat Specs"), message:
                    Text("Mixing Ratio: A:B:TSC = 1 gal:1/2 gal:16 oz \n\n Coverage Rates: \n @60 or 30 Mesh Broadcast: 210 sf/kit \n @20 Mesh Broadcast: 120 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct SandTSBCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
