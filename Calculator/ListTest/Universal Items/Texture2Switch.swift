//
//  Texture2Switch.swift
//  Calculator
//
//  Created by Kane Davidson on 2/12/21.
//

import SwiftUI

struct Texture2Switch: View {
    
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options
    @EnvironmentObject var sf : SquareFeet //Square feet
    var text1 = stats(product: "texture 1", covRate: 1, MixRat: 10) //Used for system stats (mixRat,CovRate, etc)
    var text2 = stats(product: "texture 1", covRate: 1, MixRat: 10) //Used for system stats (mixRat,CovRate, etc)
    
    
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required for broadcast
    
    func CheckTextureQuant() { // used to calculate quantity values
        upcChoice.texture1Quant = quant(product: text1)
        upcChoice.texture2Quant = quant(product: text2)
        
        if upcChoice.texture1 == upcChoice.texture2 {
            upcChoice.texture1Quant += upcChoice.texture2Quant
        }
        else if upcChoice.texture1 != upcChoice.texture2 {
            upcChoice.texture1Quant = quant(product: text1)  // The amount of texture 1
            upcChoice.texture2Quant = quant(product: text2)  // The amount of texture 2
            
        }
    }
    
    var body: some View {
        if upc.isTexture == true && upc.isTopCoat == true  {
                HStack {
                    switch upcChoice.texture2 {
                    case 0:
                        Text("EX-KASAO60-01")
                            .font(.caption)
                    case 1:
                        Text("EX-KASAO36-01")
                            .font(.caption)
                    case 2:
                        Text("EX-KASA246-01")
                            .font(.caption)
                    case 3:
                        Text("116")
                            .font(.caption)
                    case 4:
                        Text("115")
                            .font(.caption)
                    case 5:
                        Text("114")
                            .font(.caption)
                    case 6:
                        Text("")
                            .font(.caption)
                    default:
                        Text("")
                    }
                    Spacer()
                    switch upcChoice.texture2 {
                    case 0:
                        Text("Anti-Slip AO 60, 10 lbs")
                            .font(.caption)
                    case 1:
                        Text("Anti-Slip AO 36, 10 lbs")
                            .font(.caption)
                    case 2:
                        Text("Anti-Slip AO 24, 10 lbs")
                            .font(.caption)
                    case 3:
                        Text("Industrial Sand #60, 10 lbs")
                            .font(.caption)
                    case 4:
                        Text("Industrial Sand #30, 10 lbs")
                            .font(.caption)
                    case 5:
                        Text("Industrial Sand #20, 10 lbs")
                            .font(.caption)
                    case 6:
                        Text("")
                            .font(.caption)
                    default:
                        Text("")
                }
                    Spacer()
                    if upcChoice.texture2 != 6 {
                        Text("\(upcChoice.texture2Quant)")
                        .font(.caption)
//                            .onAppear(perform: CheckTextureQuant)
//                            .onChange(of: upcChoice.texture1) { _ in
//                                CheckTextureQuant()
//                                }
//                            .onChange(of: upcChoice.texture2) { _ in
//                                CheckTextureQuant()
//                                }
            }
            
    
}    }
}

struct Texture2Switch_Previews: PreviewProvider {
    static var previews: some View {
        Texture2Switch()
    }
}
}
