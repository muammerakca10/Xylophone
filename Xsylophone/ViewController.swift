//
//  ViewController.swift
//  Xsylophone
//
//  Created by Muammer on 24.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func aKeyTapped(_ sender: UIButton) {
        playSound()
        print("Tapped A")
    }
    
    @IBAction func bKeyTapped(_ sender: Any) {
    }
    
    @IBAction func cKeyTapped(_ sender: Any) {
    }
    
    @IBAction func dKeyTapped(_ sender: Any) {
    }
    
    @IBAction func eKeyTapped(_ sender: Any) {
    }
    
    @IBAction func fKeyTapped(_ sender: Any) {
    }
    
    @IBAction func gKeyTapped(_ sender: Any) {
    }
    
//    func playSound() {
//        print("A will play")
//
//        guard let path = Bundle.main.path(forResource: "A", ofType:"wav") else { return }
//
//        let url = URL(fileURLWithPath: path)
//
//        do {
//
//            player = try AVAudioPlayer(contentsOf: url)
//            print("player assigned")
//
//            player?.play()
//            print("A played")
//
//        } catch let error {
//
//            print(error.localizedDescription)
//
//        }
//
//    }
//
//}

    func playSound(){
        
        print("A will play")
        
        guard let url = Bundle.main.url(forResource: "Sounds/A", withExtension: "wav") else {return}
        
        print("url assign ok")

        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            print("Set category ok")
            
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else {return}

            player.play()
            print("A played")

        }catch let error {
            print(error.localizedDescription)
            print("Error")
        }
    }
}

