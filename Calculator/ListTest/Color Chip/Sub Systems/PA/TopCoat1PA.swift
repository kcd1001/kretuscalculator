//
//  TopCoat1Garage.swift
//  Calculator
//
//  Created by Kane Davidson on 6/15/21.
//

import SwiftUI


struct TopCoat1PA: View {
    
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections
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
        if ChipPA.TCoat2Choice == 3 { //POLY HS
            PAPUTC2.covRate = 560
        }
        else if ChipPA.TCoat2Choice == 4 { //POLY HP CLEAR GLOSS
            PAPUTC2.covRate = 575
        }
        else if ChipPA.TCoat2Choice == 5 { //POLY HP CLEAR SATIN
            PAPUTC2.covRate = 675
        }
        else {
            PAPUTC2.covRate = 750 
        }
       
    } // Changes coverage rate based off of tc2 selection, returns quantity of kits needed based off selection
    
    func new_checkTC2() {
        switch ChipPA.TCoat2Choice {
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
        if ChipPA.BroadcastSizeSelection == 0 {
            switch ChipPA.TCoat1Choice {
            case 3:
                PAPUTC1.covRate = 210
            default:
                PAPUTC1.covRate = 300
            }
        }
        else{
            switch ChipPA.TCoat1Choice {
            case 3:
                PAPUTC1.covRate = 150
            default:
                PAPUTC1.covRate = 250
            }
        }
    }
     
    func checkTexture() {
        if ChipPA.TCoat2Choice == 1 || ChipPA.TCoat2Choice == 2 {
            ChipTextureBead.MixRat = 12
        }
        if ChipPA.TCoat2Choice == 4 {
            ChipTextureAO.covRate = 575
            ChipTextureBead.MixRat = 8
            ChipTextureBead.covRate = 575
        }
        if ChipPA.TCoat2Choice == 5 {
            ChipTextureAO.covRate = 675
            ChipTextureBead.MixRat = 8
            ChipTextureBead.covRate = 675
        }
        if ChipPA.TCoat2Choice == 3 {
            ChipTextureAO.covRate = 560
            ChipTextureBead.MixRat = 8
            ChipTextureBead.covRate = 560 
        }
    }
    
    func checkTCoatCodes() -> Void {
    
    if ChipPA.TCoat1Choice == 0 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY72AZ-01"
        TCoat1PtBCode = "EX-KPLY72B-01"
    }
    else if ChipPA.TCoat1Choice == 0 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY72AF-01"
        TCoat1PtBCode = "EX-KPLY72B-01"

    }
    else if ChipPA.TCoat1Choice == 1 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY85AZ-01"
        TCoat1PtBCode = "EX-KPLY85B-01"
    }
    else if ChipPA.TCoat1Choice == 1 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY85AF-01"
        TCoat1PtBCode = "EX-KPLY85B-01"

    }
    else if ChipPA.TCoat1Choice == 2 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY92AZ-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipPA.TCoat1Choice == 2 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY92AF-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipPA.TCoat1Choice == 3 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLYHSAZ-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    }
    else if ChipPA.TCoat1Choice == 3 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLYHSAF-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210 
    } //END OF TCOAT1
    if ChipPA.TCoat2Choice == 0 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY72AZ-01"
            TCoat2PtBCode = "EX-KPLY72B-01"
        }
    else if ChipPA.TCoat2Choice == 0 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY72AF-01"
            TCoat2PtBCode = "EX-KPLY72B-01"

        }
    else if ChipPA.TCoat2Choice == 1 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
    else if ChipPA.TCoat2Choice == 1 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"

        }
    else if ChipPA.TCoat2Choice == 2 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY92AZ-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipPA.TCoat2Choice == 2 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY92AF-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipPA.TCoat2Choice == 3 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLYHSAZ-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"
        }
    else if ChipPA.TCoat2Choice == 3 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLYHSAF-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"

        }
}
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness (TC1): 8-12 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipTopCoatInfo()
            }
            .padding()
            
            if ChipPA.TCoat2Choice != 6
            {
                HStack
                {
                    Text("Coating Thickness (TC2): 3-5 mils")
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                }
            }
        Text("Top Coat 1:")
         .fontWeight(.bold)
        HStack {
             Picker(selection: $ChipPA.TCoat1Choice,
                 label: ZStack {
                     Text("\(TopCoat1Options[ChipPA.TCoat1Choice])")
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
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)
             .onChange(of: ChipPA.TCoat1Choice) { _ in
               checkTC1()
               checkTCoatCodes()
             }
             .onChange(of: ChipPA.TCoat1Hardener) { _ in
               checkTCoatCodes()
             }
             .onChange(of: ChipPA.BroadcastSizeSelection) { _ in
               checkTC1()
             }

            Picker(selection: $ChipPA.TCoat1Hardener,
                label: ZStack {
                    Text("\(TCoat1HardenerOptions[ChipPA.TCoat1Hardener])")
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
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
        }
            Text("Top Coat 2:")
                .fontWeight(.bold)
            HStack {
                 Picker(selection: $ChipPA.TCoat2Choice,
                     label: ZStack {
                         Text("\(TopCoat2Options[ChipPA.TCoat2Choice])")
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
                 .onChange(of: ChipPA.TCoat2Choice) { _ in
                   //checkTC1()
                   new_checkTC2()
                   checkTCoatCodes()
                   checkTexture()
                 }
                 .onChange(of: ChipPA.TCoat2Hardener) { _ in
                   checkTCoatCodes()
                 }
                if ChipPA.TCoat2Choice != 6 && ChipPA.TCoat2Choice != 4 && ChipPA.TCoat2Choice != 5 {
                Picker(selection: $ChipPA.TCoat2Hardener,
                    label: ZStack {
                        Text("\(TCoat2HardenerOptions[ChipPA.TCoat2Hardener])")
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
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .onChange(of: ChipPA.TCoat2Choice) { _ in
                  //checkTC1()
                  new_checkTC2()
                  checkTCoatCodes()
                  checkTexture()
                }
                }
            }
            if ChipPA.TCoat2Choice != 6 { //Displays texture if it is selected
            Text("Texture:")
             .fontWeight(.bold)
                Picker(selection: $ChipPA.texture1,
                    label: ZStack {
                        Text("\(TextureOptions[ChipPA.texture1])")
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
                .onChange(of: ChipPA.TCoat2Choice) { _ in
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
             
            
                if (ChipPA.TCoat1Choice != ChipPA.TCoat2Choice) {

                    HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipPA.TCoat1Hardener]), 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1))")
                        .font(.caption)
                }

                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipPA.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1 gal")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1/2 gal")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1))")
                        .font(.caption)
                }

                if ChipPA.TCoat2Choice != 6 { //Displays TC2 products if a second tc is chosen
                HStack {
                    Text("\(TCoat2PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipPA.TCoat2Hardener]), 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC2))")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat2PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipPA.TCoat2Choice != 3 {
                    Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) Part B, 1 gal")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) Part B, 1/2 gal")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC2))")
                        .font(.caption)
                }
                }
                }
                if (ChipPA.TCoat1Choice == ChipPA.TCoat2Choice) && (ChipPA.TCoat1Hardener == ChipPA.TCoat2Hardener) {
                    HStack {
                        Text("\(TCoat1PtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipPA.TCoat1Hardener]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(TCoat1PtBCode)")
                            .font(.caption)
                        Spacer()
                        if ChipPA.TCoat1Choice != 3 {
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1 gal")
                            .font(.caption)
                        }
                        else {
                            Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1/2 gal")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                }
                if (ChipPA.TCoat1Choice == ChipPA.TCoat2Choice) && (ChipPA.TCoat1Hardener != ChipPA.TCoat2Hardener) {
                    HStack {
                        Text("\(TCoat1PtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipPA.TCoat1Hardener]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: PAPUTC1))")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(TCoat2PtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipPA.TCoat2Hardener]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                    HStack {
                        Text("\(TCoat1PtBCode)")
                            .font(.caption)
                        Spacer()
                        if ChipPA.TCoat1Choice != 3 {
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1 gal")
                            .font(.caption)
                        }
                        else {
                            Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1/2 gal")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2))")
                            .font(.caption)
                    }
                }
                if ChipPA.texture1 != 0 {
                    if ChipPA.texture1 < 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[ChipPA.texture1]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureAO))")
                            .font(.caption)
                    }
                }
                    if ChipPA.texture1 >= 5 {
                        HStack {
                            Text("Contact Distributor")
                                .font(.caption)
                            Spacer()
                            Text("\(TextureOptions[ChipPA.texture1]), 32 oz")
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
            TextField("",value: $ChipPA.TCoatWaste, formatter: NumberFormatter())
                .frame(width:30, height:25)
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
            Text("kit(s)")
        }
        .padding()
        if ChipPA.TCoat2Choice != 6 {
        HStack {
            Text("Total:")
            Spacer()
            Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipPA.TCoatWaste) kit(s)")
        }
        }
        else {
        HStack {
            Text("Total:")
            Spacer()
            Text("\(quant(product: PAPUTC1) + ChipPA.TCoatWaste) kit(s)")
        }
        }
        }
    }
//}

struct TopCoat1PA_Previews: PreviewProvider {
    static var previews: some View {
        TopCoat1Garage()
    }
}
