//
//  ViewController.swift
//  FocusTape
//
//  Created by Artem Pechenkin on 9/18/20.
//  Sounds: Fire, Thunder, Rain, Crickets, Wind, Ambience, Water, Forest, Birds, Singing Bowl, Meditation

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(soundname: String) {
    print("Loading player..")
    guard let url = Bundle.main.url(forResource: soundname, withExtension: "mp3") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        
        /* iOS 10 and earlier require the following line:
         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        
        guard let audioPlayer = audioPlayer else { return }
        print("Ready to play")
        audioPlayer.volume = 0.5
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}


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
        cell.buttonImage.image = UIImage(systemName: sounds[indexPath.row])
        cell.tintColor = UIColor(red: 0.99, green: 0.83, blue: 0.41, alpha: 1.00)
        
        return cell
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var muteButton: UIButton!
    @IBAction func muteTapped(_ sender: UIButton) {
        if muteButton.currentTitle == "MUTE" {
            muteButton.setTitle("UNMUTE", for: .normal)
            audioPlayer?.volume = 0.5
        } else {
            muteButton.setTitle("MUTE", for: .normal)
            audioPlayer?.volume = 0
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
