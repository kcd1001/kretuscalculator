//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct BCoatQuartzTT: View {
    
 
    @EnvironmentObject var QuartzTT : ColorQuartzRCValues //Used for coat selections
    @EnvironmentObject var UPC_QuartzTT : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColorant_QuartzTT : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartzRC : statsBroadcast
    
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
                QuartzTTBCoatInfo()
            }
            .padding()
           Text("Choose Your Speed:")
            .fontWeight(.bold)
            Picker(selection: $QuartzTT.BCoatPtB,
                label: ZStack {
                    Text("\(typesB[QuartzTT.BCoatPtB])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< typesB.count, id: \.self) { index in
                    Text(self.typesB[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)

            Text("UPC Colorant:")
             .fontWeight(.bold)
             Picker(selection: $QuartzTT.BCoatTSColorant,
                 label: ZStack {
                     Text("\(UPCColorantChoices[QuartzTT.BCoatTSColorant])")
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
                    Text("\(quant(product: UPC_QuartzTT))")
                        .font(.caption)
                }
            
                HStack{
                    Text("\(typesBCodes[QuartzTT.BCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC/TT \(typesB[QuartzTT.BCoatPtB]), 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzTT))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCTTC4-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - TT, 42#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzTT))")
                        .font(.caption)
                }
                
                if QuartzTT.BCoatTSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[QuartzTT.BCoatTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[QuartzTT.BCoatTSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCColorant_QuartzTT))")
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
                TextField("",value: $QuartzTT.BCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: UPC_QuartzTT) + QuartzTT.BCoatWaste) kit(s)")
            }
            .padding()
        }
    }


struct BCoatQuartzTT_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
