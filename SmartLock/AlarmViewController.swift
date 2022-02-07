//
//  AlarmViewController.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/6/22.
//

import UIKit

class AlarmViewController: UIViewController {

    @IBOutlet weak var alarmText: UILabel!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            if self.alarmText.textColor == UIColor.black {
                self.alarmText.textColor = UIColor.white
            } else {
                self.alarmText.textColor = UIColor.black
            }
        }
    }
    
    @objc func flipColor() {
        if self.alarmText.textColor == UIColor.black {
            self.alarmText.textColor = UIColor.white
        } else {
            self.alarmText.textColor = UIColor.black
        }
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
