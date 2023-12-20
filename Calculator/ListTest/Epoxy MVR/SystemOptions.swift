//
//  SystemOptions.swift
//  Calculator
//
//  Created by Kane Davidson on 6/15/22.
//

import SwiftUI

struct SystemOptions: View {
    
    @EnvironmentObject var sysOptions : OptionsEpoxyMVR
    
    var body: some View {
        
        
        VStack { // Coat Options
            Text("System Options")
                .fontWeight(.heavy)
            HStack {
                Toggle(isOn: $sysOptions.isPrimeCoat, label: {
                    Text("Add Optional Prime Coat")
                    PrimeCoatInfo()
                })

                }
                .toggleStyle(CheckBoxToggleStyle())
            }
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        }
    }


struct SystemOptions_Previews: PreviewProvider {
    static var previews: some View {
        SystemOptions()
    }
}
