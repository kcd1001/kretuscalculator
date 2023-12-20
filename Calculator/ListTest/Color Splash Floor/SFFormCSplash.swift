//
//  SF Form.swift
//  ListTest
//
//  Created by Kane Davidson on 10/21/20.
//

import SwiftUI
import Combine



struct SFFormCSplash: View {
    
    
    @EnvironmentObject var sf : SquareFeet
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required

    
    var body: some View {
        
        VStack(alignment: .leading){
                Text("Total Square Feet")
                            .font(.title)
                            .fontWeight(.heavy)
            TextField("",value: $sf.squareF, formatter: NumberFormatter())
                        .padding(.all)
                        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                        .cornerRadius(5.0)

                }
        .padding(.horizontal, 15)
        .padding(.horizontal, 15)
        
}
struct SFFormCSplash_Previews: PreviewProvider {
    static let whatever = SquareFeet()
    
    static var previews: some View {
        SF_Form().environmentObject(whatever)
    }
}
}

