//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

struct MetallicUVBCoat: View {

    let typesB = ["EZ - Clear", "FC - Clear"]
    
    let typesBCodes = ["EX-KPLYHSAZ-01", "EX-KPLYHSAF-01"]
    
    let pigmentChoices = ["Antique Silver", "Black", "Cabernet", "California Gold", "Carbon", "Cherrywood", "Dark Blue", "Dark Gray", "Forest Green", "Gold Glitter", "Ivory", "Jade Green", "New Copper", "Olive", "Sedona", "Silver Glitter", "Sky Blue", "Sterling", "Sunset Gold", "Violet"]
    
    let pigmentCodes = [ "EX-KMETASL-EA", "EX-KMETABL-EA", "EX-KMETACB-EA", "EX-KMETACG-EA", "EX-KMETACN-EA", "EX-KMETACW-EA", "EX-KMETADB-EA", "EX-KMETADG-EA", "EX-KMETAFG-EA", "EX-KMETGG-EA", "EX-KMETAIV-EA", "EX-KMETAJG-EA", "EX-KMETANC-EA", "EX-KMETAOL-EA", "EX-KMETASD-EA", "EX-KMETASG-EA", "EX-KMETASB-EA", "EX-KMETAST-EA", "EX-KMETASN-EA", "EX-KMETAVL-EA" ]
    
    @EnvironmentObject var tsMetallicUV : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatMetallicUVTSA : stats2
    @EnvironmentObject var bCoatMetallicUVTSB : stats2
    @EnvironmentObject var bCoatMetallicUVPigment : stats2



    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    var body: some View {
        HStack {
            /*
            Text("Coating Thickness: 8 mils")
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
             */
            
 //           PCoattsMetallicUVInfo()
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
                Text("Polyurethane HS:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallicUV.Coat2PtB,
                       label: ZStack {
                    Text("\(typesB[tsMetallicUV.Coat2PtB])")
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
                //             .onChange(of: tsMetallicUV.Coat1PtB) { _ in
                //                 CheckCoatChoices()
                //             }
/*
                Text("UV Color:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallicUV.Coat2TSColorant,
                       label: ZStack {
                    Text("\(pigmentChoices[tsMetallicUV.Coat2TSColorant])")
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
                            Text("\(typesBCodes[tsMetallicUV.Coat2PtB])")
                                .font(.caption)
                            Spacer()
                            Text("Polyurethane HS Part A: \(typesB[tsMetallicUV.Coat2PtB]), 1 gal ")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: bCoatMetallicUVTSA))")
                                .font(.caption)
                        }
                    
                    HStack{
                        Text("EX-KPLYHSB-EA")
                            .font(.caption)
                        Spacer()
                        Text("Polyurethane HS Part B, 1/2 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: bCoatMetallicUVTSB))")
                            .font(.caption)
                    }
                    
                    HStack {
/*
                                Text("\(pigmentCodes[tsMetallicUV.Coat2TSColorant])")
                                    .font(.caption)
*/
                                Spacer()
                                Text("UV Color - see Kretus Color Chart, 8 oz")
                                    .font(.caption)
                                Spacer()
                                Text("\(quant(product: bCoatMetallicUVPigment))")
                                    .font(.caption)
                            }

            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $tsMetallicUV.Coat2Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: bCoatMetallicUVTSA) + tsMetallicUV.Coat2Waste) kit(s)")
            }
            .padding()
        }
    }



struct tsMetallicUVBCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
