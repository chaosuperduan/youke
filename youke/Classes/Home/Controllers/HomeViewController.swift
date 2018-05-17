//
//  HomeViewController.swift
//  youke
//  Created by 振轩 on 2018/5/12.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,AMapLocationManagerDelegate,MAMapViewDelegate {
    
    let defaultLocationTimeout = 6
    let defaultReGeocodeTimeout = 3
    var mapView: MAMapView!
    var displayLabel: UILabel!
    var completionBlock: AMapLocatingCompletionBlock!
    var footView:HomeFootView = {
        return HomeFootView.LoadView()
    }()
    lazy var locationManager = AMapLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.red;
        configLocationManager()
        setNavgationBar();
        initMapView()
        locationManager.startUpdatingLocation();
    }
  
}

extension HomeViewController{
    
    func initMapView() {
        mapView = MAMapView(frame: CGRect.init(x: 0, y: 64+IPXstatusHeight, width: KScreenW, height: KScreenH-64-185-IPXstatusHeight))
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.isShowsUserLocation = true
        view.addSubview(mapView)
        view.addSubview(footView)
        footView.frame = CGRect.init(x: 0, y: KScreenH-185-tabBarbottomHeight,width: KScreenW, height:185+tabBarbottomHeight )
    }
    func configLocationManager() {
        locationManager.delegate = self
        
        locationManager.pausesLocationUpdatesAutomatically = false
        
        locationManager.allowsBackgroundLocationUpdates = true
    }
    func addAnnotationsToMapView(_ annotation: MAAnnotation) {
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
        mapView.setZoomLevel(15.1, animated: false)
        mapView.setCenter(annotation.coordinate, animated: true)
    }
    func setNavgationBar(){
        
      self.navigationItem.leftBarButtonItem = UIBarButtonItem.setUpBarButtonItemWithImage(imageName: "liuyan")
     self.navigationController?.navigationBar.barTintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "message"), style: .plain, target: self, action: #selector(message))
        self.navigationItem.titleView = CityView.LoadFromNib()
    }
    @objc func message(){
    navigationController?.pushViewController(AddressViewController(), animated: true)
       // present(AddressViewController(), animated: true, completion: nil)
    }
}
extension  HomeViewController{
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode!) {
        mapView.setCenter(location.coordinate, animated: true)
        mapView.setZoomLevel(17.1, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
       
    }
}
