import UIKit

final class RootViewController: UITabBarController {

    // MARK: Lifecycle
    init(controllers: [UIViewController], tabBarItems: [UITabBarItem]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = controllers
        
        for (controller, tabBarItem) in zip(controllers, tabBarItems) {
            controller.tabBarItem = tabBarItem
        }
        tabBar.layer.shadowOffset = CGSize(width: 1, height: 1)
        tabBar.layer.shadowRadius = 0
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func createDummy() -> RootViewController{
        let subscriptionNavigationController = UINavigationController(rootViewController: SubscriptionViewController())
        let eventNavigationController = UINavigationController(rootViewController: EventViewController())
        let inboxNavigationController = UINavigationController(rootViewController: InboxMessagesViewController())
        let inAppMessageViewController = UINavigationController(rootViewController: InAppMessageViewController())
        let tagsNavigationController = UINavigationController(rootViewController: TagsViewController())
        let subscriptionTabBarItem = UITabBarItem(title: "Subscription", image: nil, tag: 0)
        let eventTabBarItem = UITabBarItem(title: "Event Collection", image: nil, tag: 1)
        let inboxTabBarItem = UITabBarItem(title: "Inbox", image: nil, tag: 2)
        let inAppTabBarItem = UITabBarItem(title: "InApp", image: nil, tag: 3)
        let tagsTabBarItem = UITabBarItem(title: "Tags", image: nil, tag: 4)
        return RootViewController(controllers: [subscriptionNavigationController,
                                                eventNavigationController,
                                                inboxNavigationController,
                                                inAppMessageViewController,
                                                tagsNavigationController],
                                  tabBarItems: [subscriptionTabBarItem,
                                                eventTabBarItem,
                                                inboxTabBarItem,
                                                inAppTabBarItem,
                                                tagsTabBarItem])
        
    }
}
