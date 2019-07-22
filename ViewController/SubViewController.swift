import UIKit

class SubViewController: UIViewController {

    @IBOutlet weak var subLabel: UILabel!
    @IBAction func subClick(_ sender: Any) {
        //자신을 출력한 상위 뷰 컨트롤러에 대한 참조를 가져옵니다.
        let viewController = self.presentingViewController as! ViewController
        viewController.data = "하위 뷰 컨트롤러에서 만든 데이터"
        //상위 뷰 컨틀롤러에서 dismiss를 호출하면 현재 뷰 컨트롤러가 제거
        viewController.dismiss(animated: true)
    }
    //상위 뷰 컨트롤러에게서 넘겨받은 데이터
    var subData:String!
    
    //뷰가 메모리에 로드 되고 난 후 호출되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        subLabel.text = subData
    
    }
    

}
