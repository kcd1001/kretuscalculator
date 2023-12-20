//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ESDTSView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ESDTS = ColorQuartzTSValues()
        let BroadcastESDTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessESDTS()
//                    SysOptionsESD()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesESDTS()
                }.navigationBarTitle("ESD Conductive TS, 35 Mils", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastESDTS)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(ESDTS)
        }
    }


struct ESDTSView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
