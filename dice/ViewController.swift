//
//  ViewController.swift
//  dice
//
//  Created by 7 on 2021/1/4.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var leftDice: [UIImageView]!
    @IBOutlet var rightDice: [UIImageView]!
    @IBOutlet weak var leftPoint: UILabel!
    @IBOutlet weak var rightPoint: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var leftWin: UILabel!
    @IBOutlet weak var rightWin: UILabel!
    @IBOutlet weak var totalGame: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalGame.text = "0"
        leftWin.text = ""
        rightWin.text = ""
    }
    
    var leftSum = 0
    var rightSum = 0
    var leftBig = 0
    var rightBig = 0
    var total = 0

    @IBAction func rollLeftDice(_ sender: Any) {

        
        for imageView in leftDice {
            let number = Int.random(in: 1...6)
            imageView.image = UIImage(systemName: "die.face.\(number)")
            
            leftSum = leftSum + number
        }
        for imageView in rightDice {
            let number = Int.random(in: 1...6)
            imageView.image = UIImage(systemName: "die.face.\(number)")
            
            rightSum = rightSum + number

        }
        leftPoint.text = "\(leftSum)"
        rightPoint.text = "\(rightSum)"
        
        if leftSum > rightSum {
            status.text = "left(\(leftSum)) is bigger"
            leftBig = leftBig + 1
            leftWin.text = "\(leftBig)"
        } else if leftSum < rightSum {
            status.text = "right(\(rightSum)) is bigger"
            rightBig = rightBig + 1
            rightWin.text = "\(rightBig)"
        } else {
            status.text = "even"
        }
        leftSum = 0
        rightSum = 0
        total = total + 1
        totalGame.text = "\(total)"
    }
    
    @IBAction func restart(_ sender: Any) {
        
        leftPoint.text = "0"
        rightPoint.text = "0"
        status.text = ""
        totalGame.text = "0"
        leftWin.text = ""
        rightWin.text = ""
        total = 0
        
        for imageView in rightDice {
            imageView.image = UIImage(systemName: "die.face.1")
        }
        for imageView in leftDice {
            imageView.image = UIImage(systemName: "die.face.1")
        }
        
    }
    
}


