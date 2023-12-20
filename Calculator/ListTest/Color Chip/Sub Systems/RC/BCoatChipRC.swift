//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct BCoatChipRC: View {
    
 
    @EnvironmentObject var ChipRC : ColorChipValuesRC //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast
    @EnvironmentObject var BCoatUPCA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCB : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCC : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCColorant : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCD : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var upc : ChipOptions


    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA",
                            "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    let TypesB = ["AP", "EZ", "FC"]
    
    let typesBCodes = ["EX-KUPCRCA6-EA", "EX-KUPCRZ6-EA", "EX-KUPCRCF6-EA"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    var body: some View {
        VStack {
            if upc.ThicknessSelection == 0 {
                HStack {
                    Text("Coating Thickness: 8-12 mils")
                        .fontWeight(.heavy)
                    Spacer()
                    ChipRCInfo()
                }
                .padding()
            }
            
            else if upc.ThicknessSelection == 1 {
                HStack {
                    Text("Coating Thickness: 15-20 mils")
                        .fontWeight(.heavy)
                    Spacer()
                    ChipRCUVInfo()
                }
                .padding()
            }
            else {
                HStack {
                    Text("Coating Thickness: 25-30 mils")
                        .fontWeight(.heavy)
                    Spacer()
                    ChipRCUVInfo()
                }
                .padding()
            }
            Text("Choose your speed:")
             .fontWeight(.bold)
             Picker(selection: $ChipRC.BCoatPtB,
                 label: ZStack {
                     Text("\(TypesB[ChipRC.PCoatPtB])")
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
             Picker(selection: $ChipRC.BCoatColor,
                 label: ZStack {
                     Text("\(UPCColorantChoices[ChipRC.BCoatColor])")
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
                    Text("\(quant(product: BCoatUPCA))")
                        .font(.caption)
                }
                HStack{ // Part B
                    Text("\(typesBCodes[ChipRC.BCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC/TT \(TypesB[ChipRC.BCoatPtB]), 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCB))")
                        .font(.caption)
                }
                HStack{ // Part C
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCC))")
                        .font(.caption)
                }
                if ChipRC.BCoatColor != 0 {
                HStack{ // Color
                    Text("\(UPCColorantCodes[ChipRC.BCoatColor])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant - \(UPCColorantChoices[ChipRC.BCoatColor]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCColorant))")
                        .font(.caption)
                }
            }
            }
                        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                        .cornerRadius(5.0)
                        .padding()
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipRC.BCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: BCoatUPCA) + ChipRC.BCoatWaste) kit(s)")
            }
    }
            .padding()
        }
    }


struct BCoatRC_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
