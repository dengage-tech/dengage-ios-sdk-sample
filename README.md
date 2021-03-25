
# Dengage iOS SDK 
## Useful Links
- [SDK Documentation](https://dev.dengage.com/mobile-sdk/ios/)
- [Admin Panel](https://appdev.dengage.com/)

## Version Support
The iOS SDK supports iOS 10.0+.

## SDK Implementation
- `Example` - Contains integration examples for the iOS SDK.
	- The Example App uses our [CocoaPods](http://guides.cocoapods.org/) integration (`Dengage.Framework`), so you must :
	  1. [Install CocoaPods](http://guides.cocoapods.org/using/getting-started.html)
	  2. Run `pod install` in the `Example` directory
	  3. Open the `ExampleApp.xcworkspace` to open the project.

## Example App Content

### 1 - Adding Endpoint Configuration (See [Info.plist](https://github.com/dengage-tech/dengage-ios-sdk-sample/blob/master/ExampleApp/Info.plist))
- `DengageEventApiUrl` (meta-data) -> Event api url of Dengage (Optional parameter)
- `DengageApiUrl`  (meta-data) -> Push api url of Dengage (Optional parameter)

### 2 - Initiating Dengage Classes 
- `import Dengage_Framework` -> After CocoaPods installation, you can access SDK’s methods by importing Dengage_Framework
- To set integration key SDK Provides `Dengage.setIntegrationKey(key: String)` method.
- After setting Integration Key, to use SDK features, `Dengage.initWithLaunchOptions(withLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?,badgeCountReset: Bool?)` function must be called.

### 3 - Asking User Permission for Notification
- `import Dengage_Framework` -> After CocoaPods installation, you can access SDK’s methods by importing Dengage_Framework
- In you application cyle if you want to get UserNotification permission you must call: `Dengage.promptForPushNotifications()`

### 4 - Sending Page View Events (See class [DengageEvent](https://github.com/whitehorse-technology/Dengage.Framework/blob/master/Dengage.Framework/Classes/DengageEvent.swift))
- `DengageEvent.shared.pageView` -> Send page view event with page type or name
- For more information https://dev.dengage.com/mobile-sdk/ios/event-collections

### 5 - Changing Contact Key (See function [setContactKey](https://github.com/dengage-tech/dengage-ios-sdk-sample/blob/master/ExampleApp/Scenes/Subscription/SubscriptionViewController.swift)
- `Dengage.setContactKey(contactKey: "userId")`

### 6 - Listing Inbox Messages & Actions of Inbox Messages (See class [InboxMessagesViewController](https://github.com/dengage-tech/dengage-ios-sdk-sample/blob/master/ExampleApp/Scenes/InboxMessages/InboxMessagesViewController.swift)
- `Dengage.getInboxMessages` -> Use this method for fetching inbox messages with pagination.
    #### Method Params
    - `limit` -> inbox message item limit per page
    - `offset` -> inbox message offset for page beginning
    - `(Result<[DengageMessage], Error>) -> Void)` -> for inbox messages response

- `Dengage.setInboxMessageAsClicked` -> Call this method with inbox message id if inbox message is clicked
- `Dengage.deleteInboxMessage` -> Call this method with inbox message id if inbox message is deleted

### 7 - Sending Custom Events (See function [SendDeviceEvent](https://github.com/whitehorse-technology/Dengage.Framework/blob/982f543d80a741130b673f9ea10801155360c307/Dengage.Framework/Classes/DengageApiExtension.swift#L29))
- `Dengage.SendDeviceEvent(toEventTable: 'events', andWithEventDetails: params)` -> Use this method for sending custom events
    #### Method Params
    - `toEventTable` -> table name of custom event 
    - `andWithEventDetails` -> custom event data as map

### 8 - In App Message (See class [InAppMessageViewController](https://github.com/dengage-tech/dengage-ios-sdk-sample/blob/master/ExampleApp/Scenes/InAppMessage/InAppMessageViewController.swift))
- `Dengage.setNavigation` -> Call this method for showing in app message on current page
    #### Method Params
    - `screenName` -> screen name of current screen

### 9 - Send Tags (See class [TagsViewController](https://github.com/dengage-tech/dengage-ios-sdk-sample/blob/master/ExampleApp/Scenes/InAppMessage/InAppMessageViewController.swift))
- `Dengage.setTags` -> Use this method for sending tags
    #### Method Params
    - `tags` -> dictionary of tag parameters below
        - `tag` -> tag name
        - `value` -> tag value
        - `changeTime` -> tag change time
        - `changeValue` -> tag change value
        - `removeTime` -> tag remove time
