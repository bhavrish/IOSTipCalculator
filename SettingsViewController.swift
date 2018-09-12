//
//  SettingsViewController.swift
//  tippy
//
//  Created by Bhavesh Shah on 9/10/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var deafultTipControl: UISegmentedControl!
    @IBOutlet weak var backgroundControl: UISegmentedControl!
    
    let percentage="percentage"
    let currency="currency"
    let backgroundColor="backgroundColor"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let percentage = UserDefaults.standard.value(forKey:percentage) {
            deafultTipControl.selectedSegmentIndex=percentage as! Int
        }
        
        if let backgroundColor = UserDefaults.standard.value(forKey: backgroundColor) {
            backgroundControl.selectedSegmentIndex=backgroundColor as! Int
            switch backgroundControl.selectedSegmentIndex {
            case 0:
                self.view.backgroundColor = .orange
            case 1:
                self.view.backgroundColor = .green
            case 2:
                self.view.backgroundColor = .cyan
            default:
                break;
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeDefaultPercentage(_ sender: Any) {
        UserDefaults.standard.set(deafultTipControl.selectedSegmentIndex, forKey: percentage)
    }
    
    
    @IBAction func changeBackground(_ sender: Any) {
        switch backgroundControl.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = .orange
        case 1:
            self.view.backgroundColor = .green
        case 2:
            self.view.backgroundColor = .cyan
        default:
            break;
        }
        UserDefaults.standard.set(backgroundControl.selectedSegmentIndex, forKey: backgroundColor)
    }

    @IBAction func enter(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var viewcontroller=segue.destination as! ViewController
        switch backgroundControl.selectedSegmentIndex {
        case 0:
            viewcontroller.view.backgroundColor = .orange
        case 1:
            viewcontroller.view.backgroundColor = .green
        case 2:
            viewcontroller.view.backgroundColor = .cyan
        default:
            break;
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
