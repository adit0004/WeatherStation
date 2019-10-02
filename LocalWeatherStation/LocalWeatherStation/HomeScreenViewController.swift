//
//  HomeScreenViewController.swift
//  LocalWeatherStation
//
//  Created by Aditya Kumar on 01/10/19.
//  Copyright © 2019 Aditya Kumar. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cloudsImage: UIImageView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        setScreen(weather:"Sunny")
//        setScreen(weather: "Partly Cloudy")
        setScreen(weather: "Cloudy")
        FirebaseController()
        
    }
    
    func setScreen(weather:String) {
        // Clear all images from the cloud section since Sunny weather doesn't need it
        cloudsImage.image = nil
        
        // Set the weather icon to sunny by default, change below according to weather if needed
        weatherIcon.image = UIImage(named: "Sunny")

        // Default colors for Sunny weather
        var topColor = UIColor(red: 79/255, green: 156/255, blue: 217/255, alpha: 1.0).cgColor
        var bottomColor = UIColor(red: 114/255, green: 186/255, blue: 223/255, alpha: 1.0).cgColor
        
        // Handle partly cloudy weather
        if weather == "Partly Cloudy" {
            topColor = UIColor(red: 122/255, green: 179/255, blue: 215/255, alpha: 1.0).cgColor
            bottomColor = UIColor(red: 148/255, green: 181/255, blue: 198/255, alpha: 1.0).cgColor
            // Set partly cloudy image
            cloudsImage.image = UIImage(named: "Clouds")
            
            // Set partly cloudy icon
            weatherIcon.image = UIImage(named:"Partly Cloudy")
        }
        
        // Handle cloudy weather
        if weather == "Cloudy" {
            topColor = UIColor(red: 125/255, green: 169/255, blue: 197/255, alpha: 1.0).cgColor
            bottomColor = UIColor(red: 129/255, green: 156/255, blue: 169/255, alpha: 1.0).cgColor
            // Set partly cloudy image
            cloudsImage.image = UIImage(named: "CloudyHeader")
            
            // Set partly cloudy icon
            weatherIcon.image = UIImage(named:"Cloudy")
        }
        
        // Create the actual gradient layer
        let gradient = CAGradientLayer()
        
        // TODO: This is a scam for now, replace 800 with all the elements summed up
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width:UIScreen.main.bounds.size.width,height:800))
        gradient.colors = [topColor, bottomColor]
        gradient.frame = frame
        
        // Insert the gradient at the very bottom
        scrollView.layer.insertSublayer(gradient,at:0)
        
        // Set the weather label
        weatherLabel.text = weather
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
