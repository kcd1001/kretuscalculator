//
//  UPCRCInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/6/20.
//

import SwiftUI



struct UPCTTInfo: View {
    
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UPC TT Specs"), message:
                    Text("Mixing Ratio: A:B:C = 6 lbs:6 lbs:42 lbs \n\n Coverage Rates: \n @1/8\": 24 sf/kit \n @3/16\": 14 sf/kit \n @1/4\": 10 sf/kit"), dismissButton: .default(Text("Close")))
        }
    }}

struct UPCTTInfo_Previews: PreviewProvider {
    static var previews: some View {
        UPCRCInfo()
    }
}
