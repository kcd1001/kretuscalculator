//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandRCView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandRC = ColorQuartzTSValues()
        let BroadcastSandRC = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_RC = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandRC()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandRC()
                }.navigationBarTitle("Industrial Sand RC, 1/16\"-1/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandRC)
            .environmentObject(TSColorant_RC)
            .environmentObject(sf)
            .environmentObject(SandRC)
        }
    }


struct IndustrialSandRCView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
