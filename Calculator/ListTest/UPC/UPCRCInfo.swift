//
//  UPCRCInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/6/20.
//

import SwiftUI



struct UPCRCInfo: View {
    
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UPC RC Specs"), message:
                    Text("Mixing Ratio: A:B:C = 6 lbs:6 lbs:6 lbs \n\n Coverage Rates: \n @8-12 mils: 190 sf/kit \n @15-20 mils: 120 sf/kit \n @25-30 mils: 80 sf/kit"), dismissButton: .default(Text("Close")))
        }
    }}

struct UPCRCInfo_Previews: PreviewProvider {
    static var previews: some View {
        UPCRCInfo()
    }
}
