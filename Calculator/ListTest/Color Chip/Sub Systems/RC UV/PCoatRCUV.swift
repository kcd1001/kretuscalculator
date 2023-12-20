//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct PCoatRCUV: View {
    
 
    @EnvironmentObject var ChipRCUV : ColorChipValuesRCUV //Used for coat selections
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCD : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast

    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness: 3-5 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipRCUVPrimeCoatInfo()
            }
            .padding()
            Text("UPC Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipRCUV.PCoatColor,
                 label: ZStack {
                     Text("\(UPCColorantChoices[ChipRCUV.PCoatColor])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 300, height: 25)
             }) {
                ForEach (0 ..< UPCColorantChoices.count, id: \.self) { index in
                     Text(self.UPCColorantChoices[index]).tag(index)
                 }
             }
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)

            VStack { // Start of coat summary
                HStack {
                    Text("PRODUCT CODE")
                        .underline()
                        .font(.caption)
                    Spacer()
                    Text("PRODUCT")
                        .underline()
                        .font(.caption)
                    Spacer()
                    Text("QUANTITY")
                        .underline()
                        .font(.caption)
                }
                HStack{ // Part A
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCA))")
                        .font(.caption)
                }
                HStack{ // Part B
                    Text("EX-BRCUVAP6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV AP, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCB))")
                        .font(.caption)
                }
                HStack{ // Part C
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCC))")
                        .font(.caption)
                }
                if ChipRCUV.PCoatColor != 0 {
                HStack{ // Color
                    Text("\(UPCColorantCodes[ChipRCUV.PCoatColor])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant - \(UPCColorantChoices[ChipRCUV.PCoatColor]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCColorant))")
                        .font(.caption)
                }
            }
                HStack{ // Poly Accelerant
                    Text("EX-KPLACEL32-EA")
                        .font(.caption)
                    Spacer()
                    Text("Poly Accelerant, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCD))")
                        .font(.caption)
                }
            }
                        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                        .cornerRadius(5.0)
                        .padding()
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipRCUV.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: UPCA) + ChipRCUV.PCoatWaste) kit(s)")
            }
    }
            .padding()
        }
    }


struct PCoatRCUV_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
