//
//  StepToPlant.swift
//  GreenThumb
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import UserNotifications

struct StepToPlant: View {
    
    //    @Environment(ModelData.self) var modelData
    
    var plant: Plant
    @State private var navigateBack = false
    @State private var showingNotificationRequestAlert = false
    @State private var notificationContent = UNMutableNotificationContent()
    
    
    
    //    var plantIndex: Int {
    //        modelData.plants.firstIndex(where: { $0.id == plant.id })!
    //    }
    
    var body: some View {
        
        //        @Bindable var modelData = modelData
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Divider()
                    
                    Text("Step 1")
                        .font(.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    
                    Divider()
                    
                    MapView(coordinate: plant.locationCoordinate)
                        .frame(height: 300)
                    
                    Divider()
                    
                    Text("You can look for \(plant.name) seeds in the following stores:")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 6)
                        .frame(maxWidth: 350.0, alignment: .leading)
                    
                    HStack{
                        CircleImage(image:Image(plant.store_image))
                        //                        .offset(y: -130)
                            .frame(width: 90, height: 130)
                            .padding(.leading)
                            .clipShape(Circle())
                            .overlay {Circle().stroke(.white, lineWidth: 4)}
                            .shadow(radius: 7)
                        VStack{
                            Text(plant.store_name)
                                .font(.system(size: 20))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                            
                            //                    .padding(.vertical, 20.0)
                                .frame(maxWidth: 350.0, alignment: .leading)
                            
                            Text(plant.store_address)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 6)
                                .frame(maxWidth: 350.0, alignment: .leading)
                        }
                        .padding()
                    }
                    .padding()
                    
                    Divider()
                    
                    Text("Step 2")
                        .font(.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("How to Plant")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                        
                            .padding(.vertical, 20.0)
                            .frame(maxWidth: 350.0, alignment: .leading)
                        
                        
                        Text(formatPlantingSteps(plant.plantingSteps))
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 6)
                            .frame(maxWidth: 350.0, alignment: .leading)
                    }
                    .padding()
                    
                    Divider()
                    
                    Text("Step 3")
                        .font(.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("How to Plant")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                        
                            .padding(.vertical, 20.0)
                            .frame(maxWidth: 350.0, alignment: .leading)
                        
                        
                        Text(formatPlantingSteps(plant.plantingSteps))
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 6)
                            .frame(maxWidth: 350.0, alignment: .leading)
                    }
                    
                    NavigationLink(destination: HomeView().environment(ModelData())) {
                        Text("Your Own Plant")
                            .padding(.vertical, 15.0)
                            .padding(.horizontal, 80.0)
                            .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .onTapGesture {
                                configureNotification(showAlert: true) // Call notification function
                            }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("Step To Plant")
            .alert(isPresented: $showingNotificationRequestAlert) {
                Alert(
                    title: Text("Notifications"),
                    message: Text("Would you like to receive notifications?"),
                    primaryButton: .default(Text("Yes")) {
                        scheduleNotification() // Schedule notification if user grants permission
                    },
                    secondaryButton: .cancel(Text("No"))
                )
            }
        }
    }
    
    // Moved notification logic outside the view for better organization
    func configureNotification(showAlert: Bool) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("Notifications authorized")
                showingNotificationRequestAlert = showAlert // Update state based on argument
                scheduleNotification()
            } else {
                print("Notifications denied")
                // Handle denial as needed (e.g., display an informative message)
            }
        }
    }
    
    func scheduleNotification() {
        notificationContent.title = "GreenThumb Reminder"
        notificationContent.body = "Don't forget to watering your \(plant.name) at \(plant.wateringTime)!"
        notificationContent.sound = UNNotificationSound.default
        
        // Set trigger for notification (replace with desired timing)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        StepToPlant(plant: plants[7])
    }
}

