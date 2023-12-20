//
//  UPCRCInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/6/20.
//

import SwiftUI



struct UPCSLInfo: View {
    
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UPC SL Specs"), message:
                    Text("Mixing Ratio: A:B:C = 8 lbs:8 lbs:25 lbs \n\n Coverage Rates: \n @1/8\": 50 sf/kit \n @3/16\": 35 sf/kit \n @1/4\": 25 sf/kit"), dismissButton: .default(Text("Close")))
        }
    }}

struct UPCSLInfo_Previews: PreviewProvider {
    static var previews: some View {
        UPCRCInfo()
    }
}
