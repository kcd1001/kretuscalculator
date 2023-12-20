//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipSLInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip SL Base Coat"), message:
                    Text("Mixing Ratio: A:UCC:B:C = 8 lbs:4 oz:8 lbs:25 lbs \n\n Coverage Rates: \n @1/8\": 50 sf/kit \n\n If choosing a lighter colorant, an optional prime coat is recommended"), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipSLInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
