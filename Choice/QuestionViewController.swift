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

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var OptionButtons: [UIButton]!
    
    var question = [Question(title: "2021年NBA總冠軍隊伍是哪一隊？", answer: ["密爾瓦基公鹿", "鳳凰城太陽", "洛杉磯湖人"], answerIndex: 2),
                    Question(title: "NBA歷史上得分王是誰？", answer: ["卡里姆·阿卜杜勒-贾巴尔", "勒布朗·詹姆斯", "科比·布萊恩特"], answerIndex: 1),
                    Question(title: "洛杉磯湖人隊在其歷史上贏得了多少次總冠軍？", answer: ["17次", "12次", "10次"], answerIndex: 0),
                    Question(title: "2020-2021賽季NBA常規賽最有價值球員（MVP）是誰？", answer: ["尼古拉·約基奇", "喬爾·恩比德", "斯蒂芬·柯瑞"], answerIndex: 0),
                    Question(title: "在加拿大的多倫多市有一支NBA球隊，他們的名字是什麼？", answer: ["多倫多暴龍", "溫哥華灰熊", "蒙特利爾博覽會"], answerIndex: 0),
                    Question(title: "哪位球員是NBA歷史上三分球出手最多的球員？", answer: ["斯蒂芬·柯瑞","雷·艾倫","詹姆斯·哈登"], answerIndex: 1),
                    Question(title: "誰是NBA歷史上最年輕的得分王？", answer: ["科比·布萊恩特","勒布朗·詹姆斯","杜蘭特"], answerIndex: 2),
                    Question(title: "在1992年的巴塞隆納奧運會上，哪支國家代表贏得了金牌？", answer: ["西班牙","美國","米國"], answerIndex: 1),
                    Question(title: "NBA歷史上最長連勝紀錄是多少場？", answer: ["33場","24場","20場"], answerIndex: 0),
                    Question(title: "哪位球員贏得的總冠軍數量最多？", answer: ["Michael Jordan","Kareem Abdul-Jabbar","Bill Russell"], answerIndex: 2),
    ]


    var index = 0{
        didSet {
            quest()
        }
    }
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        question.shuffle()
        quest()
        
    }
    
    func quest() {
        if index < 10{
            whichLabel.text = "\(index + 1)"
            titleLabel.text = question[index].title
            let issue = question[index]
            for(i, OptionButton) in OptionButtons.enumerated(){
                OptionButton.setTitle(issue.answer[i],for: .normal)
            }
        }else {
            print("Hi")
            finishAlert()
        }
    }

    
    @IBAction func answer(_ sender: UIButton) {
        guard let selecIndex = OptionButtons.firstIndex(of: sender) else {return}
        let issue = question[index]
        if issue.answerIndex == selecIndex {
            score += 10
            let alert = UIAlertController(title: "答對了", message: "分數加10分" , preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertAction)
            present(alert,animated: true)
        }else {
            let issue = question[index]
            let correctAnswerText = issue.answer[issue.answerIndex]
            let alert = UIAlertController(title: "答錯了", message: "答案是\(correctAnswerText)", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertAction)
            present(alert,animated: true)
            
        }
        self.index += 1
        check()
        
    }
    
    func check() {
        if index == question.count {
            qs.isHidden = true
            num.isHidden = true
            whichLabel.text = "完成"
        }

    }

    @IBAction func angin(_ sender: Any) {

        qs.isHidden = false
        num.isHidden = false
        index = 0
        score = 0
        question.shuffle()
        quest()
    }

    func finishAlert() {
        if presentedViewController == nil {
            let alert = UIAlertController(title: "完成", message: "看成績", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.performSegue(withIdentifier: "showResult", sender: self)
            }
            alert.addAction(alertAction)
            present(alert, animated: true)
        } else {
            // Dismiss the presented alert controller first
            presentedViewController?.dismiss(animated: true) {
                let alert = UIAlertController(title: "完成", message: "看成績", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
                    self.performSegue(withIdentifier: "showResult", sender: self)
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true)
            }
        }
    }

    @IBSegueAction func showResult(_ coder: NSCoder) -> answerViewController? {
        let AnswerViewController = answerViewController(coder: coder)
        AnswerViewController?.score = self.score
        return AnswerViewController
    }
    
    
    
}
