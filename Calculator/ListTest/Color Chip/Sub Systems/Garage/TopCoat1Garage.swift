//
//  TopCoat1Garage.swift
//  Calculator
//
//  Created by Kane Davidson on 6/15/21.
//

import SwiftUI

class stats2 : stats {}

struct TopCoat1Garage: View {
    
    @EnvironmentObject var ChipGarage : ColorChipValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var PAPUTC1 : stats
    @EnvironmentObject var PAPUTC2 : stats2
   
    //var PAPUTC1 = stats(product: "Polyaspartic/Polyurethane", covRate: 225, MixRat: 1 )
    //var PAPUTC2 = stats2(product: "Polyaspartic/Polyurethane", covRate: 750, MixRat: 1 )

    var ChipTextureAO = stats(product: "Aluminum Oxide", covRate: 750, MixRat: 1 )
    var ChipTextureBead = stats(product: "Anti-Slip Bead", covRate: 750, MixRat: 16 )


    var TopCoat1Options = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS"]
    var TCoat1HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TCoat1PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    var TopCoat2Options = [ "Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS" , "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin",  "No Top Coat 2"]
    var TCoat2HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit", "Anti-Slip Aluminum Oxide 60 grit", "Anti-Slip Aluminum Oxide 80 grit", "Anti-Slip Bead 100", "Anti-Slip Bead 50"]
    
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
        if ChipGarage.TCoat2Choice == 3 { //POLY HS
            PAPUTC2.covRate = 560
        }
        else if ChipGarage.TCoat2Choice == 4 { //POLY HP CLEAR GLOSS
            PAPUTC2.covRate = 575
        }
        else if ChipGarage.TCoat2Choice == 5 { //POLY HP CLEAR SATIN
            PAPUTC2.covRate = 675
        }
        else {
            PAPUTC2.covRate = 750 
        }
       
    } // Changes coverage rate based off of tc2 selection, returns quantity of kits needed based off selection
    
    func new_checkTC2() {
        switch ChipGarage.TCoat2Choice {
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
        if ChipGarage.BroadcastSizeSelection == 0 {
            switch ChipGarage.TCoat1Choice {
            case 3:
                PAPUTC1.covRate = 210
            default:
                PAPUTC1.covRate = 300
            }
        }
        else{
            switch ChipGarage.TCoat1Choice {
            case 3:
                PAPUTC1.covRate = 150
            default:
                PAPUTC1.covRate = 250
            }
        }
    }
     
    func checkTexture() {
        if ChipGarage.TCoat2Choice == 1 || ChipGarage.TCoat2Choice == 2 {
            ChipTextureBead.MixRat = 12
        }
        if ChipGarage.TCoat2Choice == 4 {
            ChipTextureAO.covRate = 575
            ChipTextureBead.MixRat = 8
            ChipTextureBead.covRate = 575
        }
        if ChipGarage.TCoat2Choice == 5 {
            ChipTextureAO.covRate = 675
            ChipTextureBead.MixRat = 8
            ChipTextureBead.covRate = 675
        }
        if ChipGarage.TCoat2Choice == 3 {
            ChipTextureAO.covRate = 560
            ChipTextureBead.MixRat = 8
            ChipTextureBead.covRate = 560 
        }
    }
    
    func checkTCoatCodes() -> Void {
    
    if ChipGarage.TCoat1Choice == 0 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY72AZ-01"
        TCoat1PtBCode = "EX-KPLY72B-01"
    }
    else if ChipGarage.TCoat1Choice == 0 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY72AF-01"
        TCoat1PtBCode = "EX-KPLY72B-01"

    }
    else if ChipGarage.TCoat1Choice == 1 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY85AZ-01"
        TCoat1PtBCode = "EX-KPLY85B-01"
    }
    else if ChipGarage.TCoat1Choice == 1 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY85AF-01"
        TCoat1PtBCode = "EX-KPLY85B-01"

    }
    else if ChipGarage.TCoat1Choice == 2 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY92AZ-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipGarage.TCoat1Choice == 2 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY92AF-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipGarage.TCoat1Choice == 3 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLYHSAZ-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    }
    else if ChipGarage.TCoat1Choice == 3 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLYHSAF-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210 
    } //END OF TCOAT1
    if ChipGarage.TCoat2Choice == 0 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY72AZ-01"
            TCoat2PtBCode = "EX-KPLY72B-01"
        }
    else if ChipGarage.TCoat2Choice == 0 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY72AF-01"
            TCoat2PtBCode = "EX-KPLY72B-01"

        }
    else if ChipGarage.TCoat2Choice == 1 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
    else if ChipGarage.TCoat2Choice == 1 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"

        }
    else if ChipGarage.TCoat2Choice == 2 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY92AZ-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipGarage.TCoat2Choice == 2 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY92AF-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipGarage.TCoat2Choice == 3 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLYHSAZ-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"
        }
    else if ChipGarage.TCoat2Choice == 3 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLYHSAF-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"

        }
}
    
    
    var body: some View {
        VStack {
        Text("Top Coat 1:")
         .fontWeight(.bold)
        HStack {
             Picker(selection: $ChipGarage.TCoat1Choice,
                 label: ZStack {
                     Text("\(TopCoat1Options[ChipGarage.TCoat1Choice])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 225, height: 25)
                      //   .padding()
             }) {
                ForEach (0 ..< TopCoat1Options.count, id: \.self) { index in
                     Text(self.TopCoat1Options[index]).tag(index)
                 }
             }
             .pickerStyle(MenuPickerStyle())
             .onChange(of: ChipGarage.TCoat1Choice) { _ in
               checkTC1()
               checkTCoatCodes()
             }
             .onChange(of: ChipGarage.TCoat1Hardener) { _ in
               checkTCoatCodes()
             }
             .onChange(of: ChipGarage.BroadcastSizeSelection) { _ in
               checkTC1()
             }

            Picker(selection: $ChipGarage.TCoat1Hardener,
                label: ZStack {
                    Text("\(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 125, height: 25)
                     //   .padding()
            }) {
               ForEach (0 ..< TCoat1HardenerOptions.count, id: \.self) { index in
                    Text(self.TCoat1HardenerOptions[index]).tag(index)
                }
            } .pickerStyle(MenuPickerStyle())
        }
            Text("Top Coat 2:")
                .fontWeight(.bold)
            HStack {
                 Picker(selection: $ChipGarage.TCoat2Choice,
                     label: ZStack {
                         Text("\(TopCoat2Options[ChipGarage.TCoat2Choice])")
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
                 .pickerStyle(MenuPickerStyle())
                 .onChange(of: ChipGarage.TCoat2Choice) { _ in
                   //checkTC1()
                   new_checkTC2()
                   checkTCoatCodes()
                   checkTexture()
                 }
                 .onChange(of: ChipGarage.TCoat2Hardener) { _ in
                   checkTCoatCodes()
                 }
                if ChipGarage.TCoat2Choice != 6 && ChipGarage.TCoat2Choice != 4 && ChipGarage.TCoat2Choice != 5 {
                Picker(selection: $ChipGarage.TCoat2Hardener,
                    label: ZStack {
                        Text("\(TCoat2HardenerOptions[ChipGarage.TCoat2Hardener])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .cornerRadius(5)
                            .frame(width: 125, height: 25)
                         //   .padding()
                }) {
                   ForEach (0 ..< TCoat2HardenerOptions.count, id: \.self) { index in
                        Text(self.TCoat2HardenerOptions[index]).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: ChipGarage.TCoat2Choice) { _ in
                  //checkTC1()
                  new_checkTC2()
                  checkTCoatCodes()
                  checkTexture()
                }
                }
            }
            if ChipGarage.TCoat2Choice != 6 { //Displays texture if it is selected
            Text("Texture:")
             .fontWeight(.bold)
                Picker(selection: $ChipGarage.texture1,
                    label: ZStack {
                        Text("\(TextureOptions[ChipGarage.texture1])")
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
                .pickerStyle(MenuPickerStyle())
                .onChange(of: ChipGarage.TCoat2Choice) { _ in
                  //checkTC1()
                  new_checkTC2()
                  checkTCoatCodes()
                  checkTexture()
                }
           } //Displays picker for TC2 if a second top coat is selected
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
             
            
                if (ChipGarage.TCoat1Choice != ChipGarage.TCoat2Choice) {

                    HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener]), 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1))")
                        .font(.caption)
                }

                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipGarage.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1 gal")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1/2 gal")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1))")
                        .font(.caption)
                }

                if ChipGarage.TCoat2Choice != 6 { //Displays TC2 products if a second tc is chosen
                HStack {
                    Text("\(TCoat2PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipGarage.TCoat2Hardener]), 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC2))")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat2PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipGarage.TCoat2Choice != 3 {
                    Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) Part B, 1 gal")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) Part B, 1/2 gal")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC2))")
                        .font(.caption)
                }
                }
                }
                if (ChipGarage.TCoat1Choice == ChipGarage.TCoat2Choice) && (ChipGarage.TCoat1Hardener == ChipGarage.TCoat2Hardener) {
                    HStack {
                        Text("\(TCoat1PtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(TCoat1PtBCode)")
                            .font(.caption)
                        Spacer()
                        if ChipGarage.TCoat1Choice != 3 {
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1 gal")
                            .font(.caption)
                        }
                        else {
                            Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1/2 gal")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                }
                if (ChipGarage.TCoat1Choice == ChipGarage.TCoat2Choice) && (ChipGarage.TCoat1Hardener != ChipGarage.TCoat2Hardener) {
                    HStack {
                        Text("\(TCoat1PtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: PAPUTC1))")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(TCoat2PtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipGarage.TCoat2Hardener]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(TCoat1PtBCode)")
                            .font(.caption)
                        Spacer()
                        if ChipGarage.TCoat1Choice != 3 {
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1 gal")
                            .font(.caption)
                        }
                        else {
                            Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1/2 gal")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                }
                if ChipGarage.texture1 != 0 {
                    if ChipGarage.texture1 < 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[ChipGarage.texture1]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureAO))")
                            .font(.caption)
                    }
                }
                    if ChipGarage.texture1 >= 5 {
                        HStack {
                            Text("Contact Distributor")
                                .font(.caption)
                            Spacer()
                            Text("\(TextureOptions[ChipGarage.texture1]), 32 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: ChipTextureBead))")
                                .font(.caption)
                        }
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
            TextField("",value: $ChipGarage.TCoatWaste, formatter: NumberFormatter())
                .frame(width:30, height:25)
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
            Text("kit(s)")
        }
        .padding()
        if ChipGarage.TCoat2Choice != 6 {
        HStack {
            Text("Total:")
            Spacer()
            Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipGarage.TCoatWaste) kit(s)")
        }
        }
        else {
        HStack {
            Text("Total:")
            Spacer()
            Text("\(quant(product: PAPUTC1) + ChipGarage.TCoatWaste) kit(s)")
        }
        }
        }
    }
//}

struct TopCoat1Garage_Previews: PreviewProvider {
    static var previews: some View {
        TopCoat1Garage()
    }
}
