//
//  listreponseViewController.swift
//  doctor
//
//  Created by User on 03.01.2022.
//

import UIKit

class listreponseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
//var
    var userviewmodelm = userVM()
    var reponseviewmodel = reponseVM()
    var question : Question?
    var filteredData = [Reponse]()
    var listuser = [User]()
    //outlet
    @IBOutlet weak var listrepondre: UITableView!
    
    //list
    
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
           label.text = listuser[indexPath.row].nom
           text.text = filteredData[indexPath.row].description
           
           imageView.image = UIImage(named: "profile")
           
           
           
           return cell!
           
       }
       
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
       }
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
           return
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        reponseviewmodel.getallreponses(idQuestion: (question?._id)!)
        
        usleep(500000)
        filteredData = reponseviewmodel.AllReponse
        filteredData.reverse()
    
        for user in filteredData{
            userviewmodelm.getbyId(id: user.idUser!)
            usleep(500000)
            listuser.append((userviewmodelm.userByid)!)
        }
       
        
    }
    

    //func
    
    @IBAction func repondre(_ sender: Any) {
    }
    
}
