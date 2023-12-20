//
//  PCoatToggle.swift
//  Calculator
//
//  Created by Kane Davidson on 8/23/22.
//

import SwiftUI

struct BCoat2Toggle: View {
    
    @State var showingBCoat2 : Bool = false

    var body: some View {
        
        Toggle(isOn: $showingBCoat2) {
            Text("Base Coat 2")
                .fontWeight(.bold)
        }
        .toggleStyle(DropDownToggle())
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        
        if showingBCoat2 == true {
            BCoat2QuartzDB()
                
        }
    }
}

struct BCoat2Toggle_Previews: PreviewProvider {
    static var previews: some View {
        PCoatToggle()
    }
}
