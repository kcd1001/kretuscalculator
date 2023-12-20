//
//  TCoatSwitch.swift
//  Calculator
//
//  Created by Kane Davidson on 1/29/21.
//

import SwiftUI

struct TCoatSwitchSL: View {
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var UPC_TC : stats
    @EnvironmentObject var sf : SquareFeet
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    var body: some View {
        HStack{
            switch upcChoice.TCoatSelection {
            case 0:
                Text("EX-KUPCRZ6-EA")
                    .font(.caption)
            case 1:
                Text("EX-KUPCRCA6-EA")
                    .font(.caption)
            case 2:
                Text("EX-KUPCRCF6-EA")
                    .font(.caption)
            case 3:
                Text("EX-KUPCRCA6-EA")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            switch upcChoice.TCoatSelection {
            case 0:
                Text("UPC Part B - RC/TT - EZ, 8 lbs")
                    .font(.caption)
            case 1:
                Text("UPC Part B - RC/TT - AP, 8 lbs")
                    .font(.caption)
            case 2:
                Text("UPC Part B - RC/TT - FC, 8 lbs")
                    .font(.caption)
            case 3:
                Text("UPC Part B - RC UV AP, 6 lbs")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            Text("\(quant(product: UPC_TC))")
                .font(.caption)
        }
    }
}

struct TCoatSwitchSL_Previews: PreviewProvider {
    static var previews: some View {
        TCoatSwitch()
    }
}
