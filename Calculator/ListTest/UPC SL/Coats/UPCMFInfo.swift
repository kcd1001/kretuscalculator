//
//  UPCRCInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/6/20.
//

import SwiftUI



struct UPCMFInfo: View {
    
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UPC MF Specs"), message:
                    Text("Mixing Ratio: A:B:C = 8 lbs:8 lbs:40 lbs \n\n Coverage Rates: \n @1/8\": 60 sf/kit \n @3/16\": 45 sf/kit \n @1/4\": 35 sf/kit"), dismissButton: .default(Text("Close")))
        }
    }}

struct UPCMFInfo_Previews: PreviewProvider {
    static var previews: some View {
        UPCRCInfo()
    }
}
