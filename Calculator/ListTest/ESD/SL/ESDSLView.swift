//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ESDSLView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ESDSL = ColorQuartzTSValues()
        let BroadcastESDSL = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessESDSL()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesESDSL()
                }.navigationBarTitle("ESD Conductive SL, 3/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastESDSL)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ESDSL)
        }
    }


struct ESDSLView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
