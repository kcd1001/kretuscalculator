//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandMFView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandMF = ColorQuartzTSValues()
        let BroadcastSandMF = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_MF = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandMF()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandMF()
                }.navigationBarTitle("Industrial Sand MF, 3/16\"-1/4\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandMF)
            .environmentObject(TSColorant_MF)
            .environmentObject(sf)
            .environmentObject(SandMF)
        }
    }


struct IndustrialSandMFView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
