//
//  StepToPlant.swift
//  GreenThumb
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI
import UserNotifications

struct StepToPlant: View {
    
    var plant: Plant
    @State private var navigateBack = false
    @State private var showingNotificationRequestAlert = false
    @State private var notificationContent = UNMutableNotificationContent()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Divider()
                    stepOneSection
                    Divider()
                    stepTwoSection
                    Divider()
                    stepThreeSection
                    Spacer()
                    ownPlantButton
                }
            }
            .navigationTitle("Step To Plant")
            .alert(isPresented: $showingNotificationRequestAlert) {
                Alert(
                    title: Text("Notifications"),
                    message: Text("Would you like to receive notifications?"),
                    primaryButton: .default(Text("Yes")) {
                        configureNotification(showAlert: true)
                    },
                    secondaryButton: .cancel(Text("No"))
                )
            }
        }
    }
    
    private var stepOneSection: some View {
        VStack {
            Text("Step 1")
                .font(.title)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.286, green: 0.521, blue: 0.325))
            Divider()
            MapView(coordinate: plant.locationCoordinate)
                .frame(height: 300)
            Divider()
            Text("You can look for \(plant.name) seeds in the following stores:")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal, 6)
                .frame(maxWidth: 350, alignment: .leading)
            storeInfoSection
            Divider()
        }
    }
    
    private var storeInfoSection: some View {
        HStack {
            CircleImage(image: Image(plant.store_image))
                .frame(width: 90, height: 130)
                .padding(.leading)
                .clipShape(Circle())
                .overlay { Circle().stroke(.white, lineWidth: 4) }
                .shadow(radius: 7)
            VStack {
                Text(plant.store_name)
                    .font(.system(size: 20))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.286, green: 0.521, blue: 0.325))
                    .frame(maxWidth: 350, alignment: .leading)
                Text(plant.store_address)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 6)
                    .frame(maxWidth: 350, alignment: .leading)
            }
            .padding()
        }
        .padding()
    }
    
    private var stepTwoSection: some View {
        VStack {
            Text("Step 2")
                .font(.title)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.286, green: 0.521, blue: 0.325))
            Divider()
            plantingSection
            Divider()
        }
    }
    
    private var plantingSection: some View {
        VStack(alignment: .leading) {
            Text("How to Plant")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.286, green: 0.521, blue: 0.325))
                .padding(.vertical, 20)
                .frame(maxWidth: 350, alignment: .leading)
            Text(formatPlantingSteps(plant.plantingSteps))
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal, 6)
                .frame(maxWidth: 350, alignment: .leading)
        }
        .padding()
    }
    
    private var stepThreeSection: some View {
        VStack {
            Text("Step 3")
                .font(.title)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.286, green: 0.521, blue: 0.325))
            Divider()
            plantingSection
        }
    }
    
    private var ownPlantButton: some View {
        Button(action: {
            configureNotification(showAlert: true)
        }) {
            NavigationLink(destination: HomeView().environment(ModelData())) {
                Text("Your Own Plant")
                    .padding(.vertical, 15)
                    .padding(.horizontal, 80)
                    .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
        }
        .padding()
    }
    
    func configureNotification(showAlert: Bool) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("Notifications authorized")
                showingNotificationRequestAlert = showAlert
                scheduleNotification()
            } else {
                print("Notifications denied")
            }
        }
    }
    
    func scheduleNotification() {
        notificationContent.title = "GreenThumb Reminder"
        notificationContent.body = "Don't forget to water your \(plant.name) at \(plant.wateringTime)!"
        notificationContent.sound = UNNotificationSound.default
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
    
    private func formatPlantingSteps(_ steps: String) -> String {
        let stepsArray = steps.split(separator: " ")
        var formattedSteps = ""
        for (_, step) in stepsArray.enumerated() {
            if step.hasSuffix(".") && (step.dropLast().allSatisfy { $0.isNumber }) {
                formattedSteps += "\n\(step) "
            } else {
                formattedSteps += "\(step) "
            }
        }
        return formattedSteps.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        StepToPlant(plant: plants[7])
    }
}

