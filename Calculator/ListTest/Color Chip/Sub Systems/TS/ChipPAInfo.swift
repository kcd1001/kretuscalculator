//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipPAInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip PA Base Coat"), message:
                    Text("Mixing Ratio: A:PC:B = 1 gal:16 oz:1/2 gal: \n\n Coverage Rates: \n @8-12 mils: 260 sf/kit \n\n If choosing a lighter colorant, an optional prime coat is recommended"), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipPAInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
