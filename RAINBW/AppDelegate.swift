//
//  AppDelegate.swift
//  RAINBW
//
//  Created by Tadreik Campbell on 2/16/20.
//  Copyright © 2020 Tadreik Campbell. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let locationService = LocationService()
    //let forecastProvider = MoyaProvider<ForecastProvider>()
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "DARKSKY_API_KEY") as! String

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let coordinate = locationService.newestLocation
        print("Location is: \(coordinate)")
        
        
        //locationService.newestLocation = { [weak self] coordinate in
            //guard let self = self, let coordinate = coordinate else { return }
            //print("Location is: \(coordinate)")
           // self.getForecast(for: coordinate)
        //}
        locationService.statusUpdated = { [weak self] status in
            if status == .authorizedWhenInUse {
                self?.locationService.getLocation()
            }
        }
        switch locationService.status {
        case .notDetermined:
            locationService.getPermission()
        case .authorizedWhenInUse:
            locationService.getLocation()
        default:
            assertionFailure("Location is: \(locationService.status)")
        }
        return true
    }
    /*
    func getForecast(for coordinates: CLLocationCoordinate2D) {
        // Forecast request
        forecastProvider.request(.forecast(AppDelegate.apiKey, coordinates.latitude, coordinates.longitude)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let forecast = try Forecast(data: response.data)
                    let viewModels = forecast.daily.data.compactMap(DailyForecastViewModel.init)
                    let forecastViewController = AppDelegate
                        .viewControllerInNav(ofType: ForecastTableViewController.self, in: self.window)
                    forecastViewController?.viewModels = viewModels
                } catch {
                    print("Failed to get forecast: \(error)")
                }
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }
    }
 */

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

