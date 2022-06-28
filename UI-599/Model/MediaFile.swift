//
//  MediaFile.swift
//  UI-599
//
//  Created by nyannyan0328 on 2022/06/28.
//

import SwiftUI

struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var image : Image
    var data : Data
}

