//
//  AddColorTip.swift
//  TipKit
//
//  Created by Gabriel Sanzone on 22/07/24.
//

import Foundation
import SwiftUI
import TipKit

struct AddColorTip: Tip {
    
    var title: Text {
        Text("Add New Color")
    }
    
    var message: Text? {
        Text("Tap here to add a new color to the list")
    }
    
    var image: Image? {
        Image(systemName: "paintpalete")
    }
}

struct SetFavoriteTip: Tip {
    var title: Text {
        Text("Set Favorites")
    }
    
    var message: Text? {
        Text("Tap and hold a color to add it to your favorites")
    }
}
