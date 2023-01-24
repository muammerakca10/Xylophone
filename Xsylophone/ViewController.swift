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
    
    
   
    @IBAction func keyTapped(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else {return}
        playSound("Sounds/\(text)")
        
    }
    
    
    
    func playSound(_ resource : String){
        
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

