//
//  ViewController.swift
//  ViewController
//
//  Created by 503_18 on 22/07/2019.
//  Copyright © 2019 503_18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //하위 뷰 컨트롤러로 부터 넘겨받을 데이터 프로퍼티
    var data:String!
    
    @IBAction func click(_ sender: Any) {
        
        //스토리 보드에서 디자인한 뷰컨트롤러 객체 생성
        let subViewController = self.storyboard!.instantiateViewController(withIdentifier:"SubViewController") as! SubViewController
        subViewController.modalTransitionStyle = .flipHorizontal
        subViewController.subData = "데이터"
        //화면에 출력
        self.present(subViewController,animated: true)
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    //처음 만들어질 때만 호출
    //다른 뷰 컨트롤러를 화면에 출력한 다음 다시 돌아오면  이 메소드는 호출되지 않습니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        //label.text = data
    }
    
    //화면이 출력될 때마다 호출되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = data
    }
    
    
    //세그웨이를 이용해서 이동을 할 때 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //목적지 뷰 컨트롤러 찾아오기
        let destination = segue.destination as! SubViewController
        //하위 데이터 설정
        destination.subData = "세그웨이 데이터"
    }
    @IBAction func returned(segue:UIStoryboardSegue){
        label.text = "세그웨이를 이용한 원래 자리로 돌아오기"
    }
}

