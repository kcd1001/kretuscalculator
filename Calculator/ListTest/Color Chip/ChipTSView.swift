//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ChipTSView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipTS = ColorChipValuesTS()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessTS()
                    SysOptionsTS()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesTS()
                }.navigationBarTitle("Color Chip TS, 35 mils", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ChipTS)
        }
    }


struct ChipTSView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
