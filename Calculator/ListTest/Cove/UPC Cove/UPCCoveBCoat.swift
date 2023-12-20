//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI



struct UPCCoveBCoat: View {
    

    
    let typesB = ["EZ", "Fast" ]
    
    let typesBCodes = ["EX-KUPCWCZ3-EA", "EX-KUPCWCF3-EA"]
    
    let UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    let UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var CoveColor : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var bCoatCoveUPCA : stats2
    @EnvironmentObject var bCoatCoveUPCB : stats2
    @EnvironmentObject var bCoatCoveUPCColorant : stats2
    @EnvironmentObject var bCoatCoveTexture : stats2
    
    
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
            /*
            Text("Coating Thickness: 4\", 6\"")
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
             */
            
 //           Spacer()
            
//            BCoatCoveColorInfo()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
                Text("UPC WC/VC Part B:")
                    .fontWeight(.bold)
                Picker(selection: $CoveColor.Coat2PtB,
                       label: ZStack {
                    Text("\(typesB[CoveColor.Coat2PtB])")
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
                Text("UPC Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $CoveColor.Coat2TSColorant,
                       label: ZStack {
                    Text("\(UPCColorantChoices[CoveColor.Coat2TSColorant])")
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
                            Text("EX-KUPCAWC-EA")
                                .font(.caption)
                            Spacer()
                            Text("UPC Part A - WC/VC, 3#")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: bCoatCoveUPCA))")
                                .font(.caption)
                        }
                    
                    HStack{
                        Text("\(typesBCodes[CoveColor.Coat2PtB])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - WC/VC \(typesB[CoveColor.Coat2PtB]), 3#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: bCoatCoveUPCB))")
                            .font(.caption)
                    }
                HStack{
                    Text("EX-KUPCWCC3-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - WC \(typesB[CoveColor.Coat2PtB]), 30#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: bCoatCoveUPCB))")
                        .font(.caption)
                }
                if CoveColor.Coat2TSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[CoveColor.Coat2TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant: \(UPCColorantChoices[CoveColor.Coat2TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: bCoatCoveUPCColorant))")
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
                TextField("",value: $CoveColor.Coat2Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: bCoatCoveUPCA) + CoveColor.Coat2Waste) kit(s)")
            }
            .padding()
        }
    }



struct UPCCoveBCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
