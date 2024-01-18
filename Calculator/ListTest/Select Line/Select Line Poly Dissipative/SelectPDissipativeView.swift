//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct SelectPDissipativeView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipPDissipative = ColorChipValuesSelectPDissipative()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessTS()
                    SysOptionsSelectPDissipative()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSelectPDissipative()
                }.navigationBarTitle("Kretus Select Poly Dissipative", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ChipPDissipative)
        }
    }


struct SelectPDissipativeView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
