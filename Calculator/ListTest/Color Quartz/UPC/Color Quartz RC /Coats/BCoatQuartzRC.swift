//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct BCoatQuartzRC: View {
    
 
    @EnvironmentObject var QuartzRC : ColorQuartzRCValues //Used for coat selections
    @EnvironmentObject var UPC_QuartzRC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColorant_QuartzRC : stats //Used for system stats (mixRat,CovRate, etc)
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
                if QuartzRC.BroadcastSizeSelection == 0
                {
                    Text("Coating Thickness: 15-20 mils")
                        .fontWeight(.heavy)
                }
                else
                {
                    Text("Coating Thickness: 8-12 mils")
                        .fontWeight(.heavy)
                }
                Spacer()
                QuartzRCBCoatInfo()
            }
            .padding()
           Text("Choose Your Speed:")
            .fontWeight(.bold)
            Picker(selection: $QuartzRC.BCoatPtB,
                label: ZStack {
                    Text("\(typesB[QuartzRC.BCoatPtB])")
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
             Picker(selection: $QuartzRC.BCoatTSColorant,
                 label: ZStack {
                     Text("\(UPCColorantChoices[QuartzRC.BCoatTSColorant])")
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
                    Text("\(quant(product: UPC_QuartzRC))")
                        .font(.caption)
                }
            
                HStack{
                    Text("\(typesBCodes[QuartzRC.BCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC/TT \(typesB[QuartzRC.BCoatPtB]), 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzRC))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzRC))")
                        .font(.caption)
                }
                
                if QuartzRC.BCoatTSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[QuartzRC.BCoatTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[QuartzRC.BCoatTSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCColorant_QuartzRC))")
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
                TextField("",value: $QuartzRC.BCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: UPC_QuartzRC) + QuartzRC.BCoatWaste) kit(s)")
            }
            .padding()
        }
    }


struct BCoatQuartzRC_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
