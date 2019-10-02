//
//  FirebaseController.swift
//  LocalWeatherStation
//
//  Created by Prashant Singh on 2/10/19.
//  Copyright © 2019 Aditya Kumar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FirebaseController: NSObject{
    
    var authController: Auth
    var database: Firestore
    var sensorDataRef: CollectionReference?
    
    var sensorDataList:[SensorData]
    
    
    override init() {
        
        
        FirebaseApp.configure()
        authController = Auth.auth()
        database = Firestore.firestore()
        sensorDataList = [SensorData]()
        super.init()
        
        authController.signInAnonymously() { (authResult, error) in
            guard authResult != nil else {
                fatalError("Firebase authentication failed")
            }
            
            self.initialiseListeners()            
        }
        
    }
    
    func initialiseListeners(){
        
        sensorDataRef = database.collection("SensorData")
        sensorDataRef?.addSnapshotListener({ querySnapshot, error in
            guard(querySnapshot?.documents) != nil else{
                print("Cannot fetch documents:\(error!)")
                return
            }
            
            self.parseSensorData(snapshot: querySnapshot!)
        
        })
        
    }
    
    func parseSensorData(snapshot:QuerySnapshot){
        
        snapshot.documentChanges.forEach { change in
            let documentRef = change.document.documentID
            
            let timestamp = change.document.data()["Timestamp"] as! String
            let airPressure = change.document.data()["Air Pressure"] as! Double
            let temperature = change.document.data()["Temperature"] as! Double
            let red = change.document.data()["Red"] as! Int
            let green = change.document.data()["Green"] as! Int
            let blue = change.document.data()["Blue"] as! Int
            let light = change.document.data()["Light"] as! Int
            
            print(documentRef)
            
            
            if change.type == .added {
                print("Sensor Data: \(change.document.data())")
                let sensorData = SensorData(timeStamp: timestamp, airPressure: airPressure, temperature: temperature, red: red, green: green, blue: blue, light: light)
                
                sensorDataList.append(sensorData)
                
            }
        }
        
        print(sensorDataList)
        
    }
    
    
}
