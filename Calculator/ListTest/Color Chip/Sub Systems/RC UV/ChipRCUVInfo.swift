//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipRCUVInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip RC UV Specs"), message:
                    Text("Mixing Ratio: A:UCC:B:C:D = 6 lbs:4 oz:6 lbs:6 lbs:6 oz \n\n Coverage Rates: \n @8-12 mils: 190 sf/kit \n @15-20 mils: 120 sf/kit \n @25-30 mils: 80 sf/kit \n\n If choosing a lighter colorant, an optional prime coat is recommended "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipRCUVInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
