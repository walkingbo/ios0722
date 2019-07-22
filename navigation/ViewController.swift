//
//  ViewController.swift
//  navigation
//
//  Created by 503_18 on 22/07/2019.
//  Copyright © 2019 503_18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "메인화면"
        /*
        let tView = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        tView.numberOfLines = 2
        tView.textColor = UIColor.white
        tView.text = "안녕하세요\n반갑습니다."
        tView.textAlignment = .center
        self.navigationItem.titleView = tView
        let color = UIColor(red:0.02,green: 0.2,blue: 0.2,alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
         */
        
        let tView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        let tLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        tLabel.textColor = UIColor.red
        tLabel.textAlignment = .center
        tLabel.text = "안녕하세요."
        
        let bLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        bLabel.textColor = UIColor.white
        bLabel.textAlignment = .center
        bLabel.text = "반갑습니다."
        
        tView.addSubview(tLabel)
        tView.addSubview(bLabel)
        self.navigationItem.titleView = tView
        
        let color = UIColor(red:0.02,green: 0.2,blue: 0.2,alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        
    }
    //화면 터치했을 때 호출되는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //SubViewController 객체 만드릭
        let subViewController = self.storyboard!.instantiateViewController(withIdentifier:"SubViewController") as! SubViewController
        subViewController.subData = "네비게이션 바 연습"
        self.navigationController?.pushViewController(subViewController, animated: true)
    }

}

