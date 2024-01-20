//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct SelectEDissipativeView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipEDissipative = ColorChipValuesSelectEDissipative()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessTS()
                    //SysOptionsSelectEDissipative()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSelectEDissipative()
                }.navigationBarTitle("Kretus Select Epoxy Dissipative", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ChipEDissipative)
        }
    }


struct SelectEDissipativeView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
