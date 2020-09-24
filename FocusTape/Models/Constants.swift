//
//  CellsCollection.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/21/20.
//

import Foundation
import UIKit

    let sounds = [
        "wind" : Sound(url: Bundle.main.url(forResource: "main-wind", withExtension: "mp3")!),
        "car" : Sound(url: Bundle.main.url(forResource: "main-birds", withExtension: "mp3")!),
        "pencil" : Sound(url: Bundle.main.url(forResource: "main-waves", withExtension: "mp3")!),
        "cloud" : Sound(url: Bundle.main.url(forResource: "main-thunder", withExtension: "mp3")!)
    ]

    let colors = [
        "pressed" : UIColor(red: 0.61, green: 0.80, blue: 0.44, alpha: 1.00),
        "unpressed" : UIColor(red: 0.99, green: 0.83, blue: 0.41, alpha: 1.00)
    ]


