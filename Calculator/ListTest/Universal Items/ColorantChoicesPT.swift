//
//  ColorantChoices.swift
//  Calculator
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct ColorantChoicesPT: View {
    
    @EnvironmentObject var colorant : Colorant //colorant
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections

    
    func quantPT(product : stats) -> Int {
        let quantity : Float = (sf.squareF / 200) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    @EnvironmentObject var UPCColor : stats //Used for system stats (mixRat,CovRate, etc)
    
    var body: some View {
            
        HStack{
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
                Text("EX-KUPCCLWH-EA")
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
                Text("\(quantPT(product: UPCColor))")
                    .font(.caption)
            default:
                Text("")
            }
            
           
        }
    }
}

struct ColorantChoicesPT_Previews: PreviewProvider {
    static var previews: some View {
        ColorantChoices()
    }
}
