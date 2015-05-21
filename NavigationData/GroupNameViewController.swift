//
//  GroupNameViewController.swift
//  NavigationData
//
//  Created by Christopher Hsiao on 2/10/15.
//  Copyright (c) 2015 Chips&Tea. All rights reserved.
//

import UIKit

class GroupNameViewController: UIViewController,UIPickerViewDelegate {
    @IBOutlet var groupPicker: UIPickerView!
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    var groupNames=["Abalone","Albatross","Alexandrium","Barnacle","Basking Shark","Bat Ray","Black and Yellow Rockfish","Black Rockfish","Black Sea Bass","Blue Rockfish","Blue Shark","Blue Whale","Bottle nosed Dolphin","Box Jelly","Brittle Star","Brown Pelican","Cabezon","California Gull","California Two Spot Octopus","Canary Rockfish","Ceratium","Chiton","Clam","Collosal Squid","Comb Jelly","Common Dolphin","Common Plover","Cookie Cutter Shark","Cormorant","Coscinodiscus","Curlew","Cuttlefish","Decorator Crab","Dungeness Crab","Egg Yolk Jelly","Egregia menziesii","Electric Ray","Elegant Tern","Garibaldi","Giant Octopus","Giant Squid","Gopher Rockfish","Great Blue Heron","Great White Shark","Grebe","Green Sea Turtle","Grey Whale","Guitar Fish","Halibut","Harbor Porpoise","Harbor Seal","Hermit Crab","Humboldt Squid","Humpback Whale","Keyhole Limpet","Leatherback Sea Turtle","Lemon Shark","Lingcod","Loon","Macrocystis pyrifera","Mako Shark","Marbled Murrelet","Minke Whale","Moon Jelly","Moon Snail","Murre","Mussel","Nereocystis luetkeana","Night Heron","Noctiluca","Nudibranch","Ochre Sea Star","Octopus","Opal Eyed Perch","Orca","Owl Limpet","Oyster","Oystercatcher","Pacific Ridley Turtle","Pacific Sea Star","Pacific White sided Dolphin","Pigeon Guillemot","Protoperidinium","Pseudo-nitzschia","Puffin","Purple Sea Urchin","Purple Shore Crab","Purple Striped Jelly","Rainbow Perch","Red Octopus","Red Rock Crab","Red Sea Urchin","Right Whale","Risso’s Dolphin","Salmon Shark","Sand Dollar","Sanddab","Sandhill Crane","Scallop","Sculpin","Sea Cucumber","Sea Hare","Sea Lion","Sea Nettle","Sea Otter","Sea Turtle","Snowy Egret","Snowy Plover","Sooty Shearwater","Spider Crab","Spinner Dolphin","Squid","Starry Flounder","Sting Ray","Sunflower Sea Star","Surf Perch","Surf Scoter","Thalassiothrix","Thresher Shark","Turban Snail","Vampire Squid","Velella Velella Jelly","Vermillion Rockfish","Whale Shark"]
    var selectedGroup = String()
    var school = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupPicker.delegate = self
        schoolNameLabel.text = school
        selectedGroup = groupNames[0]
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return groupNames.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
        return groupNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGroup = groupNames[row]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false);
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestVC: NavigatorDataViewController = segue.destinationViewController as NavigatorDataViewController
        
        DestVC.GroupName = selectedGroup
        DestVC.SchoolName = school
        
    }
    
    
}
