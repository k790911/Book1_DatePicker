//
//  ViewController.swift
//  Book1_DatePicker
//
//  Created by 김재훈 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    //let timeSelector: Selector = #selector(ViewController.updateTime)

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var dp_datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        view.backgroundColor = UIColor.green
        dp_datePicker.backgroundColor = UIColor.red
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a hh:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: sender.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd a hh:mm EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
    
    @IBAction func btnPicker(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "pickerViewCon") as? PickerViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        present(vc, animated: true, completion: nil)
    }
    
    deinit {
        print("View controller is gone.")
    }
}

