import UIKit

import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    //앱이 실행될 때 호출되는메소드
    //가장 먼저 호출되는 메소드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options:[.alert,.badge,.sound]){(didAllow,error)->Void in}
        notificationCenter.delegate = self
        return true
    }
    //사용자가 홈 버튼을 누르거나 전화나 문자메시지가 와서
    //앱이 백그라운드로 가야하는 경우 호출되는 메소드
    func applicationWillResignActive(_ application: UIApplication) {
       //로컬알림 만들기
        UNUserNotificationCenter.current().getNotificationSettings(){(settings)->Void in
            //알림 사용 권한 여부 확인
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                //알림 콘텐츠 만들기
                let content = UNMutableNotificationContent()
                content.badge = 1
                content.title = "로컬알림 제목"
                content.body = "로컬알림 내용"
                content.subtitle = "로컬알림 소제목"
                content.sound = UNNotificationSound.default
                //부가 정보 - Apple은 부가 정보의 이름은 무조건 userInfo
                //자료형은 무조건 dictionary 입니다.
                content.userInfo = ["name":"군계"]
                //알림 시간 만들기
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                //내용과 시간을 가지고 알림 만들기
                let request = UNNotificationRequest(identifier: "wakeup", content: content, trigger: trigger)
                //등록
                UNUserNotificationCenter.current().add(request)
            }else{
                NSLog("사용자가 동의하지않음")          }
        }
    }
    

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //알림을 받았을 때 호출되는 메소드
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler:@escaping(UNNotificationPresentationOptions)->Void){
        //부가정보 가져오기
        let userInfo = notification.request.content.userInfo
        print(userInfo["name"]!)
        completionHandler([.alert,.badge,.sound])
    }
    
    //알림을 받았을 때 호출되는 메소드
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler:@escaping()->Void){
        //부가정보 가져오기
        let userInfo = response.notification.request.content.userInfo
        print(userInfo["name"]!)
        completionHandler()
    }
    

}

