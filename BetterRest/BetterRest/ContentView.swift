//
//  ContentView.swift
//  BetterRest
//
//  Created by Gaurav Joshi on 7/15/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
   
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("When do you want to wake up?")
                    .font(.headline)
                    .foregroundColor(.black)){
                    //Text("When do you want to wake up?")
                      //  .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section(header: Text("Desired amount of sleep")
                    .font(.headline)
                    .foregroundColor(.black)){
                    
                    Stepper(value : $sleepAmount, in: 4...12, step: 0.25){
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                
                }
                Section(header: Text("Daily coffee intake")
                    .font(.headline)
                    .foregroundColor(.black)){
                    
                    Picker("Number of cups", selection: $coffeeAmount){
                        ForEach(0..<21){
                            Text("\($0) cups")
                        }
                    }
                        //Stepper(value: $coffeeAmount, in: 1...20){
                      //  if(coffeeAmount == 1){
                       //     Text("1 cup")
                        //}
                        //else{
                          //  Text("\(coffeeAmount) cups")
                        //}
                   // }
                }
                
            }
        .navigationBarTitle("Better Rest")
        .navigationBarItems(trailing:
            
        Button(action: calculateBedTime){
                Text("Calculate")
                }
            )
                .alert(isPresented: $showingAlert){
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("ok")))
            }
        }
            
    }
    
    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedTime(){
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do{
            let prediction = try
            model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
                
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is..."
            
        }
        catch{
            alertTitle = "Error"
            alertMessage = "Sorry there was a problem calculating your bedtime."
        }
        showingAlert = true
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
