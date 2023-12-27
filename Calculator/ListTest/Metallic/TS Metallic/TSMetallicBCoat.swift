//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

struct TSMetallicBCoat: View {

    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Enchanted Green", "A Resin - Handicap Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    
    let typesB = ["AP", "EZ", "Fast", "MVR-EZ", "MVR-FC", "TH"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let pigmentChoices = ["Antique Silver", "Black", "Cabernet", "California Gold", "Carbon", "Cherrywood", "Dark Blue", "Dark Gray", "Forest Green", "Gold Glitter", "Ivory", "Jade Green", "New Copper", "Olive", "Sedona", "Silver Glitter", "Sky Blue", "Sterling", "Sunset Gold", "Violet"]
    
    let pigmentCodes = [ "EX-KMETASL-EA", "EX-KMETABL-EA", "EX-KMETACB-EA", "EX-KMETACG-EA", "EX-KMETACN-EA", "EX-KMETACW-EA", "EX-KMETADB-EA", "EX-KMETADG-EA", "EX-KMETAFG-EA", "EX-KMETGG-EA", "EX-KMETAIV-EA", "EX-KMETAJG-EA", "EX-KMETANC-EA", "EX-KMETAOL-EA", "EX-KMETASD-EA", "EX-KMETASG-EA", "EX-KMETASB-EA", "EX-KMETAST-EA", "EX-KMETASN-EA", "EX-KMETAVL-EA" ]
    
    @EnvironmentObject var tsMetallic : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatMetallicTSA : stats2
    @EnvironmentObject var bCoatMetallicTSB : stats2
    @EnvironmentObject var bCoatMetallicPigment : stats2



    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    var body: some View {
        HStack {
            
            Text("Coating Thickness: 8-12 mils")
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
 //           PCoattsMetallicInfo()
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
        Text("Top Shelf Epoxy® Part A:")
            .fontWeight(.bold)
        Picker(selection: $tsMetallic.Coat2PtA,
               label: ZStack {
            Text("\(typesA[tsMetallic.Coat2PtA])")
                .opacity(1)
            Rectangle()
                .fill(Color.black)
                .opacity(0.9)
                .cornerRadius(5)
                .frame(width: 225, height: 25)
            //  .padding()
        }) {
            ForEach (0 ..< typesA.count, id: \.self) { index in
                Text(self.typesA[index]).tag(index)
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
                Text("Top Shelf Epoxy® Part B:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallic.Coat2PtB,
                       label: ZStack {
                    Text("\(typesB[tsMetallic.Coat2PtB])")
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
                //             .onChange(of: tsMetallic.Coat1PtB) { _ in
                //                 CheckCoatChoices()
                //             }
/*
                Text("Metllic Pigment:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallic.Coat2TSColorant,
                       label: ZStack {
                    Text("\(pigmentChoices[tsMetallic.Coat2TSColorant])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 300, height: 25)
                }) {
                    ForEach (0 ..< pigmentChoices.count, id: \.self) { index in
                        Text(self.pigmentChoices[index]).tag(index)
                    }
                }
 */
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
                            Text("\(typesACodes[tsMetallic.Coat2PtA])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Part A: \(typesA[tsMetallic.Coat2PtA]), 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: bCoatMetallicTSA))")
                                .font(.caption)
                        }
                    
                    HStack{
                        Text("\(typesBCodes[tsMetallic.Coat2PtB])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Part B: \(typesB[tsMetallic.Coat2PtB]), 1/2 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: bCoatMetallicTSB))")
                            .font(.caption)
                    }
                    
                    HStack {
                                Text("\(pigmentCodes[tsMetallic.Coat2TSColorant])")
                                    .font(.caption)
                                Spacer()
                                Text("Metallic Pigment:  see Kretus Color Chart, 8 oz")
                                    .font(.caption)
                                Spacer()
                                Text("\(quant(product: bCoatMetallicPigment))")
                                    .font(.caption)
                            }

            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $tsMetallic.Coat2Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: bCoatMetallicTSA) + tsMetallic.Coat2Waste) kit(s)")
            }
            .padding()
        }
    }



struct TSMetallicBCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
