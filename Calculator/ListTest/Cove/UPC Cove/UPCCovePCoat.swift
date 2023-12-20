//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var coveUPCA = stats(product: "Top Shelf Epoxy Part A", covRate: 200, MixRat: 1)
var coveUPCB = stats(product: "Top Shelf Epoxy Part A", covRate: 200, MixRat: 0.5)
var coveUPCColorant = stats(product: "Top Shelf Epoxy Part A", covRate: 200, MixRat: 16)

struct UPCCovePCoat: View {
        
    
    let typesB = ["AP", "EZ", "Fast" ]
        
    let typesBCodes = ["EX-KUPCRCA6-EA", "EX-KUPCRCZ6-EA", "EX-KUPCRCF6-EA"]
    
    let UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    let UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var CoveColor : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var PUPtACode = "EX-KPLY72AZ-01"
    @State var PUHardenerCode = "EX-KPLY72B-01"
    @State var isSolventCleaner = false

    @State var UPCACode = "EX-KUPCARC-EA"
    @State var UPCBCode = "EX-KUPCRCA6-EA"
    @State var UPCCode = "EX-KUPCRFC-EA"


    
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
            
 //           PCoatCoveColorInfo()
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
                Text("UPC RC Part B:")
                    .fontWeight(.bold)
                Picker(selection: $CoveColor.Coat1PtB,
                       label: ZStack {
                    Text("\(typesB[CoveColor.Coat1PtB])")
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
        Picker(selection: $CoveColor.Coat1TSColorant,
               label: ZStack {
            Text("\(UPCColorantChoices[CoveColor.Coat1TSColorant])")
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
                            Text("\(quant(product: coveUPCA))")
                                .font(.caption)
                        }
                    
                    HStack{
                        Text("\(typesBCodes[CoveColor.Coat1PtB])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - RC/TT \(typesB[CoveColor.Coat1PtB]), 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: coveUPCB))")
                            .font(.caption)
                    }
                HStack
                {
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: coveUPCA))")
                        .font(.caption)
                }
                
                if CoveColor.Coat1TSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[CoveColor.Coat1TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant: \(UPCColorantChoices[CoveColor.Coat1TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: coveUPCColorant))")
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
                TextField("",value: $CoveColor.Coat1Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: coveUPCA) + CoveColor.Coat1Waste) kit(s)")
            }
            .padding()
        }
    }



struct UPCCovePCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
