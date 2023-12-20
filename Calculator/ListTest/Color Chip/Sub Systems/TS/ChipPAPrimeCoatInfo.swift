//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipPAPrimeCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip PA Prime Coat"), message:
                    Text("Mixing Ratio: A:PC:B:SC = 1 gal:16 oz:1/2 gal:1 qt \n\n Coverage Rates: \n @3-5 mils: 600 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipPAPrimeCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
