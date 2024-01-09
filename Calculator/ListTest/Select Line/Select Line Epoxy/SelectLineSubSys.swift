//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct SelectLineSubSys: View {
    
    

    var body: some View {
        

        List{
            // UPC 
            NavigationLink(destination: SelectChipTSView()){
                Text("Kretus Select Epoxy")
            }
            NavigationLink(destination: SelectChipTSView()){
                Text("Kretus Select OMG Blocker")
            }


        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Kretus Select Line Sub-Systems")
    }
        

}

struct SelectLineSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
