//
//  ViewController.swift
//  iWeather
//
//  Created by techmaster on 5/16/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_note: UILabel!
    
    @IBOutlet weak var lbl_temp: UILabel!
    
    @IBOutlet weak var lbl_do: UILabel!
    @IBOutlet weak var blackgroupView: UIImageView!
    
  
    
    var notes = ["Một con ngựa đau, cả tàu bỏ cỏ.","Uống nước nhớ nguồn.","Ăn quả nhớ kẻ trồng cây.","Đi học ngày đàng, học một sàng khôn.","Đi học ngày đàng học một sàng khôn","Công cha như núi Thái Sơn - Nghĩa mẹ như nước trong nguồn chảy ra"]
    var city = ["Hà Nội","Sài Gòn","Đà Nẵng","Hải Phòng","Cần Thơ","Quảng Ninh","Vinh","Nam Định"]
    var blacgroupImage = ["Blood","Moon","Sun"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func acc_change(_ sender: Any) {
        Random()
    }

   
   
    @IBAction func acc_random(_ sender: Any) {        // random thanh pho
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_city.text = city[cityIndex]
        let noteIndex = Int(arc4random_uniform(UInt32(notes.count)))
        lbl_note.text = notes[noteIndex]
        let imageIndex = Int(arc4random_uniform(UInt32(blacgroupImage.count)))
        blackgroupView.image = UIImage.init(named:blacgroupImage[imageIndex])
        getdoC()
    }
    func getdoC() -> Void {
        let randomtemp = String(format: "%2.1f",randomdoC())    //nhiet do
        lbl_temp.text = randomtemp
        
    }
    
    func randomdoC() -> Double {      //random nhiet do
        if lbl_do.text == "C" {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }else {
            return  (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 9/5 + 32
        }
    }
    func Random()  {
        var CdoF:Double = 0
        var FdoC:Double = 0
        
            if (lbl_do.text == String("C")) {
                CdoF = Double(lbl_temp.text!)! * 9/5 + 32
                lbl_temp.text = String(format: "%2.1f", CdoF)
                lbl_do.text = String("F")
            }else  {
                FdoC = (Double(lbl_temp.text!)! - 32) * 5/9
                lbl_temp.text = String(format: "%2.1f", FdoC)
                lbl_do.text = String("C")
            }
            
            
        
        }
}
    


