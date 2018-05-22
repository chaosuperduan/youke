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
    var addressBlock:PassBak?
    var poi:AMapAOI?
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
        mapView = MAMapView(frame: CGRect.init(x: 0, y: 0, width: KScreenW, height: KScreenH-185))
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.isShowsUserLocation = true
        view.addSubview(mapView)
        view.addSubview(footView)
        footView.frame = CGRect.init(x: 0, y: KScreenH-185-tabBarbottomHeight-44-10-10,width: KScreenW, height:185+tabBarbottomHeight+44+10+10 )
        footView.operationBlock = {(methodType,str,closureblock)
            in
            self.addressBlock = closureblock
            switch methodType {
            case .address:do {
                let vc = AddressViewController()
                vc.callBack = { poi
                    in
                    self.addressBlock!(poi.name)
                }
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.frame.origin.y = self.view.frame.origin.y - 300
                    self.present(vc, animated: true, completion: nil)
                })
               
                }
                break
            
            default: break
                }
            }
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
        let lfBarItem = UIBarButtonItem.setUpBarButtonItemWithImage(imageName: "liuyan",target: self, action: #selector(leftClick))
        
     self.navigationItem.leftBarButtonItem = lfBarItem
     self.navigationController?.navigationBar.barTintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "message"), style: .plain, target: self, action: #selector(message))
        self.navigationItem.titleView = CityView.LoadFromNib()
    }
    @objc func leftClick(){
        
       self.menuContainerViewController.toggleLeftSideMenu(completeBolck: nil)
        
    }
    @objc func message(){
    navigationController?.pushViewController(AddressViewController(), animated: true)
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
