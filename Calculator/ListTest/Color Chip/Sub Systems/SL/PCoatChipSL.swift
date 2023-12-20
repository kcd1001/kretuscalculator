//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct PCoatChipSL: View {


    @EnvironmentObject var ChipSL : ColorChipValuesSL //Used for coat selections
    @EnvironmentObject var ChipSLUPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var ChipSLUPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var ChipSLUPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var ChipSLUPCColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast

    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]

    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    let TypesB = ["AP", "EZ", "FC"]

    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required

    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness: 3-4 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipSLPrimeCoatInfo()
            }
            .padding()
            Text("Choose your speed:")
             .fontWeight(.bold)
             Picker(selection: $ChipSL.PCoatPtB,
                 label: ZStack {
                     Text("\(TypesB[ChipSL.PCoatPtB])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 225, height: 25)
                       //  .padding()
             }) {
                 ForEach (0 ..< TypesB.count, id: \.self) { index in
                     Text(self.TypesB[index]).tag(index)
                 }
             }
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)
            
            Text("UPC Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipSL.PCoatColor,
                 label: ZStack {
                     Text("\(UPCColorantChoices[ChipSL.PCoatColor])")
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

            PCoatSummarySL()

            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipSL.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: ChipSLUPCA) + ChipSL.PCoatWaste) kit(s)")
            }
    }
            .padding()
        }
    }


struct PCoatChipSL_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
