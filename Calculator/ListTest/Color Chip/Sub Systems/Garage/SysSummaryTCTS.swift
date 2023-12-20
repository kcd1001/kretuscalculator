//
//  SysSummaryTC.swift
//  Calculator
//
//  Created by Kane Davidson on 8/2/21.
//

import SwiftUI

struct SysSummaryTCTS: View {
    
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var PAPUTC1 : stats
    @EnvironmentObject var PAPUTC2 : stats
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var ChipTextureAO : stats
    @EnvironmentObject var ChipTextureBead : stats

    @State var TCoat1PtACode = "EX-KPLY92AF-01"
    @State var TCoat1PtBCode = "EX-KPLY92B-01"
    @State var TCoat2PtACode = ""
    @State var TCoat2PtBCode = ""

    var TopCoat1Options = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS"]
    var TCoat1HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TopCoat2Options = [ "Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS" , "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin",  "No Top Coat 2"]
    
    var TCoat2HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit", "Anti-Slip Aluminum Oxide 60 grit", "Anti-Slip Aluminum Oxide 80 grit", "Anti-Slip Bead 100", "Anti-Slip Bead 50"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func checkTCoatCodes() -> Void {
      if ChipTS.TCoat1Choice == 0 && ChipTS.TCoat1Hardener == 0 {
           TCoat1PtACode = "EX-KPLY72AZ-01"
           TCoat1PtBCode = "EX-KPLY72B-01"
       }
      else if ChipTS.TCoat1Choice == 0 && ChipTS.TCoat1Hardener == 1 {
           TCoat1PtACode = "EX-KPLY72AF-01"
           TCoat1PtBCode = "EX-KPLY72B-01"

       }
      else if ChipTS.TCoat1Choice == 1 && ChipTS.TCoat1Hardener == 0 {
           TCoat1PtACode = "EX-KPLY85AZ-01"
           TCoat1PtBCode = "EX-KPLY85B-01"
       }
      else if ChipTS.TCoat1Choice == 1 && ChipTS.TCoat1Hardener == 1 {
           TCoat1PtACode = "EX-KPLY85AF-01"
           TCoat1PtBCode = "EX-KPLY85B-01"

       }
      else if ChipTS.TCoat1Choice == 2 && ChipTS.TCoat1Hardener == 0 {
           TCoat1PtACode = "EX-KPLY92AZ-01"
           TCoat1PtBCode = "EX-KPLY92B-01"

       }
      else if ChipTS.TCoat1Choice == 2 && ChipTS.TCoat1Hardener == 1 {
           TCoat1PtACode = "EX-KPLY92AF-01"
           TCoat1PtBCode = "EX-KPLY92B-01"

       }
      else if ChipTS.TCoat1Choice == 3 && ChipTS.TCoat1Hardener == 0 {
           TCoat1PtACode = "EX-KPLYHSAZ-01"
           TCoat1PtBCode = "EX-KPLYHSB-EA"
       }
      else if ChipTS.TCoat1Choice == 3 && ChipTS.TCoat1Hardener == 1 {
           TCoat1PtACode = "EX-KPLYHSAF-01"
           TCoat1PtBCode = "EX-KPLYHSB-EA"
       } //END OF TCOAT1
       if ChipTS.TCoat2Choice == 0 && ChipTS.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY72AZ-01"
            TCoat2PtBCode = "EX-KPLY72B-01"
        }
       else if ChipTS.TCoat2Choice == 0 && ChipTS.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY72AF-01"
            TCoat2PtBCode = "EX-KPLY72B-01"

        }
       else if ChipTS.TCoat2Choice == 1 && ChipTS.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
       else if ChipTS.TCoat2Choice == 1 && ChipTS.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"

        }
       else if ChipTS.TCoat2Choice == 2 && ChipTS.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY92AZ-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
       else if ChipTS.TCoat2Choice == 2 && ChipTS.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY92AF-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
       else if ChipTS.TCoat2Choice == 3 && ChipTS.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLYHSAZ-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"
        }
       else if ChipTS.TCoat2Choice == 3 && ChipTS.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLYHSAF-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"

        }
   }

    
    var body: some View {
        if (ChipTS.TCoat1Choice != ChipTS.TCoat2Choice) {

            HStack {
            Text("\(TCoat1PtACode)")
                .font(.caption)
            Spacer()
            Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipTS.TCoat1Hardener]), 1 gal")
                .font(.caption)
            Spacer()
            Text("\(quant(product: PAPUTC1) + ChipTS.TCoatWaste)")
                .font(.caption)
            } .onAppear() {
                checkTCoatCodes()
            }
            .onChange(of: ChipTS.TCoat2Choice) { _ in
            checkTCoatCodes()
          }
            .onChange(of: ChipTS.TCoat2Hardener) { _ in
                checkTCoatCodes()
              }
            .onChange(of: ChipTS.TCoat1Choice) { _ in
                checkTCoatCodes()
              }
            .onChange(of: ChipTS.TCoat1Hardener) { _ in
                checkTCoatCodes()
              }

        HStack {
            Text("\(TCoat1PtBCode)")
                .font(.caption)
            Spacer()
            if ChipTS.TCoat1Choice != 3 {
            Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) Part B, 1 gal")
                .font(.caption)
            }
            else {
                Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) Part B, 1/2 gal")
                    .font(.caption)
            }
            Spacer()
            Text("\(quant(product: PAPUTC1) + ChipTS.TCoatWaste)")
                .font(.caption)
        }

        if ChipTS.TCoat2Choice != 6 {
        HStack {
            Text("\(TCoat2PtACode)")
                .font(.caption)
            Spacer()
            Text("\(TopCoat2Options[ChipTS.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipTS.TCoat2Hardener]), 1 gal")
                .font(.caption)
            Spacer()
            Text("\(quant(product: PAPUTC2) + ChipTS.TCoatWaste)")
                .font(.caption)
        }
        HStack {
            Text("\(TCoat2PtBCode)")
                .font(.caption)
            Spacer()
            if ChipTS.TCoat2Choice != 3 {
            Text("\(TopCoat2Options[ChipTS.TCoat2Choice]) Part B, 1 gal")
                .font(.caption)
            }
            else {
                Text("\(TopCoat2Options[ChipTS.TCoat2Choice]) Part B, 1/2 gal")
                    .font(.caption)
            }
            Spacer()
            Text("\(quant(product: PAPUTC2) + ChipTS.TCoatWaste)")
                .font(.caption)
        }
        }
        }
        if (ChipTS.TCoat1Choice == ChipTS.TCoat2Choice) && (ChipTS.TCoat1Hardener == ChipTS.TCoat2Hardener) {
            HStack {
                Text("\(TCoat1PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipTS.TCoat1Hardener]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipTS.TCoatWaste)")
                    .font(.caption)
            }
            HStack {
                Text("\(TCoat1PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipTS.TCoat1Choice != 3 {
                Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) Part B, 1 gal")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) Part B, 1/2 gal")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipTS.TCoatWaste)")
                    .font(.caption)
            }
        }
        if (ChipTS.TCoat1Choice == ChipTS.TCoat2Choice) && (ChipTS.TCoat1Hardener != ChipTS.TCoat2Hardener) {
            HStack {
                Text("\(TCoat1PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipTS.TCoat1Hardener]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC1) + ChipTS.TCoatWaste)")
                    .font(.caption)
            }
            HStack {
                Text("\(TCoat2PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat2Options[ChipTS.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipTS.TCoat2Hardener]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipTS.TCoatWaste)")
                    .font(.caption)
            }
            HStack {
                Text("\(TCoat1PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipTS.TCoat1Choice != 3 {
                Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) Part B, 1 gal")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat1Options[ChipTS.TCoat1Choice]) Part B, 1/2 gal")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipTS.TCoatWaste)")
                    .font(.caption)
            }
        }
        if ChipTS.texture1 != 0 {
            if ChipTS.texture1 < 5 {
            HStack {
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
                Text("\(TextureOptions[ChipTS.texture1]), 10#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: ChipTextureAO) + ChipTS.TCoatWaste)")
                    .font(.caption)
            }
        }
            if ChipTS.texture1 >= 5 {
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("\(TextureOptions[ChipTS.texture1]), 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ChipTextureBead) + ChipTS.TCoatWaste)")
                        .font(.caption)
                }
            }
        }
    }

}
struct SysSummaryTCTS_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryTC()
    }
}
