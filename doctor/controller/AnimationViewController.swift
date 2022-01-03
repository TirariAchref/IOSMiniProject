//
//  AnimationViewController.swift
//  doctor
//
//  Created by samir on 03/01/2022.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {


    @IBOutlet weak var animation: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

        lottileAnimation()
        // Do any additional setup after loading the view.
    }
    

    func lottileAnimation()
        {
            let animationview = AnimationView(name: "24867-online-doctor-app")
            
            animationview.frame = CGRect(x: 0, y: 0, width: 400, height: 700)
            animationview.center = self.view.center
            animationview.contentMode = .scaleAspectFit
            view.addSubview(animationview)
            animationview.play()
            animationview.loopMode = .loop
            
            
        }
}
