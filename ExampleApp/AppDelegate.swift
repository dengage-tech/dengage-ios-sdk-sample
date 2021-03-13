
import UIKit
import Dengage_Framework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDengage(with: launchOptions)
        setRootController()
        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func application( _ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var token = "";
        if #available(iOS 13.0, *){
            
            token = deviceToken.map { String(format: "%02x", $0) }.joined()
        }
        else{
            let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
            token = tokenParts.joined()
        }
        
        sendToken(token)
    }
    


    private func sendToken(_ token: String ){
        Dengage.setToken(token: token)

    }
    
    private func setupDengage(with launchOptions:[UIApplication.LaunchOptionsKey: Any]?){
        Dengage.setLogStatus(isVisible: true)
        Dengage.setIntegrationKey(key: Constans.DengageIntegrationKey)
        Dengage.initWithLaunchOptions(withLaunchOptions: launchOptions, badgeCountReset: true)
        Dengage.promptForPushNotifications()
    }

    private func setRootController(){
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = RootViewController.createDummy()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

