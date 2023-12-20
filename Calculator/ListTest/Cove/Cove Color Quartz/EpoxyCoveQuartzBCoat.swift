//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI



struct EpoxyCoveQuartzBCoat: View {
    
    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane", "Urethane Polymer Concrete"]
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Enchanted Green", "A Resin - Handicap Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin"]
    
    let UPCTypes = ["RC", "SL", "MF"]
    
    let UPCHardeners = ["AP", "EZ", "FC"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA",  "EX-KTSETHB-EA"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    let UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    let UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var bCoatCoveQuartzTSA : stats2
    @EnvironmentObject var bCoatCoveQuartzTSB : stats2
    @EnvironmentObject var bCoatCoveQuartzTSColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required for broadcast
     
    var body: some View {
        HStack {
            Text("Coating Thickness: 1/8\", 1\" radius")
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            BCoatCoveColorQuartzInfo()
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
                Text("Top Shelf Epoxy® Part B:")
                    .fontWeight(.bold)
                Picker(selection: $CoveColorQuartz.Coat2PtB,
                       label: ZStack {
                    Text("\(typesB[CoveColorQuartz.Coat2PtB])")
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
                //             .onChange(of: CoveColor.Coat1PtB) { _ in
                //                 CheckCoatChoices()
                //             }
                Text("Texture:")
                    .fontWeight(.bold)
                Picker(selection: $CoveColorQuartz.Coat2TSColorant,
                       label: ZStack {
                    Text("\(textureChoices[CoveColorQuartz.Coat2TSColorant])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 300, height: 25)
                }) {
                    ForEach (0 ..< textureChoices.count, id: \.self) { index in
                        Text(self.textureChoices[index]).tag(index)
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
                            Text("EX-KTSECVRC-01")
                                .font(.caption)
                            Spacer()
                            Text("TSE Part A - Cove Resin - Clear, 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: bCoatCoveQuartzTSA))")
                                .font(.caption)
                        }
                    
                    HStack{
                        Text("\(typesBCodes[CoveColorQuartz.Coat2PtB])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorQuartz.Coat2PtB]), 1/2 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: bCoatCoveQuartzTSB))")
                            .font(.caption)
                    }
                    
                    HStack {
                                Text("Contact Distributor")
                                    .font(.caption)
                                Spacer()
                                Text("Color Quartz - \(textureChoices[CoveColorQuartz.Coat2TSColorant]), F-Grade, 50#")
                                    .font(.caption)
                                Spacer()
                                Text("\(quant(product: bCoatCoveQuartzTexture))")
                                    .font(.caption)
                            }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $CoveColorQuartz.Coat2Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: bCoatCoveQuartzTSA) + CoveColorQuartz.Coat2Waste) kit(s)")
            }
            .padding()
        }
    }



struct EpoxyCoveQuartzBCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
