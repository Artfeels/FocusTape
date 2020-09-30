//
//  CollectionViewCell.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/18/20.
//

import UIKit
import AVFoundation
import SVGKit


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
        let image = SVGKImage(named: buttonImage.currentTitle!)
        if !playing {
            if (buttonImage.currentTitle != nil) {
                image?.fillColor(color: colors["green"]!, opacity: 1.0)
                let url = Bundle.main.url(forResource: sounds[buttonImage.currentTitle!]!, withExtension: "mp3")
                Sound.category = .playback
                currentSound = Sound(url: url!)
                currentSound?.volume = 0.5
                currentSound?.play(numberOfLoops: -1)
                playing = true
            }
            
        } else {
            image?.fillColor(color: colors["yellow"]!, opacity: 1.0)
            playing = false
            currentSound?.pause()
        }
        buttonImage.setBackgroundImage(image?.uiImage, for: .normal)
        soundSlider.isHidden = !soundSlider.isHidden
    }
    
}


