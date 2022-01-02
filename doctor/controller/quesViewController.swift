//
//  quesViewController.swift
//  doctor
//
//  Created by User on 01.01.2022.
//

import UIKit
import Cosmos
import TinyConstraints
class quesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var userviewmodelm = userVM()
    var question : Question?
   
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
           label.text = filteredData[indexPath.row].subject
           text.text = filteredData[indexPath.row].description
           
           imageView.image = UIImage(named: "profile")
           
           
           
           return cell!
           
       }
       
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
       }
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
           
       }

    @IBOutlet weak var reponse: UIButton!
    lazy var cosmosView : CosmosView = {
            var view = CosmosView()
            //maadch aandk l hak t modifi
            //view.settings.updateOnTouch = false
            view.settings.fillMode = .half
            view.settings.starMargin = 4
            return view
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData.append(question!)
        view.addSubview(cosmosView)
        cosmosView.topToSuperview()
        
                cosmosView.didTouchCosmos = {rating in
                    print("Rated: \(rating)")}
    }
    

   
    @IBAction func reponsebutton(_ sender: Any) {
    }
    
}
