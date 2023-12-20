//
//  UPC 1-Coat Sub Systems.swift
//  ListTest
//
//  Created by Kane Davidson on 10/19/20.
//

import SwiftUI

struct UPC_1_Coat_Sub_Systems: View {
    private let SystemData: [SystemItem] = [
     
        SystemItem(
            System: "UPC 1-Coat",
            SubSys: "UPC RC"
             ),
         
        SystemItem(
            System: "UPC 1-Coat",
            SubSys: "UPC SL"
             ),
         
        SystemItem(
            System: "UPC 1-Coat",
            SubSys: "UPC MF"
             ),
         
        SystemItem(
            System: "UPC 1-Coat",
            SubSys: "UPC TT"
            ),
        ]
    
    var body: some View {
        NavigationView {
            List(SystemData){ SystemItem in
                NavigationLink(destination: EmptyView()){
                    Text(SystemItem.SubSys)
                }
                }
            .navigationBarTitle("UPC 1-Coat Sub Systems")
            }
    }
}


struct SystemItem: Identifiable {
    let System: String
    let SubSys: String
    let id = UUID()
}


struct UPC_1_Coat_Sub_Systems_Previews: PreviewProvider {
    static var previews: some View {
        UPC_1_Coat_Sub_Systems()
    }
}
