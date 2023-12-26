//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct QuartzSGBCoatInfo: View {
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
                    Text("Mixing Ratio: A:B:TSC:C = \n1 gal:1/2 gal:16 oz: 30 lbs \n\n Coverage Rates: \n @3/16\": 50 sf/kit \n @ 1/4\": 40 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct QuartzSGBCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
