//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct SelectPConductiveView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipPConductive = ColorChipValuesSelectPConductive()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessTS()
                    SysOptionsSelectPConductive()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSelectPConductive()
                }.navigationBarTitle("Kretus Select Epoxy Conductive", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ChipPConductive)
        }
    }


struct SelectPConductiveView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
