//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct MVRCoatSandRC: View {
    @EnvironmentObject var SandRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var TSA_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast
    
    var TSMvr = stats(product: "Epoxy MVR", covRate: 190, MixRat: 1)

    
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
                Spacer()
                UPCMVRCoatInfo()
            }
            .padding()
            Text("UPC Colorant:")
            .fontWeight(.bold)
            Picker(selection: $SandRC.MVRPtA,
                label: ZStack {
                    Text("\(UPCColorantChoices[SandRC.MVRPtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
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
                    Text("UPC Part A - RC/TT, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-BRCUVAP6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV AP, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr))")
                        .font(.caption)
                }

                if SandRC.MVRPtA != 0
                {
                    HStack{
                        Text("\(UPCColorantCodes[SandRC.MVRPtA])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[SandRC.MVRPtA]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSMvr))")
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
                TextField("",value: $SandRC.MVRWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSMvr) + SandRC.MVRWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct MVRCoatSandRC_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
