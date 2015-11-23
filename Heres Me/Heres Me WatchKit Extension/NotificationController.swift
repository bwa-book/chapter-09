import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var alertLabel: WKInterfaceLabel!
    @IBOutlet var locationMap: WKInterfaceMap!

    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    /*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */

    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject],
        withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        let apsDictionary = remoteNotification["aps"] as! NSDictionary
        let alertDictionary = apsDictionary["alert"] as! NSDictionary
        let bodyText = alertDictionary["body"] as! String
        let locationCoord = alertDictionary["locationCoord"] as! String
        let (location, region) = createLocationAndRegionFromCoordinate(locationCoord)

        alertLabel.setText(bodyText)
        locationMap.setRegion(region)
        locationMap.addAnnotation(location, withPinColor: .Red)

        completionHandler(.Custom)
    }

    func createLocationAndRegionFromCoordinate(coordinate: String) ->
        (CLLocationCoordinate2D, MKCoordinateRegion) {
        let coordinateArray = coordinate.characters.split { $0 == "," }.map(String.init)
        let lat = (coordinateArray[0] as NSString).doubleValue
        let long = (coordinateArray[1] as NSString).doubleValue
        let location = CLLocationCoordinate2DMake(lat, long)

        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location, span)

        return (location, region)
    }

    override func suggestionsForResponseToActionWithIdentifier(identifier: String,
        forRemoteNotification remoteNotification: [NSObject : AnyObject],
        inputLanguage: String) -> [String] {
        return ["Swet", "Na mate!"]
    }
}
