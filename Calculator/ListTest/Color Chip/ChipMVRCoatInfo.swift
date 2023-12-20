//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipMVRCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip MVR Coat"), message:
                    Text("Mixing Ratio: A:PC:B = 1 gal:16 oz:1/2 gal: \n\n Coverage Rates: \n @16 mils: 150 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipMVRCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
