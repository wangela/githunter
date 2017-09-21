//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Angela Yu on 9/20/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsChanged(settingsViewController: SettingsViewController, didUpdateSettings settings: GithubRepoSearchSettings)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var starsSlider: UISlider!
    
    var delegate: SettingsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func settingsFromSlider() -> GithubRepoSearchSettings {
        let searchSettings = GithubRepoSearchSettings()
        let miniStars = Int(starsSlider.value)
        
        searchSettings.minStars = miniStars
        
        return searchSettings
    }
    

    @IBAction func onSaveClick(_ sender: Any) {
        var settings = GithubRepoSearchSettings()
        settings = self.settingsFromSlider()
        
        delegate?.settingsChanged(settingsViewController: self, didUpdateSettings: settings)
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onCancelClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
