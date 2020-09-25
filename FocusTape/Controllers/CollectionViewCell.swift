//
//  CollectionViewCell.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/18/20.
//

import UIKit
import AVFoundation



class CollectionViewCell: UICollectionViewCell {
    var playing = false
    var soundName = ""
    public var currentSound: Sound?
    @IBOutlet var buttonImage: UIButton!
    @IBOutlet var soundSlider: UISlider!
    @IBAction func sliderChanged(_ sender: UISlider) {
        currentSound?.volume = sender.value
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        soundSlider.isHidden = true
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if !playing {
            sender.tintColor = colors["green"]
            if (buttonImage.currentTitle != nil) {
                let url = Bundle.main.url(forResource: sounds[buttonImage.currentTitle!]!, withExtension: "mp3")
                Sound.category = .playback
                currentSound = Sound(url: url!)
                currentSound?.volume = 0.5
                currentSound?.play(numberOfLoops: -1)
            }
            playing = true
        } else {
            sender.tintColor = colors["yellow"]
            playing = false
            currentSound?.stop()
        }
        soundSlider.isHidden = !soundSlider.isHidden
    }
    
}


