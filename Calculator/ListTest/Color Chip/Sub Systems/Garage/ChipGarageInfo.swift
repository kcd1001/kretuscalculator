//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipGarageInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip Garage Specs"), message:
                    Text("Mixing Ratio: A:B:C = 1 gal:1/2 gal:16 oz \n\n Coverage Rates: \n @24 mils: 150 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipGarageInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
