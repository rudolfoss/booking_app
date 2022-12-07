//
//  SelectViewController.swift
//  swe
//
//  Created by HA on 2022/11/01.
//

import UIKit
import CoreLocation

class SelectViewController: UIViewController {

    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //사용자 위치
        locationManager.requestLocation()
        weatherManager.delegate = self
        //self는 현재 뷰 컨트롤러를 나타냄
        // Do any additional setup after loading the view.
    }
    
}
//MARK: - WeatherMangagerDelegate
extension SelectViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherMangager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    func didFailWithError(error: Error){
        print(error)
    }
    
}

//MARK: - CLLocationMangerDelegate

extension SelectViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}
