//
//  ViewController.swift
//  KVO
//
//  Created by Kim Nghĩa on 30/08/2022.
//

import UIKit

class Bank: NSObject {
    var customerName: String
    @objc dynamic var phoneNumber: String
    init(customerName: String, phoneNumber: String) {
        self.customerName = customerName
        self.phoneNumber = phoneNumber
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let obj = Bank(customerName: "abc", phoneNumber: "12345")
        print(obj.phoneNumber)
        obj.phoneNumber = "000"
        
        //KVC
        let phone = obj.value(forKey: "phoneNumber")
        print(phone ?? "")
        //KVO
        let observer = obj.observe(\.phoneNumber, options: [.new,.old]) {
            (Bank, value) in
            print("----------")
            print(value.oldValue as Any)
            print(value.newValue as Any)
            print("----------")
        }
        print(observer)
        obj.phoneNumber = "789"
    }
}


