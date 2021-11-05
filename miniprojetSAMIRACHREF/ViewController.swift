//
//  ViewController.swift
//  miniprojetSAMIRACHREF
//
//  Created by Apple Esprit on 4/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    var data = ["samir"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return data.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
           let contentView = cell?.contentView
           
           let label = contentView?.viewWithTag(2) as! UILabel
           let Image = contentView?.viewWithTag(1) as! UIImageView
           
           label.text = data[indexPath.row]
           Image.image = UIImage(named : data[indexPath.row])
           
           return cell!
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = data[indexPath.row]
        performSegue(withIdentifier: "mSegue", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
    }

}

