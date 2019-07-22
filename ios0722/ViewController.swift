import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func click(_ sender: Any) {
        //대화상자 생성
        var alert = UIAlertController(title: "대화상자",message: "메시지",preferredStyle: .alert)
        //present(alert, animated: true)
        //버튼 생성
        var ok = UIAlertAction(title: "확인",style:.default){(_)->Void in self.label.text = "확인"}
        var cancel = UIAlertAction(title: "취소",style:.default){(_)->Void in self.label.text = "취소"}
        //버튼 추가
        alert.addAction(ok)
        alert.addAction(cancel)
        //화면에 출력
        present(alert,animated: true)
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "로그인", preferredStyle: .alert)
        alert.addTextField(){(tf)->Void in tf.placeholder = "아이디를 인력하세요"
            tf.isSecureTextEntry = false
        }
        alert.addTextField(){(tf)->Void in tf.placeholder = "비밀번호를 입력하세요"
            tf.isSecureTextEntry = true
        }
        
        let login = UIAlertAction(title: "로그인", style: .default){(_)->Void in
            //텍스트 필드의 입력값가져오기
            let id = alert.textFields?[0].text
            let pw = alert.textFields?[1].text
            self.label.text = "\(id!):\(pw!)"
        }
        alert.addAction(login)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancel)
        present(alert,animated: true)
        
    }
    
    @IBAction func custom(_ sender: Any) {
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1부터 10까지 1씩 증가하면서 레이블에 출력
        //하나의 메소드에 작성된 화면 출력 코드는 모아서 한꺼번에 처리
        /*
        for i in 1...10{
            NSLog("\(i)")
            label.text = "\(i)"
            sleep(1)
        }
        */
        
        
    }


}

