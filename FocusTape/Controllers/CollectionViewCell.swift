//
//  CollectionViewCell.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/18/20.
//

import UIKit
import AVFoundation



class CollectionViewCell: UICollectionViewCell {
    var i = 1
    @IBOutlet var buttonImage: UIButton!
    @IBOutlet var soundSlider: UISlider!
    @IBAction func sliderChanged(_ sender: UISlider) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        soundSlider.isHidden = true
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if i == 1 {
            sender.tintColor = colors["pressed"]
            if let sound = sender.currentTitle {
                let currentSound = Sound.self
                currentSound.play(file: sound, fileExtension: "mp3", numberOfLoops: -1)
                i = 0
            }
            
        } else {
            sender.tintColor = colors["unpressed"]
            i = 1
        }
        soundSlider.isHidden = !soundSlider.isHidden
    }
    
}


