//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var TSA_ESDSL = stats(product: "Top Shelf® Epoxy Part A:", covRate: 50, MixRat: 6)
var TSB_ESDSL = stats(product: "Top Shelf® Epoxy Part B:", covRate: 50, MixRat: 6)
var TSColorant_ESDSL = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 50, MixRat: 16)

struct MVRCoatESDSL: View {
    
 
    @EnvironmentObject var ESDSL : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartzTS : statsBroadcast


//
//    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray",
//                  "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray",
//                  "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",
//                  "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red",
//                  "A Resin - White", "CR Resin - Clear", "LG Resin - Clear", "Commercial Resin - Clear"]
//
//    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01",
//                       "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",
//                       "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01",
//                       "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01",
//                       "EX-KTSARSG-01", "EX-KTSARTN-01", "EX-KTSARTR-01",
//                       "EX-KTSARWH-01", "EX-KTSECRRC-01","Contact Distributor",
//                       "FG-TSECMRCLR-01G"]
    
    let typesB = ["AP", "EZ", "FC"]
    let typesBCodes = ["EX-KUPCSLB8-EA", "EX-KUPCSLZ8-EA", "EX-KUPCSLF8-EA"]
    
//    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "Handic. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
//
//    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
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
                Spacer()
                QuartzTSPCoatInfo()
            }
            .padding()
            HStack {
                Toggle(isOn: $ESDSL.PCoatSC, label: {
                    Text("Add Optional Solvent Cleaner")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
                
            }
            .padding()
//           Text("Top Shelf Epoxy® Part A:")
//            .fontWeight(.bold)
//            Picker(selection: $ESDSL.PCoatPtA,
//                label: ZStack {
//                    Text("\(typesA[ESDSL.PCoatPtA])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.2)
//                        .cornerRadius(5)
//                        .frame(width: 225, height: 25)
//                      //  .padding()
//            }) {
//                ForEach (0 ..< typesA.count, id: \.self) { index in
//                    Text(self.typesA[index]).tag(index)
//                }
//            }
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(5)
            Text("Choose Your Speed:")
             .fontWeight(.bold)
             Picker(selection: $ESDSL.PCoatPtB,
                 label: ZStack {
                     Text("\(typesB[ESDSL.PCoatPtB])")
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
//             .onChange(of: ESDSL.PCoatPtB) { _ in
//                quant(product: TSB)
//             }
//            Text("Top Shelf Epoxy® Colorant:")
//             .fontWeight(.bold)
//             Picker(selection: $ESDSL.PCoatTSColorant,
//                 label: ZStack {
//                     Text("\(TSColorantChoices[ESDSL.PCoatTSColorant])")
//                         .opacity(1)
//                     Rectangle()
//                         .fill(Color.gray)
//                         .opacity(0.2)
//                         .cornerRadius(5)
//                         .frame(width: 300, height: 25)
//             }) {
//                ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
//                     Text(self.TSColorantChoices[index]).tag(index)
//                 }
//             }
//             .background(Color.gray.opacity(0.2))
//             .cornerRadius(5)

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
                        Text("EX-KUPCASL8-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - SL/MF, 8#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA_ESDSL))")
                            .font(.caption)
                    }
            
                HStack{
                    Text("\(typesBCodes[ESDSL.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - SL/MF \(typesB[ESDSL.PCoatPtB]), 8#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB_ESDSL))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCSLC2-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - SL, 25#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA_ESDSL))")
                        .font(.caption)
                }
                if ESDSL.PCoatSC
                {
                    HStack{ // Solvent Cleaner
                        Text("EX-KSLVCLN-EA")
                            .font(.caption)
                        Spacer()
                        Text("Solvent Cleaner, 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA_ESDSL))")
                            .font(.caption)
                    }
                }
                
//                if ESDSL.PCoatTSColorant != 0
//                {
//                    HStack {
//                        Text("\(TSColorantCodes[ESDSL.BCoatTSColorant])")
//                            .font(.caption)
//                        Spacer()
//                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDSL.PCoatTSColorant]), 16 oz")
//                            .font(.caption)
//                        Spacer()
//                        Text("\(quant(product: TSColorant_ESDSL))")
//                            .font(.caption)
//                    }
//                }
                    
                    
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
           
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ESDSL.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSA_ESDSL) + ESDSL.PCoatWaste) kit(s)")
            }
            .padding()
        }
    }


struct MVRCoatESDSL_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
