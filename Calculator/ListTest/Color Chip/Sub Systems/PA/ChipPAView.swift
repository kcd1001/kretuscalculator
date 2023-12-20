//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ChipPAView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipPA = ColorChipValuesPA()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let PolyColorant_PA = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 600, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessChipPA()
                    SysOptionsPA()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesPA()
                }.navigationBarTitle("Color Chip PA, 35 mils", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(PolyColorant_PA)
            .environmentObject(sf)
            .environmentObject(ChipPA)
        }
    }


struct ChipPAView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
