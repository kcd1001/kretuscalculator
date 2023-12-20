//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipRCInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip RC Base Coat"), message:
                    Text("Mixing Ratio: A:UCC:B:C: = 6 lbs:4 oz:6 lbs:6 lbs \n\n Coverage Rates: \n @8-12 mils: 190 sf/kit \n @15-20 mils: 120 sf/kit \n @25-30 mils: 80 sf/kit \n\n If choosing a lighter colorant, an optional prime coat is recommended "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipRCInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
