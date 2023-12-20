//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var TSA_SandMF = stats(product: "Top Shelf® Epoxy Part A:", covRate: 330, MixRat: 1)
var TSB_SandMF = stats(product: "Top Shelf® Epoxy Part B:", covRate: 330, MixRat: 0.5)
var TSColorant_SandMF = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 330, MixRat: 16)

struct PCoatIndustrialSandMF: View {
    
 
    @EnvironmentObject var SandMF : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartzTS : statsBroadcast


    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red", "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
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
                Text("Coating Thickness: 3-5 mils")
                    .fontWeight(.heavy)
                Spacer()
                QuartzTSPCoatInfo()
            }
            .padding()
            .cornerRadius(5)
            Text("Choose Your Speed:")
             .fontWeight(.bold)
             Picker(selection: $SandMF.PCoatPtB,
                 label: ZStack {
                     Text("\(typesB[SandMF.PCoatPtB])")
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
//             .onChange(of: SandMF.PCoatPtB) { _ in
//                quant(product: TSB)
//             }
            Text("UPC Colorant:")
             .fontWeight(.bold)
             Picker(selection: $SandMF.PCoatTSColorant,
                 label: ZStack {
                     Text("\(UPCColorantChoices[SandMF.PCoatTSColorant])")
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

                HStack{
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA_SandMF))")
                        .font(.caption)
                }
            
                HStack{
                    Text("\(typesBCodes[SandMF.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC/TT \(typesB[SandMF.PCoatPtB]), 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB_SandMF))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB_SandMF))")
                        .font(.caption)
                }
                if SandMF.PCoatSC
                {
                    HStack{ // Solvent Cleaner
                        Text("EX-KSLVCLN-EA")
                            .font(.caption)
                        Spacer()
                        Text("Solvent Cleaner, 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA_SandMF))")
                            .font(.caption)
                    }
                }
                
                
                if SandMF.PCoatTSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[SandMF.PCoatTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant:  \(UPCColorantChoices[SandMF.PCoatTSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSColorant_SandMF))")
                            .font(.caption)
                    }
                }
                    
                    
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
           
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandMF.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSA_SandMF) + SandMF.PCoatWaste) kit(s)")
            }
            .padding()
        }
    }


struct PCoatIndustrialSandMF_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
