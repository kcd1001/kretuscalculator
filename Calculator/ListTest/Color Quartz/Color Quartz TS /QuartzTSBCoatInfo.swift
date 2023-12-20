//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct QuartzTSBCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Coat Specs"), message:
                    Text("Mixing Ratio: A:B:TSC = 1 gal:1/2 gal:16 oz \n\n Coverage Rates: \n @8-12 mils: 210 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct QuartzTSBCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
