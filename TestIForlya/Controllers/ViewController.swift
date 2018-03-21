//
//  ViewController.swift
//  TestIForlya
//
//  Created by Kostyantyn Runduyev on 3/19/18.
//  Copyright © 2018 Kostyantyn Runduyev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    var сколькоРазНажали = 0
    
    @IBOutlet weak var мояНадпись: UILabel!
    @IBOutlet weak var мояКнопка: UIButton!
    
    @IBAction func моюКнопкуНажали(_ sender: Any) {
        сколькоРазНажали += 1
//        мояНадпись.text = "Кнопку нажали \(сколькоРазНажали)"
//        мояНадпись.text = "Loading..."

//        let url = "http://apilayer.net/api/live?access_key=94b773cf509c9990440ef849b10a0bf5&currencies=EUR,GBP,CAD,PLN&source=USD&format=1"
        let url = "http://apilayer.net/api/live"

        
        let params: Parameters = [
            "access_key":"94b773cf509c9990440ef849b10a0bf5",
            "currencies":"EUR,GBP,CAD,PLN",
            "source":"USD",
            "format":1
        ]

        Alamofire.request(url, method: .get, parameters: params).validate().responseObject
            { (response: DataResponse<CurrencyResponse>) in
            
                switch response.result {
                case .success:
                    if let getServerResponce = response.result.value {
                        print("\(getServerResponce.quotes?.USDEUR ?? 0.0)")
                        self.мояНадпись.text = "\(getServerResponce.quotes?.USDEUR ?? 0.0)"
                    } else {
                        print("Nil?")
                    }
                    
                case .failure(_):
                    print("error")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

