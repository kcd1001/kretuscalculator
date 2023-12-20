//
//  FunctionTesting.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct FunctionTesting: View {
    
  
    
    func BCoatSwitch() {
        var Choice = 0
        switch Choice  {
        case 0:
            Text("EX-KUPCRZ6-EA")
                .font(.caption)
        case 1:
            Text("EX-KUPCRCA6-EA")
                .font(.caption)
        case 2:
            Text("EX-KUPCRCF6-EA")
                .font(.caption)
        default:
            Text("")
        }
        Spacer()
        switch Choice  {
        case 0:
            Text("UPC Part B - RC/TT - EZ, 6 lbs")
                .font(.caption)
        case 1:
            Text("UPC Part B - RC/TT - AP, 6 lbs")
                .font(.caption)
        case 2:
            Text("UPC Part B - RC/TT - FC, 6 lbs")
                .font(.caption)
        default:
            Text("")
        }
        Spacer()
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FunctionTesting_Previews: PreviewProvider {
    static var previews: some View {
        FunctionTesting()
    }
}
