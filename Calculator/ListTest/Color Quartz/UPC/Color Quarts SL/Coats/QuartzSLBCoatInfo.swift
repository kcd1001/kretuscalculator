//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct QuartzSLBCoatInfo: View {
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
                    Text("Mixing Ratio: A:UCC:B:C = 8 lbs:4 oz:8 lbs:25 lbs \n\n Coverage Rates: \n @1/4\": 50 sf/kit\n @3/8\": 35 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct QuartzSLBCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
