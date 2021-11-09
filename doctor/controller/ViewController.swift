//
//  ViewController.swift
//  doctor
//
//  Created by Med Wajdi BRAHEM on 7/11/2021.
//

import UIKit

class ViewController: UIViewController {

    let parser = Parser()
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse()
        // Do any additional setup after loading the view.
    }


}

