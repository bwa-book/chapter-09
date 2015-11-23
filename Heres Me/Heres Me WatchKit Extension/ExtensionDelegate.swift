import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

    func handleActionWithIdentifier(identifier: String?,
        forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        guard let identifier = identifier else { return }
        switch (identifier) {
            case "statusReplyAction":
                handleStatusReplyForNotification(remoteNotification)
            case "locationReplyAction":
                handleLocationReplyForNotification(remoteNotification)
            case "postLocationAction":
                handlePostLocationForNotification(remoteNotification)
            default:
                handleGeneralTapForNotification(remoteNotification)
        }
    }

    func handleStatusReplyForNotification(notification: [NSObject : AnyObject]) { }
    func handleLocationReplyForNotification(notification: [NSObject : AnyObject]) { }
    func handlePostLocationForNotification(notification: [NSObject : AnyObject]) { }
    func handleGeneralTapForNotification(notification: [NSObject : AnyObject]) { }

}
