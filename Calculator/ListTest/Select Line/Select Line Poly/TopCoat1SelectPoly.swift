//
//  TopCoat1Garage.swift
//  Calculator
//
//  Created by Kane Davidson on 6/15/21.
//

import SwiftUI


struct TopCoat1SelectPoly: View {
    
    @EnvironmentObject var ChipPoly : ColorChipValuesSelectPoly //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var PAPUTC1 : stats
    @EnvironmentObject var PAPUTC2 : stats2
   
    //var PAPUTC1 = stats(product: "Polyaspartic/Polyurethane", covRate: 225, MixRat: 1 )
    //var PAPUTC2 = stats2(product: "Polyaspartic/Polyurethane", covRate: 750, MixRat: 1 )

    var ChipTextureAO = stats(product: "Tex 50", covRate: 750, MixRat: 16 )
    var ChipTextureBead = stats(product: "Anti-Slip Bead", covRate: 750, MixRat: 16 )


    var TopCoat1Options = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS"]
    var TCoat1HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TCoat1PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    var TopCoat2Options = ["No Top Coat 2", "Polyaspartic 85 FC Clear"]
    var TCoat2HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TextureOptions = ["No Texture", "Anti-Slip Tex 50"]
    
    @State var TCoat1PtACode = "EX-KPLY92AF-01"
    @State var TCoat1PtBCode = "EX-KPLY92B-01"
    @State var TCoat2PtACode = ""
    @State var TCoat2PtBCode = ""
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func checkTC2()  {
        if ChipPoly.TCoat2Choice == 3 { //POLY HS
            PAPUTC2.covRate = 560
        }
        else if ChipPoly.TCoat2Choice == 4 { //POLY HP CLEAR GLOSS
            PAPUTC2.covRate = 575
        }
        else if ChipPoly.TCoat2Choice == 5 { //POLY HP CLEAR SATIN
            PAPUTC2.covRate = 675
        }
        else {
            PAPUTC2.covRate = 750 
        }
       
    } // Changes coverage rate based off of tc2 selection, returns quantity of kits needed based off selection
    
    func new_checkTC2() {
        switch ChipPoly.TCoat2Choice {
        case 3:
            PAPUTC2.covRate = 560 // POLY HS
        case 4:
            PAPUTC2.covRate = 575 // POLY HP CLEAR GLOSS
        case 5:
            PAPUTC2.covRate = 675 // POLLY HP CLEAR SATIN
        default:
            PAPUTC2.covRate = 750 // POLYASPARTIC
        }
    }
    
    func checkTC1() { // change tc1 product coverage rate based off selection and chip size 
        if ChipPoly.BroadcastSizeSelection == 0 {
            switch ChipPoly.TCoat1Choice {
            case 3:
                PAPUTC1.covRate = 210
            default:
                PAPUTC1.covRate = 300
            }
        }
        else{
            switch ChipPoly.TCoat1Choice {
            case 3:
                PAPUTC1.covRate = 150
            default:
                PAPUTC1.covRate = 250
            }
        }
    }
     
    
    func checkTCoatCodes() -> Void {
    
    if ChipPoly.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY85AZ-01"
        TCoat1PtBCode = "EX-KPLY85B-01"
    }
    else if ChipPoly.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY85AF-01"
        TCoat1PtBCode = "EX-KPLY85B-01"

    }
//    else if ChipPoly.TCoat1Choice == 1 && ChipPoly.TCoat1Hardener == 0 {
//        TCoat1PtACode = "EX-KPLY85AZ-01"
//        TCoat1PtBCode = "EX-KPLY85B-01"
//    }
//    else if ChipPoly.TCoat1Choice == 1 && ChipPoly.TCoat1Hardener == 1 {
//        TCoat1PtACode = "EX-KPLY85AF-01"
//        TCoat1PtBCode = "EX-KPLY85B-01"
//
//    }
//    else if ChipPoly.TCoat1Choice == 2 && ChipPoly.TCoat1Hardener == 0 {
//        TCoat1PtACode = "EX-KPLY92AZ-01"
//        TCoat1PtBCode = "EX-KPLY92B-01"
//
//    }
//    else if ChipPoly.TCoat1Choice == 2 && ChipPoly.TCoat1Hardener == 1 {
//        TCoat1PtACode = "EX-KPLY92AF-01"
//        TCoat1PtBCode = "EX-KPLY92B-01"
//
//    }
//    else if ChipPoly.TCoat1Choice == 3 && ChipPoly.TCoat1Hardener == 0 {
//        TCoat1PtACode = "EX-KPLYHSAZ-01"
//        TCoat1PtBCode = "EX-KPLYHSB-EA"
//        PAPUTC1.covRate = 210
//    }
//    else if ChipPoly.TCoat1Choice == 3 && ChipPoly.TCoat1Hardener == 1 {
//        TCoat1PtACode = "EX-KPLYHSAF-01"
//        TCoat1PtBCode = "EX-KPLYHSB-EA"
//        PAPUTC1.covRate = 210
        
     //END OF TCOAT1
        
        if ChipPoly.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
        else if ChipPoly.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
            
        }
        
}
    
    
    var body: some View {
        VStack {

            
//            if ChipPoly.TCoat2Choice != 6
//            {
//                HStack
//                {
//                    Text("Coating Thickness (TC2): 3-5 mils")
//                        .fontWeight(.heavy)
//                        .padding()
//                    Spacer()
//                }
//            }

        HStack {
            
            Text("Top Coat 1:")
                .fontWeight(.bold)
            
             Text("Polyaspartic 85 FC Clear ")
                .fontWeight(.bold)
            
            Spacer()
            PolySelectInfo()

             .onChange(of: ChipPoly.TCoat1Hardener) { _ in
               checkTCoatCodes()
             }
             .onChange(of: ChipPoly.BroadcastSizeSelection) { _ in
               checkTC1()
             }

//            Picker(selection: $ChipPoly.TCoat1Hardener,
//                label: ZStack {
//                    Text("\(TCoat1HardenerOptions[ChipPoly.TCoat1Hardener])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.2)
//                        .cornerRadius(5)
//                        .frame(width: 125, height: 25)
//                     //   .padding()
//            }) {
//               ForEach (0 ..< TCoat1HardenerOptions.count, id: \.self) { index in
//                    Text(self.TCoat1HardenerOptions[index]).tag(index)
//                }
//            }
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(5)
        }
        .padding()
            
            Text("Top Coat 2:")
                .fontWeight(.bold)

//            switch ( ChipPoly.TCoat2Choice )
//                {
//            case 3:
//                HStack {
//                    Text("Coating Thickness (TC2): 2-4 mils")
//                        .fontWeight(.heavy)
//                    Spacer()
//                    ChipPolyInfo()
//                }
//                .padding()
//            case 4:
//                HStack {
//                    Text("Coating Thickness (TC2): 2-4 mils")
//                        .fontWeight(.heavy)
//                    Spacer()
//                    ChipPolyInfo()
//                }
//                .padding()
//            case 5:
//                HStack {
//                    Text("Coating Thickness (TC2): 2-4 mils")
//                        .fontWeight(.heavy)
//                    Spacer()
//                    ChipPolyInfo()
//                }
//                .padding()
//                default:
//                    HStack {
//                        Text("Coating Thickness (TC1): 2-4 mils")
//                            .fontWeight(.heavy)
//                        Spacer()
//                        ChipPolyInfo()
//                    }
//                    .padding()
//            }
//            }
            HStack {
                 Picker(selection: $ChipPoly.TCoat2Choice,
                     label: ZStack {
                         Text("\(TopCoat2Options[ChipPoly.TCoat2Choice])")
                             .opacity(1)
                         Rectangle()
                             .fill(Color.gray)
                             .opacity(0.2)
                             .cornerRadius(5)
                             .frame(width: 225, height: 25)
                          //   .padding()
                 }) {
                    ForEach (0 ..< TopCoat2Options.count, id: \.self) { index in
                         Text(self.TopCoat2Options[index]).tag(index)
                     }
                 }
                 .background(Color.gray.opacity(0.2))
                 .cornerRadius(5)
                 .onChange(of: ChipPoly.TCoat2Choice) { _ in
                   //checkTC1()
                   new_checkTC2()
                   checkTCoatCodes()
                 }
                 .onChange(of: ChipPoly.TCoat2Hardener) { _ in
                   checkTCoatCodes()
                 }
                 .onAppear(perform: checkTCoatCodes)
                
//                if ChipPoly.TCoat2Choice == 1 {
//                Picker(selection: $ChipPoly.TCoat2Hardener,
//                    label: ZStack {
//                        Text("\(TCoat2HardenerOptions[ChipPoly.TCoat2Hardener])")
//                            .opacity(1)
//                        Rectangle()
//                            .fill(Color.gray)
//                            .opacity(0.2)
//                            .cornerRadius(5)
//                            .frame(width: 125, height: 25)
//                         //   .padding()
//                }) {
//                   ForEach (0 ..< TCoat2HardenerOptions.count, id: \.self) { index in
//                        Text(self.TCoat2HardenerOptions[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
//                .onChange(of: ChipPoly.TCoat2Choice) { _ in
//                  //checkTC1()
//                  new_checkTC2()
//                  checkTCoatCodes()
//                }
//                }
            }
            if ChipPoly.TCoat2Choice == 1 { //Displays texture if it is selected
            Text("Texture:")
             .fontWeight(.bold)
                Picker(selection: $ChipPoly.texture1,
                    label: ZStack {
                        Text("\(TextureOptions[ChipPoly.texture1])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .cornerRadius(5)
                            .frame(width: 265, height: 25)
                         //   .padding()
                }) {
                   ForEach (0 ..< TextureOptions.count, id: \.self) { index in
                        Text(self.TextureOptions[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .onChange(of: ChipPoly.TCoat2Choice) { _ in
                  //checkTC1()
                  new_checkTC2()
                  checkTCoatCodes()
                }
           } //Displays picker for TC2 if a second top coat is selected
            VStack { // Start of coat summary
                Text("Top Coat 1")
                    .bold()
                HStack {
                    Text("PRODUCT CODE")
                        .underline()
                        .font(.caption)
                    Spacer()
                    Text("PRODUCT")
                        .underline()
                        .font(.caption)
                    Spacer()
//                    Text("QUANTITY")
//                        .underline()
//                        .font(.caption)
                }
                
                HStack {
                    Text("EX-285FCPU-KIT")
                        .font(.caption)
                    Spacer()
                    Text("Kretus Select Poly FC, Clear Kit, 2 gal")
                        .font(.caption)
                    Spacer()
//                    Text("\(quant(product: PAPUTC1))")
//                        .font(.caption)
                }
                
//                HStack {
//                    Text("\(TCoat1PtBCode)")
//                        .font(.caption)
//                    Spacer()
//                        Text("Polyaspartic 85 Part B, 1 gal")
//                            .font(.caption)
//
////                    else {
////                        Text("\(TopCoat1Options[ChipPoly.TCoat1Choice]) Part B, 1/2 gal")
////                            .font(.caption)
////                    }
//                    Spacer()
//                    Text("\(quant(product: PAPUTC1))")
//                        .font(.caption)
//                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()

                if ChipPoly.TCoat2Choice == 1 { //Displays TC2 products if a second tc is chosen
                    VStack {
                        Text("Top Coat 2")
                            .bold()
                        
                        HStack {
                            Text("PRODUCT CODE")
                                .underline()
                                .font(.caption)
                            Spacer()
                            Text("PRODUCT")
                                .underline()
                                .font(.caption)
                            Spacer()
//                            Text("QUANTITY")
//                                .underline()
//                                .font(.caption)
                        }
                        
                        HStack {
                            Text("EX-285FCPU-KIT")
                                .font(.caption)
                            Spacer()
                            Text("Kretus Select Poly FC, Clear Kit, 2 gal")
                                .font(.caption)
                            Spacer()
//                            Text("\(quant(product: PAPUTC1))")
//                                .font(.caption)
                        }
                        
                        if ChipPoly.texture1 != 0 {
                                HStack {
                                    Text("EX-KAST50-EA")
                                        .font(.caption)
                                    Spacer()
                                    Text("Anti-Slip Tex 50, 2.75#")
                                        .font(.caption)
                                    Spacer()
//                                    Text("\(quant(product: ChipTextureAO))")
//                                        .font(.caption)
                                        }
                                                }
                    }
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                    .padding()
                }
                
        }
//        HStack {
//            Text("Add Waste Factor: ")
//            Spacer()
//            TextField("",value: $ChipPoly.TCoatWaste, formatter: NumberFormatter())
//                .frame(width:30, height:25)
//                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//                .cornerRadius(5.0)
//            Text("kit(s)")
//        }
        .padding()
//        if ChipPoly.TCoat2Choice != 0 {
//        HStack {
//            Text("Total:")
//            Spacer()
//            Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipPoly.TCoatWaste) kit(s)")
//        }
//        }
//        else {
//        HStack {
//            Text("Total:")
//            Spacer()
//            Text("\(quant(product: PAPUTC1) + ChipPoly.TCoatWaste) kit(s)")
//        }
//        .padding()
//        }
        }
    }
//}

struct TopCoat1SelectPoly_Previews: PreviewProvider {
    static var previews: some View {
        TopCoat1Garage()
    }
}
