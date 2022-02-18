//
//  ContentView.swift
//  Local Notifications
//
//  Created by Ankit Solanki on 18/02/22.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        Button("Send Notification") {
            sendNotification()
        }
    }
    
    public func sendNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
                
                let content = UNMutableNotificationContent()
                content.title = "Notification Titla"
                content.subtitle = "subtitle"
                content.body = " Notification triggered"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { (error) in
                    if error != nil {
                        print(error)
                        // Handle any errors.
                    }
                }
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
