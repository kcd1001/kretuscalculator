//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipTopCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip Top Coat"), message:
                    Text("Mixing Ratios:\n Polyaspartic: A:B = 1 gal:1 gal\n Polyurethane HS: A:B = 1 gal:1/2 gal\n Polyurethane HP: A:B = 1 gal: 1 gal \n\n Coverage Rates (TC1): \nPolyaspartic w/ 1/4\" Chip: 150 sf/gal \n Polyurethane HS w/ 1/4\" Chip: 140 sf/gal\n\n Polyaspartic w/ 1/8\" chip: 125 sf/gal \n Polyurethane w/ 1/8\" chip: 100 sf/gal \n\n Coverage Rates (TC2): \nPolyaspatic: 375 sf/gal\n Polyurethane HS: 373 sf/gal\n Poly HP Gloss: 287 sf/gal\n Poly HP Satin: 337 sf/gal "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipTopCoat_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
