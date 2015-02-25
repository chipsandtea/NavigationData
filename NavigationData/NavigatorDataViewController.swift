//
//  NavigatorDataViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/10/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit
import CoreLocation

class NavigatorDataViewController: ResponsiveTextFieldViewController,UIPickerViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var schoolGroupName: UILabel!
    var GroupName = String()
    var SchoolName = String()
    
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var pickLoc: UIPickerView! = UIPickerView()
    @IBOutlet var Location2: UITextField!
    @IBOutlet var Location3: UITextField!
    @IBOutlet var Location4: UITextField!
    @IBOutlet var Bearing2: UITextField!
    @IBOutlet var Bearing3: UITextField!
    @IBOutlet var Bearing4: UITextField!
    @IBOutlet var B2Label: UILabel!
    @IBOutlet var B3Label: UILabel!
    @IBOutlet var B4Label: UILabel!
    @IBOutlet var L2Label: UILabel!
    @IBOutlet var L3Label: UILabel!
    @IBOutlet var L4Label: UILabel!
    
    //gps
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var locationUpdateButton: UIButton!
    @IBOutlet var LATDEG: UITextField!
    @IBOutlet var LONGDEG: UITextField!
    @IBOutlet var LATMIN: UITextField!
    @IBOutlet var LONGMIN: UITextField!
    @IBOutlet var LATSEC: UITextField!
    @IBOutlet var LONGSEC: UITextField!
    @IBOutlet var LatLabel: UILabel!
    @IBOutlet var LongLabel: UILabel!
    @IBOutlet var D1Label: UILabel!
    @IBOutlet var D2Label: UILabel!
    @IBOutlet var M1Label: UILabel!
    @IBOutlet var M2Label: UILabel!
    @IBOutlet var S1Label: UILabel!
    @IBOutlet var S2Label: UILabel!
    
    //wind
    @IBOutlet var WINDSPEED: UITextField!
    @IBOutlet var DEPTH: UITextField!
    @IBOutlet var WSLabel: UILabel!
    @IBOutlet var DepthLabel: UILabel!
    
    //wethur
    @IBOutlet var WOLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var SunnyButton: UIButton!
    @IBOutlet var LFButton: UIButton!
    @IBOutlet var HFButton: UIButton!
    @IBOutlet var PCButton: UIButton!
    @IBOutlet var OCButton: UIButton!
    @IBOutlet var LRButton: UIButton!
    @IBOutlet var HRButton: UIButton!
    
    //tabs
    @IBOutlet var BLTabButton: UIButton!
    @IBOutlet var GPSTabButton: UIButton!
    @IBOutlet var WDTabButton: UIButton!
    @IBOutlet var WeTabButton: UIButton!
    
    var selectedLoc: UITextField!
    
    
    var locs = ["Cocoanut Grove","Mile Buoy","Radio Towers","Soquel Point","Santa Cruz Wharf","Harbor Lighthouse","Steamers Lighthouse","Government Buoy","Dream Inn","Seal Rock","Giant Dipper","Wharf Elbow","Black's Point"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolGroupName.text = "School: " + SchoolName + " Group: " + GroupName
        pickLoc.hidden = true
        BLTabButton.layer.borderWidth = 1
        GPSTabButton.layer.borderWidth = 1
        WDTabButton.layer.borderWidth = 1
        WeTabButton.layer.borderWidth = 1
        hideGPS(true)
        hideWeather(true)
        hideWind(true)
        doneButton.hidden = true

		BLTabButton.backgroundColor = UIColor.lightGrayColor()
    }
    
    @IBAction func sunnyChosen(sender: UIButton) {
        weatherLabel.text = "sunny"
    }
    @IBAction func LFChosen(sender: UIButton) {
        weatherLabel.text = "light fog"
    }
    @IBAction func HFChosen(sender: UIButton) {
        weatherLabel.text = "heavy fog"
    }
    
    @IBAction func PCChosen(sender: UIButton) {
        weatherLabel.text = "partly cloudy"
    }
    
    @IBAction func OCChosen(sender: UIButton) {
        weatherLabel.text = "overcast"
    }
    
    @IBAction func HRChosen(sender: UIButton) {
        weatherLabel.text = "heavy rain"
    }
    
    @IBAction func LRChosen(sender: UIButton) {
        weatherLabel.text = "light rain"
    }
    
    @IBAction func WDPressed(sender: UIButton) {
        hideBL(true)
        hideGPS(true)
        hideWeather(true)
        hideWind(false)
        doneButton.hidden = true
		BLTabButton.backgroundColor = UIColor.clearColor()
		WDTabButton.backgroundColor = UIColor.lightGrayColor()
		GPSTabButton.backgroundColor = UIColor.clearColor()
		WeTabButton.backgroundColor = UIColor.clearColor()
    }
    
    @IBAction func WePressed(sender: UIButton) {
        hideBL(true)
        hideWind(true)
        hideGPS(true)
        hideWeather(false)
        doneButton.hidden = false
		BLTabButton.backgroundColor = UIColor.clearColor()
		WDTabButton.backgroundColor = UIColor.clearColor()
		GPSTabButton.backgroundColor = UIColor.clearColor()
		WeTabButton.backgroundColor = UIColor.lightGrayColor()
    }
    

    @IBAction func GPSPressed(sender: UIButton) {
        hideBL(true)
        hideWind(true)
        hideWeather(true)
        hideGPS(false)
        doneButton.hidden = true
		BLTabButton.backgroundColor = UIColor.clearColor()
		WDTabButton.backgroundColor = UIColor.clearColor()
		GPSTabButton.backgroundColor = UIColor.lightGrayColor()
		WeTabButton.backgroundColor = UIColor.clearColor()
    }
    
    @IBAction func BLPressed(sender: UIButton) {
        hideGPS(true)
        hideWind(true)
        hideWeather(true)
        hideBL(false)
        doneButton.hidden = true
		BLTabButton.backgroundColor = UIColor.lightGrayColor()
		WDTabButton.backgroundColor = UIColor.clearColor()
		GPSTabButton.backgroundColor = UIColor.clearColor()
		WeTabButton.backgroundColor = UIColor.clearColor()
    }
    
    func hideWeather(sender:Bool){
        if(sender){
            WOLabel.hidden = true
            weatherLabel.hidden = true
            SunnyButton.hidden = true
            LFButton.hidden = true
            HFButton.hidden = true
            PCButton.hidden = true
            LRButton.hidden = true
            OCButton.hidden = true
            HRButton.hidden = true
        }else{
            WOLabel.hidden = false
            weatherLabel.hidden = false
            SunnyButton.hidden = false
            LFButton.hidden = false
            HFButton.hidden = false
            PCButton.hidden = false
            LRButton.hidden = false
            OCButton.hidden = false
            HRButton.hidden = false
        }
        
    }
    
    func hideWind(sender:Bool){
        if(sender){
            WINDSPEED.hidden = true
            DEPTH.hidden = true
            WSLabel.hidden = true
            DepthLabel.hidden = true
        }else{
            WINDSPEED.hidden = false
            DEPTH.hidden = false
            WSLabel.hidden = false
            DepthLabel.hidden = false
        }
    }
    
    func hideGPS(sender:Bool){
        if(sender){
            locationUpdateButton.hidden = true
            LATDEG.hidden = true
            LONGDEG.hidden = true
            LATMIN.hidden = true
            LONGMIN.hidden = true
            LATSEC.hidden = true
            LONGSEC.hidden = true
            LatLabel.hidden = true
            LongLabel.hidden = true
            D1Label.hidden = true
            D2Label.hidden = true
            M1Label.hidden = true
            M2Label.hidden = true
            S1Label.hidden = true
            S2Label.hidden = true
        }else{
            locationUpdateButton.hidden = false
            LATDEG.hidden = false
            LONGDEG.hidden = false
            LATMIN.hidden = false
            LONGMIN.hidden = false
            LATSEC.hidden = false
            LONGSEC.hidden = false
            LatLabel.hidden = false
            LongLabel.hidden = false
            D1Label.hidden = false
            D2Label.hidden = false
            M1Label.hidden = false
            M2Label.hidden = false
            S1Label.hidden = false
            S2Label.hidden = false
        }
    }
    
    func hideBL(sender: Bool){
        if(sender){
            Location2.hidden = true
            Location3.hidden = true
            Location4.hidden = true
            Bearing2.hidden = true
            Bearing3.hidden = true
            Bearing4.hidden = true
            B2Label.hidden = true
            B3Label.hidden = true
            B4Label.hidden = true
            L2Label.hidden = true
            L3Label.hidden = true
            L4Label.hidden = true
            pickLoc.hidden = true
        }else{
            Location2.hidden = false
            Location3.hidden = false
            Location4.hidden = false
            Bearing2.hidden = false
            Bearing3.hidden = false
            Bearing4.hidden = false
            B2Label.hidden = false
            B3Label.hidden = false
            B4Label.hidden = false
            L2Label.hidden = false
            L3Label.hidden = false
            L4Label.hidden = false
            pickLoc.hidden = true
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return locs.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
        return locs[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        selectedLoc.text = locs[row]
        pickLoc.hidden = true;
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if(textField.tag != 0) {
            pickLoc.hidden = false
            selectedLoc = textField
            return false
        }
        return true
    }
    
    @IBAction func findMyLocation(sender: AnyObject) {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
            
            if error != nil {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                println("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark){
        // stop updating to conserve battery life
        locationManager.stopUpdatingLocation()
        // longitude and latitude parsing
        var latitude = placemark.location.coordinate.latitude
        var longitude = placemark.location.coordinate.longitude
        var latSeconds = Int(latitude * 3600)
        let latDegrees = latSeconds / 3600
        latSeconds = abs(latSeconds % 3600)
        let latMinutes = latSeconds / 60
        latSeconds %= 60
        var longSeconds = Int(longitude * 3600)
        let longDegrees = longSeconds / 3600
        longSeconds = abs(longSeconds % 3600)
        let longMinutes = longSeconds / 60
        longSeconds %= 60
        var result = String(format:"%d°%d'%d\"%@ %d°%d'%d\"%@",
            abs(latDegrees),
            latMinutes,
            latSeconds,
            {return latDegrees >= 0 ? "N" : "S"}(),
            abs(longDegrees),
            longMinutes,
            longSeconds,
            {return longDegrees >= 0 ? "E" : "W"}() )
        println(result)
      
        LATDEG.text = String(latDegrees)
        LONGDEG.text = String(longDegrees)
        LATMIN.text = String(latMinutes)
        LONGMIN.text = String(longMinutes)
        LATSEC.text = String(latSeconds)
        LONGSEC.text = String(longSeconds)
      
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }

   @IBAction func saveDataDict(sender: AnyObject)
   {
      self.gatherAllData()
   }
    
    func gatherAllData() {
        
        var aDictionary = [String : String]()
        var bDictionary = [String : String]()
        var cDictionary = [String : String]()
        var dDictionary = [String : String]()
        
        aDictionary["bearing_1"] = Location2.text
        aDictionary["bearing_2"] = Location3.text
        aDictionary["bearing_3"] = Location4.text
        aDictionary["bearing1_degrees"] = Bearing2.text
        aDictionary["bearing2_degrees"] = Bearing3.text
        aDictionary["bearing3_degrees"] = Bearing4.text
        aDictionary["gps_latitude_degrees"] = LATDEG.text
        aDictionary["gps_longitude_degrees"] = LONGDEG.text
        aDictionary["gps_latitude_min"] = LATMIN.text
        aDictionary["gps_longitude_min"] = LONGMIN.text
        aDictionary["gps_latitude_sec"] = LATSEC.text
        aDictionary["gps_longitude_sec"] = LONGSEC.text
        aDictionary["nwind_speed"] = WINDSPEED.text
        aDictionary["ndepth"] = DEPTH.text
        aDictionary["nweather_observation"] = weatherLabel.text
        
        aDictionary["nmeasurement_time"] = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .NoStyle, timeStyle: .ShortStyle)
        
        aDictionary["nmeasurement_date"] = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
        bDictionary["type"] = "navigation_data"
        cDictionary["group"] = GroupName
        dDictionary["id"] = "some id"
        
        sharedData().setObject(aDictionary, forKey: "data")
        sharedData().addEntriesFromDictionary(bDictionary)
        sharedData().addEntriesFromDictionary(cDictionary)
        sharedData().addEntriesFromDictionary(dDictionary)
        println(sharedData())
        
        //aDictionary.setObject(Location2.text, forKey:bearing_1)
        
        ///var myNewDictArray: [[String:String]] = []
        //myNewDictArray.append(aDictionary)//add to overall dictionary(not needed?????)
       // sharedData().setObject(myNewDictArray, forKey: "navigation_data")
        //bData().setObject(sharedData(), forKey: "group_data")
        //cData().setObject(bData(), forKey: "data")
    }

    @IBAction func saveData(sender: AnyObject) {
        gatherAllData()
        println(sharedData())
        println(GroupName)

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestVC: SubmitDataViewController = segue.destinationViewController as SubmitDataViewController
        DestVC.groupName = GroupName
    }



}
