//
//  homeViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit
extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
class homeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource , UISearchBarDelegate{
    var userviewmodelm = userVM()
    var questionviewmodel = questionVM()
    @IBOutlet weak var profilpicture: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var data = [Question]()
    var filteredData = [Question]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return filteredData.count//6 elements
       }
       
       
       
       
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           tableView.backgroundColor = UIColor(hex: 0xE6FAF0)
           let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
           let contentView = cell?.contentView
           
           let label = contentView?.viewWithTag(1) as! UILabel
           let text = contentView?.viewWithTag(3) as! UILabel
           let imageView = contentView?.viewWithTag(2) as! UIImageView
           
           imageView.layer.masksToBounds = false
           imageView.layer.borderColor = UIColor.black.cgColor
           imageView.layer.cornerRadius = imageView.frame.height/2
           imageView.clipsToBounds = true
           label.text = data[indexPath.row].subject
           text.text = data[indexPath.row].description
           
           imageView.image = UIImage(named: "profile")
           
           
           
           return cell!
           
       }
       
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if segue.identifier == "newQuestion"{
               let destination = segue.destination as! newquestionViewController
               destination.userviewmodelm = userviewmodelm
           }
       }
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let movie = filteredData[indexPath.row]
           performSegue(withIdentifier: "mSegue", sender: movie)
           
       }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: Question) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.subject!.range(of: searchText, options: .caseInsensitive) != nil
        })

        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profilpicture.layer.borderWidth = 1
        profilpicture.layer.masksToBounds = false
        profilpicture.layer.borderColor = UIColor.black.cgColor
        profilpicture.layer.cornerRadius = profilpicture.frame.height/2
        profilpicture.clipsToBounds = true
        // Do any additional setup after loading the view.
     sleep(1)
        print("///////////////////////")
          print(userviewmodelm.tokenString!)
          profilpicture.image = UIImage(named: (userviewmodelm.userToken?.imageUrl)!)
        
            questionviewmodel.getallquestions()
            sleep(1)
            data = questionviewmodel.listquestion
         filteredData = data
    }
   
    
  
 //action
    
   
    
    @IBAction func addquestion(_ sender: Any) {
        performSegue(withIdentifier: "newQuestion", sender: sender)
    }
    
    
    
}
