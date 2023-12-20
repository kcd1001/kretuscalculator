//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine


var TSABC_SandDBRC = stats(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var TSBBC_SandDBRC = stats(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var TSColorantBC_SandDBRC = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

struct BCoatIndustrialSandDBRC: View {
    
 
    @EnvironmentObject var SandDBRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var TSABC_SandDBRC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSBBC_SandDBRC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorantBC_SandDBRC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastSandDBRC : statsBroadcast


    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - Handic. Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "FC"]
    let typesBCodes = ["EX-KUPCRCA6-EA", "EX-KUPCRZ6-EA", "EX-KUPCRCF6-EA"]
    
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
                Text("Coating Thickness: 8-12 mils")
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
                QuartzTSBCoatInfo()
            } .padding()

            Text("Choose Your Speed:")
                .fontWeight(.bold)
            Picker(selection: $SandDBRC.BCoatPtB,
                   label: ZStack {
                Text("\(typesB[SandDBRC.BCoatPtB])")
                    .opacity(1)
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.2)
                    .cornerRadius(5)
                    .frame(width: 150, height: 25)
                //   .padding()
            }) {
                ForEach (0 ..< typesB.count, id: \.self) { index in
                    Text(self.typesB[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            //             .onChange(of: SandDBRC.PCoatPtB) { _ in
            //                quant(product: TSB)
            //             }
            Text("UPC Colorant:")
                .fontWeight(.bold)
            Picker(selection: $SandDBRC.BCoatTSColorant,
                   label: ZStack {
                Text("\(UPCColorantChoices[SandDBRC.BCoatTSColorant])")
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
//             .onChange(of: SandDBRC.BCoatTSColorant) { _ in
//                 CheckCoatChoices()
//             }
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
                HStack{
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSABC_SandDBRC))")
                        .font(.caption)
                }
                
                HStack{
                    Text("\(typesBCodes[SandDBRC.BCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC/TT \(typesB[SandDBRC.BCoatPtB]), 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBBC_SandDBRC))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBBC_SandDBRC))")
                        .font(.caption)
                }
                if SandDBRC.BCoatTSColorant != 0
                {
                        HStack {
                            Text("\(UPCColorantCodes[SandDBRC.BCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("UPC Colorant:  \(UPCColorantChoices[SandDBRC.BCoatTSColorant]), 4 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantBC_SandDBRC))")
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
                TextField("",value: $SandDBRC.BCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSABC_SandDBRC) + SandDBRC.BCoatWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct BCoatIndustrialSandDBRC_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
