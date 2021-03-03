//
//  ViewController.swift
//  IntroductionAnimation
//
//  Created by 송주 on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {
    private let letters = ["@", "%", "*", "^", "1", "2", "3", " "]
    private var wordsForDisplaying = ["SONG", "JU", "'S", "GIT", "HUB", ""]
    private var randomLetters = ""
    private var incrementer = 0
    private var timer: Timer?
    private var internalTimer: Timer?
    private var mainTimer: Timer?
    
    @IBOutlet weak var animatingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
    }
    
    private func animate() {
        mainTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.internalTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                for _ in 0...arc4random_uniform(UInt32(10) + 1) {
                    let randomNumber = arc4random_uniform(UInt32(self.letters.count - 1))
                    self.randomLetters += self.letters[Int(randomNumber)]
                }
                self.animatingLabel.text = self.randomLetters
                self.animatingLabel.font = self.animatingLabel.font.withSize(20)
                self.animatingLabel.alpha = 0.5
                self.randomLetters = ""
            })
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: { _ in
                if self.incrementer != self.wordsForDisplaying.count - 1 {
                    self.internalTimer?.invalidate()
                    self.animatingLabel.text = self.wordsForDisplaying[self.incrementer]
                    self.animatingLabel.font = self.animatingLabel.font.withSize(28)
                    self.animatingLabel.alpha = 1
                    self.incrementer += 1
                    
                } else {
                    self.timer?.invalidate()
                    self.internalTimer?.invalidate()
                    self.mainTimer?.invalidate()
                    self.animatingLabel.font = self.animatingLabel.font.withSize(28)
                    self.animatingLabel.alpha = 1
                    self.animatingLabel.text = "❤️"
                }
            })
        })
    }
}

