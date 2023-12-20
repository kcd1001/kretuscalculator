//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandTTView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandRC = ColorQuartzTSValues()
        let BroadcastSandTT = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_TT = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandTT()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandTT()
                }.navigationBarTitle("Industrial Sand TT, 1/4\"-3/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandTT)
            .environmentObject(TSColorant_TT)
            .environmentObject(sf)
            .environmentObject(SandRC)
        }
    }


struct IndustrialSandTTView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
