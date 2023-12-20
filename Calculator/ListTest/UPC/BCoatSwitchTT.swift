//
//  BCoatSwitch.swift
//  Calculator
//
//  Created by Kane Davidson on 1/29/21.
//

import SwiftUI

struct BCoatSwitchTT: View {
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    var body: some View {
        
        HStack{ // UPC Part B from base coat
            switch upcChoice.BCoatSelection {
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
            switch upcChoice.BCoatSelection {
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
            Text("\(upcChoice.BCoatPtB)")
                .font(.caption)
        }
    }
}

struct BCoatSwitchTT_Previews: PreviewProvider {
    static var previews: some View {
        BCoatSwitch()
    }
}
