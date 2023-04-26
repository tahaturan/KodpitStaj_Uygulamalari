//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Taha Turan on 26.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true

        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScroe))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)

        
        
    }

    @objc func increaseScroe()  {
        score += 1
        
        scoreLabel.text = "Score: \(score)"
    }

}

