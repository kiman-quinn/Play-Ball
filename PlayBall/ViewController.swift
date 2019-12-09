//
//  ViewController.swift
//  PlayBall
//
//  Created by Kim-An Quinn on 11/27/19.
//  Copyright © 2019 Kim-An Quinn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playLabel: UILabel!
    @IBOutlet weak var ballLabel: UILabel!
    

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSound(soundName: "baseballSong", audioPlayer: &audioPlayer)
        animationLogoAcross()
        animationLogoVertical()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
  
    func animationLogoAcross(){
        UIView.animate(withDuration: 1.0) {
            self.playLabel.frame.origin.x = self.playLabel.frame.origin.x + 160
            self.ballLabel.frame.origin.x = self.ballLabel.frame.origin.x - 175
        }
    }
    
    func animationLogoVertical(){
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {
            self.playLabel.frame.origin.y = self.playLabel.frame.origin.y + 55
            self.ballLabel.frame.origin.y = self.ballLabel.frame.origin.y - 36
        }, completion: nil)
        
}
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName){
            do{
                try audioPlayer = AVAudioPlayer(data:sound.data)
                audioPlayer.play()
            }catch{
                print("Error")
            }
        }else{
            print("Error")
        }
    }

    @IBAction func tapField(_ sender: UITapGestureRecognizer) {
        if audioPlayer.isPlaying{
            audioPlayer.pause()
        }else{
            audioPlayer.play()
        }
    } 
    
}

