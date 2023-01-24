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
        playSound(resource: "Sounds/A")
    }
    
    @IBAction func bKeyTapped(_ sender: Any) {
        playSound(resource: "Sounds/B")
    }
    
    @IBAction func cKeyTapped(_ sender: Any) {
        playSound(resource: "Sounds/C")
    }
    
    @IBAction func dKeyTapped(_ sender: Any) {
        playSound(resource: "Sounds/D")
    }
    
    @IBAction func eKeyTapped(_ sender: Any) {
        playSound(resource: "Sounds/E")
    }
    
    @IBAction func fKeyTapped(_ sender: Any) {
        playSound(resource: "Sounds/F")
    }
    
    @IBAction func gKeyTapped(_ sender: Any) {
        playSound(resource: "Sounds/G")
    }
    
    
    func playSound(resource : String){
        
        print("\(resource) going to play")
        
        guard let url = Bundle.main.url(forResource: resource, withExtension: "wav") else {return}
        
        //print("url assign ok")

        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            //print("Set category ok")
            
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else {return}

            player.play()
            print("\(resource) played")

        }catch let error {
            print(error.localizedDescription)
        }
    }
}

