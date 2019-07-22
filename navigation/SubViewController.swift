//
//  SubViewController.swift
//  navigation
//
//  Created by 503_18 on 22/07/2019.
//  Copyright © 2019 503_18. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    @IBOutlet weak var subLabel: UILabel!
    
    var subData:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "상세보기"
        subLabel.text = subData
    }

}
