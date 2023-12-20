//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandTSView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandTS = ColorQuartzTSValues()
        let BroadcastSandTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandTS()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandTS()
                }.navigationBarTitle("Industrial Sand TS, 1/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandTS)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(SandTS)
        }
    }


struct IndustrialSandTSView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
