//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct SelectCoveResinView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipCoveResin = ColorChipValuesSelectCoveResin()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessTS()
                    //SysOptionsSelectCoveResin()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSelectCoveResin()
                }.navigationBarTitle("Kretus Select Cove Resin", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ChipCoveResin)
        }
    }


struct SelectCoveResinView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
