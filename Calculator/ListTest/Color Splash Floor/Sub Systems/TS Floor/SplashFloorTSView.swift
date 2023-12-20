//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct SplashFloorTSView: View {
    
    var body: some View {
        
//        let chip = ChipOptions()
        let SplashTSFloor = ColorSplashValuesFloorTS()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCSplash()
                    ThicknessSplashFloorTS()
 //                   SysOptionsTS()

                    CoatChoicesSplashFloorTS()
                }.navigationBarTitle("Color Splash Floor, 21-48 mils", displayMode: .inline)
            }
//            .environmentObject(chip)
//            .environmentObject(Broadcast)
//            .environmentObject(TSColorantC2)
            .environmentObject(sf)
            .environmentObject(SplashTSFloor)
        }
    }


struct SplashFloorTSView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
