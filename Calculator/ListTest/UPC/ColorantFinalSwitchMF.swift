//
//  ColorantFinalSwitch.swift
//  Calculator
//
//  Created by Kane Davidson on 1/29/21.
//

import SwiftUI

struct ColorantFinalSwitchMF: View {
    @EnvironmentObject var colorant : Colorant //colorant selection
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections

    var body: some View {
        HStack { // Colorant
            switch colorant.selection {
            case 0:
                Text("")
                    .font(.caption)
            case 1:
                Text("EX-KUPCCLBK-EA")
                    .font(.caption)
            case 2:
                Text("EX-KUPCCLBL-EA")
                    .font(.caption)
            case 3:
                Text("EX-KUPCCLWG-EA")
                    .font(.caption)
            case 4:
                Text("EX-KUPCCLBR-EA")
                    .font(.caption)
            case 5:
                Text("EX-KUPCCLCL-EA")
                    .font(.caption)
            case 6:
                Text("EX-KUPCCLGY-EA")
                    .font(.caption)
            case 7:
                Text("EX-KUPCCLGR-EA")
                    .font(.caption)
            case 8:
                Text("EX-KUPCCLCY-EA")
                    .font(.caption)
            case 9:
                Text("EX-KUPCCLRD-EA")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            switch colorant.selection {
            case 0:
                Text("")
                    .font(.caption)
            case 1:
                Text("UPC Colorant - Black, 4 oz")
                    .font(.caption)
            case 2:
                Text("UPC Colorant - Blue, 4 oz")
                    .font(.caption)
            case 3:
                Text("UPC Colorant - Bone, 4 oz")
                    .font(.caption)
            case 4:
                Text("UPC Colorant - Brown, 4 oz")
                    .font(.caption)
            case 5:
                Text("UPC Colorant - Clay, 4 oz")
                    .font(.caption)
            case 6:
                Text("UPC Colorant - Gray, 4 oz")
                    .font(.caption)
            case 7:
                Text("UPC Colorant - Green, 4 oz")
                    .font(.caption)
            case 8:
                Text("UPC Colorant - Mustard, 4 oz")
                    .font(.caption)
            case 9:
                Text("UPC Colorant - Red, 4 oz")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            switch colorant.selection {
            case 1...9:
                Text("\(upcChoice.BCoatColorant + upcChoice.PCoatColorant +  upcChoice.TCoatColorant)")
                    .font(.caption)
            default:
                Text("")
            }
        }    }
}

struct ColorantFinalSwitchMF_Previews: PreviewProvider {
    static var previews: some View {
        ColorantFinalSwitch()
    }
}
