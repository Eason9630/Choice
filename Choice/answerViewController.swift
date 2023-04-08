//
//  answerViewController.swift
//  Choice
//
//  Created by 林祔利 on 2023/4/6.
//

import UIKit

class answerViewController: UIViewController {
    
    @IBOutlet weak var ScoreImage: UIImageView!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreLabel.text = "\(score)"
        if score < 60 {
            ScoreImage.image = UIImage(named: "黑人問號")
            let lable = UILabel()
            lable.text = "Are you kidding me?"
            lable.frame = CGRect(x: 100, y: 20, width: 200, height: 70)
            lable.textColor = .red
            lable.font = .systemFont(ofSize: 20)
            ScoreImage.addSubview(lable)
        }else{
            ScoreImage.image = UIImage(named: "正確")
            let lable = UILabel()
            lable.text = "You are so smart"
            lable.frame = CGRect(x: 100, y: 20, width: 200, height: 70)
            lable.textColor = .red
            lable.font = .systemFont(ofSize: 20)
            ScoreImage.addSubview(lable)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
