//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ESDDisRCView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ESDRC = ColorQuartzTSValues()
        let BroadcastESDRC = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessESDRC()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesESDDisRC()
                }.navigationBarTitle("ESD Dissipative RC, 3/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastESDRC)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ESDRC)
        }
    }


struct ESDDisRCView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
