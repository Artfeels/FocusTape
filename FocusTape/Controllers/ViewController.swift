//
//  ViewController.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/18/20.
//  Sounds: Fire, Thunder, Rain, Crickets, Wind, Ambience, Water, Forest, Birds, Singing Bowl, Meditation

import UIKit
import AVFoundation


let reuseIdentifier = "ReusableCell"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 3;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        
        return 4;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let soundTitle = sounds.keys[sounds.index(sounds.startIndex, offsetBy: indexPath.row)]
        let image = UIImage(systemName: soundTitle)
        cell.buttonImage.setBackgroundImage(image, for: .normal)
        cell.tintColor = UIColor(red: 0.99, green: 0.83, blue: 0.41, alpha: 1.00)
        cell.buttonImage.setTitle(soundTitle, for: .normal)
        return cell
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var muteButton: UIButton!
    @IBAction func muteTapped(_ sender: UIButton) {
        if muteButton.currentTitle == "MUTE" {
            muteButton.setTitle("UNMUTE", for: .normal)
            
        } else {
            muteButton.setTitle("MUTE", for: .normal)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
