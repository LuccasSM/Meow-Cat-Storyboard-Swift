//
//  ViewController.swift
//  My First App
//
//  Created by Luccas Santana Marinho on 02/09/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var catSound: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
        setupButton()
        setupCatSound()
    }
    
    func setupLabel() {
        label.isHidden = true
    }
    
    func setupButton() {
        button.imageView?.contentMode = .scaleAspectFit
        button.adjustsImageWhenHighlighted = false
    }
    
    func setupCatSound() {
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func meow(_ sender: Any) {
        label.isHidden = false
        
        catSound.play()
    
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }

    @objc func hideLabel() {
        label.isHidden = true
    }
}
