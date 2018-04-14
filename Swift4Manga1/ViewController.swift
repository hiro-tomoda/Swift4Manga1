//
//  ViewController.swift
//  Swift4Manga1
//
//  Created by yuwa on 2018/04/04.
//  Copyright © 2018年 yuwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var runnerImageView: UIImageView!
    
    var imageArray = [UIImage]()
    var timer1 = Timer();
    var timer2 = Timer();
    var updateCount = 0
    
    // 経過時間
    var countUp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel.text = "0"
        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")
        
        imageArray = [image0!,image1!, image2!,image3!,image4!,image5!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func run(_ sender: Any) {
        // 秒数のタイマー
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            // カウントアップ
            self.countUp = self.countUp + 1
            // ラベルに反映
            self.countLabel.text = String(self.countUp)
        })
        
        // runnerImageViewに画像をを1秒ごとに追加するタイマー
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            if (self.updateCount > 5) {
                self.updateCount = 0
                self.runnerImageView.image = UIImage(named: "dash0.png")
            } else {
                self.runnerImageView.image = self.imageArray[self.updateCount]
            }
            
            self.updateCount = self.updateCount + 1
        })
    }
    
    @IBAction func stop(_ sender: Any) {
        timer1.invalidate()
        timer2.invalidate()
    }
}

