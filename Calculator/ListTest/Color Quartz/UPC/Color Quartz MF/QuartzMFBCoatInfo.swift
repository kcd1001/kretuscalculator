//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct QuartzMFBCoatInfo: View {
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
                    Text("Mixing Ratio: A:UCC:B:C = 8 lbs:4 oz:8 lbs:40 lbs \n\n Coverage Rates: \n @3/16\": 35 sf/kit\n @1/4\": 25 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct QuartzMFBCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
