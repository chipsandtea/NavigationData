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
    
    var groupNames=["Blue Whale",
        "Grey Whale",
        "Minke Whale",
        "Humpback Whale",
        "Orca",
        "Right Whale",
        "Spinner Dolphin",
        "Common Dolphin",
        "Pacific White sided Dolphin",
        "Risso’s Dolphin",
        "Bottle-nosed Dolphin",
        "Harbor Porpoise",
        "Sea Otter",
        "Sea Lion",
        "Harbor Seal",
        "Macrocystis pyrifera",
        "Nereocystis luetkeana",
        "Egregia menziesii",
        "Thalassiothrix",
        "Coscinodiscus",
        "Pseudo-nitzschia",
        "Alexandrium",
        "Ceratium",
        "Noctiluca",
        "Protoperidinium",
        "Black Rockfish",
        "Vermillion Rockfish",
        "Black & Yellow Rockfish",
        "Canary Rockfish",
        "Gopher Rockfish",
        "Blue Rockfish",
        "Rainbow Perch",
        "Opal Eyed Perch",
        "Surf Perch",
        "Lingcod",
        "Cabezon",
        "Garibaldi",
        "Halibut",
        "Starry Flounder",
        "Sanddab",
        "Sculpin",
        "Red Rock Crab",
        "Dungeness Crab",
        "Spider Crab",
        "Purple Shore Crab",
        "Hermit Crab",
        "Decorator Crab",
        "Barnacle",
        "Abalone",
        "Clam",
        "Mussel",
        "Oyster",
        "Scallop",
        "Octopus",
        "Market Squid",
        "Humboldt Squid",
        "Vampire Squid",
        "Giant Octopus",
        "Cuttlefish",
        "California Two Spot Octopus",
        "Red Octopus",
        "Comb Jelly",
        "Sea Nettle",
        "Moon Jelly",
        "Purple Striped Jelly",
        "Egg Yolk Jelly",
        "Box Jelly",
        "Great White Shark",
        "Blue Shark",
        "Basking Shark",
        "Whale Shark",
        "Thresher Shark",
        "Cookie Cutter Shark",
        "Mako Shark",
        "Lemon Shark",
        "Salmon Shark",
        "Guitar Fish",
        "Sting Ray",
        "Bat Ray",
        "Electric Ray",
        "Sea Hare",
        "Sea Cucumber",
        "Nudibranch",
        "Chiton",
        "Moon Snail",
        "Turban Snail",
        "Pacific Sea Star",
        "Brittle Star",
        "Sunflower Sea Star",
        "Ochre Sea Star",
        "Sand Dollar",
        "Purple Sea Urchin",
        "Red Sea Urchin",
        "Keyhole Limpet",
        "Owl Limpet",
        "California Gull",
        "Brown Pelican",
        "Oystercatcher",
        "Grebe",
        "Sandhill Crane",
        "Marbled Murrelet",
        "Murre",
        "Puffin",
        "Pigeon Guillemot",
        "Loon",
        "Common Plover",
        "Snowy Plover",
        "Curlew",
        "Cormorant",
        "Albatross",
        "Sooty Shearwater",
        "Elegant Tern",
        "Snowy Egret",
        "Great Blue Heron",
        "Night Heron"
    ]
    var selectedGroup = String()
    var school = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupPicker.delegate = self
        selectedGroup = groupNames[0]
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestVC: NavigatorDataViewController = segue.destinationViewController as NavigatorDataViewController
        
        DestVC.GroupName = selectedGroup
        DestVC.SchoolName = school
        
    }
    
    
}
