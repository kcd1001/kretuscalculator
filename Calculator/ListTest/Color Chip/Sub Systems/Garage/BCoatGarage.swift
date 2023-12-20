//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct BCoatGarage: View {
    
 
    @EnvironmentObject var ChipGarage : ColorChipValues //Used for coat selections
    @EnvironmentObject var TSA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast


    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Enchanted Green", "A Resin - Handicap Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["MVR - EZ", "MVR - FC", "AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    var body: some View {
        VStack {
       //    ThicknessGarage()
           Text("Top Shelf Epoxy® Part A:")
            .fontWeight(.bold)
            Picker(selection: $ChipGarage.BCoatPtA,
                label: ZStack {
                    Text("\(typesA[ChipGarage.BCoatPtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< typesA.count, id: \.self) { index in
                    Text(self.typesA[index]).tag(index)
                }
            } .pickerStyle(MenuPickerStyle())
//            .onChange(of: ChipGarage.BCoatPtA) { _ in
//                CheckCoatChoices()
//            }
            Text("Top Shelf Epoxy® Part B:")
             .fontWeight(.bold)
             Picker(selection: $ChipGarage.BCoatPtB,
                 label: ZStack {
                     Text("\(typesB[ChipGarage.BCoatPtB])")
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
             } .pickerStyle(MenuPickerStyle())
//             .onChange(of: ChipGarage.BCoatPtB) { _ in
//                 CheckCoatChoices()
//             }
            Text("Top Shelf Epoxy® Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipGarage.BCoatTSColorant,
                 label: ZStack {
                     Text("\(TSColorantChoices[ChipGarage.BCoatTSColorant])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 300, height: 25)
             }) {
                ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
                     Text(self.TSColorantChoices[index]).tag(index)
                 }
             } .pickerStyle(MenuPickerStyle())
//             .onChange(of: ChipGarage.BCoatTSColorant) { _ in
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
                if ChipGarage.BCoatPtA == 4 {
                    HStack{
                        Text("\(typesACodes[ChipGarage.BCoatPtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA))")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[ChipGarage.BCoatPtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[ChipGarage.BCoatPtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA))")
                            .font(.caption)
                    }
            }
                HStack{
                    Text("\(typesBCodes[ChipGarage.BCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[ChipGarage.BCoatPtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB))")
                        .font(.caption)
                }
                if ChipGarage.BCoatTSColorant != 0 {
                     if ChipGarage.BCoatTSColorant == 4 {
                        HStack {
                            Text("\(TSColorantCodes[ChipGarage.BCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Ench. Green, 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorant))")
                                .font(.caption)
                        }
                    }
                    else if ChipGarage.BCoatTSColorant == 5 {
                       HStack {
                           Text("\(TSColorantCodes[ChipGarage.BCoatTSColorant])")
                               .font(.caption)
                           Spacer()
                           Text("TSE Colorant:  H. Blue, 16 oz")
                               .font(.caption)
                           Spacer()
                           Text("\(quant(product: TSColorant))")
                               .font(.caption)
                       }
                   }
                   else if ChipGarage.BCoatTSColorant == 8 {
                        HStack {
                            Text("\(TSColorantCodes[ChipGarage.BCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Med. Gray, 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorant))")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack {
                            Text("\(TSColorantCodes[ChipGarage.BCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ChipGarage.BCoatTSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorant))")
                                .font(.caption)
                        }
                    }
            }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipGarage.BCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSA) + ChipGarage.BCoatWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct BCoatGarage_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
