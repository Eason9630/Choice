//
//  QuestionViewController.swift
//  Choice
//
//  Created by 林祔利 on 2023/3/29.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var qs: UILabel!
    @IBOutlet weak var whichLabel: UILabel!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerImage: UIImageView!
    
    var question = [Question(title: "2021年NBA總冠軍隊伍是哪一隊？", answer: ["密爾瓦基公鹿", "鳳凰城太陽", "洛杉磯湖人"]),
        Question(title: "NBA歷史上得分王是誰？", answer: ["卡里姆·阿卜杜勒-贾巴尔", "勒布朗·詹姆斯", "科比·布萊恩特"]),
        Question(title: "洛杉磯湖人隊在其歷史上贏得了多少次總冠軍？", answer: ["17次", "12次", "10次"]),
        Question(title: "2020-2021賽季NBA常規賽最有價值球員（MVP）是誰？", answer: ["尼古拉·約基奇", "喬爾·恩比德", "斯蒂芬·柯瑞"]),
        Question(title: "在加拿大的多倫多市有一支NBA球隊，他們的名字是什麼？", answer: ["多倫多暴龍", "溫哥華灰熊", "蒙特利爾博覽會"])]
    var q = 1
    var index = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quest()
        answerImage.isHidden = true
    }
    
    func quest() {
        if index < question.count{
            whichLabel.text = "\(q)"
            titleLabel.text = question[index].title
            firstButton.setTitle(question[index].answer[0], for: .normal)
            secondButton.setTitle(question[index].answer[1], for: .normal)
            thirdButton.setTitle(question[index].answer[2], for: .normal)
        }
    }

    
    @IBAction func answer(_ sender: UIButton) {

        let answer = sender.currentTitle!
        switch answer {
        case "17次","多倫多暴龍","勒布朗·詹姆斯","洛杉磯湖人","尼古拉·約基奇":
            score += 20
        default:
            break
        }
        index += 1
        q += 1
        quest()
        check()
       
        scoreLabel.text = String(format: "%2d", score)
    }
    
    func check() {
        if index == question.count {
            if score < 60 {
                answerImage.image = UIImage(named: "黑人問號")
                answerImage.isHidden = false
            }else {
                answerImage.image = UIImage(named: "正確")
                answerImage.isHidden = false
            }
            qs.isHidden = true
            num.isHidden = true
            whichLabel.text = "完成"
        }

    }

    @IBAction func angin(_ sender: Any) {
        answerImage.isHidden = true
        qs.isHidden = false
        num.isHidden = false
        q = 1
        index = 0
        score = 0
        question.shuffle()
        scoreLabel.text = String(format: "%2d", score)
        quest()
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
