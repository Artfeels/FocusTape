//
//  CollectionViewCell.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/18/20.
//

import UIKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet var buttonImage: UIImageView!
    @IBOutlet var soundSlider: UISlider!
    @IBAction func sliderChanged(_ sender: UISlider) {
        audioPlayer?.volume = sender.value
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        soundSlider.isHidden = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        buttonImage.isUserInteractionEnabled = true
        buttonImage.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let green = UIColor(red: 0.61, green: 0.80, blue: 0.44, alpha: 1.00)
        let yellow = UIColor(red: 0.99, green: 0.83, blue: 0.41, alpha: 1.00)
        if tappedImage.tintColor == green {
            tappedImage.tintColor = yellow
            audioPlayer?.pause()
        } else {
            tappedImage.tintColor = green
            playSound(soundname: "main-thunder")
        }
        soundSlider.isHidden = !soundSlider.isHidden
    }
}


