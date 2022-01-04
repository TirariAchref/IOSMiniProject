//
//  userviewmodel.swift
//  doctor
//
//  Created by achref on 19/11/2021.
//

import Foundation
import Alamofire
class eventVM {
    func getOwnerToy(successHandler: @escaping (_ anomalyList: [Event] ) -> (),errorHandler: @escaping () -> ())
        {
            let url = "http://localhost:3000/allevent"
            print("getOwnerToy : "+url)
            
            AF.request(url, method: .get).validate().responseDecodable(of:  [Event].self, decoder: JSONDecoder()) { apiResponse in
                guard apiResponse.response != nil else{
                    errorHandler()
                    return
                }
                
                switch apiResponse.response?.statusCode {
                    
                    case 200:
                    successHandler(try! apiResponse.result.get())

                    
                    case 500:
                    errorHandler()
               
                default:
                  errorHandler()
                    
                }
                
            }
            
        }

    func getallevents()  {
       
        
        let jsonUrlString = "http://localhost:3000/allevent"
            guard let url = URL(string: jsonUrlString) else
            { return }

            URLSession.shared.dataTask(with: url) { (data, response, err) in

                guard let data =  data else{ return }

                do {

                    let events = try JSONDecoder().decode([Event].self, from: data)
                 
                    events.forEach { event in print(event.name!) }
                    
         
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                }

            }.resume()
    }
    
    
   
    func createevent(){
            var request = URLRequest(url: URL(string: "http://localhost:3000/createevent")!)
            request.httpMethod = "post"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            print("its working")
            let postString =
          "name=Create&" +
          "description=Create&" +
          "money=String&" +
          "moneyreached=String&"
       
           
         
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error?.localizedDescription))")
                    return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")

                if(responseString?.contains("true"))!{
                    print("status = true")
                }
                else{
                    print("Status = false")
                }
            }

            task.resume()
        }
    
    
    func updateevent(e : Event , money : String){
        var request = URLRequest(url: URL(string: "http://localhost:3000/updateevent/"+(e._id)!)!)
             request.httpMethod = "put"
             request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
             print("its working")
        let postString = "name="+(e.name)!+"&"+"description="+(e.description)!+"&"+"money="+(e.money)!+"&"+"moneyreached="+money+"&"
       
        
             request.httpBody = postString.data(using: .utf8)
             let task = URLSession.shared.dataTask(with: request) { data, response, error in
                 guard let data = data, error == nil else {                                                 // check for fundamental networking error
                     print("error=\(String(describing: error?.localizedDescription))")
                     return
                 }

                 if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                     print("statusCode should be 200, but is \(httpStatus.statusCode)")
                     print("response = \(String(describing: response))")
                 }

                 let responseString = String(data: data, encoding: .utf8)
                 print("responseString = \(String(describing: responseString))")

                 if(responseString?.contains("true"))!{
                     print("status = true")
                 }
                 else{
                     print("Status = false")
                 }
             }

             task.resume()
         }
    
    func deleteevent(){
        var request = URLRequest(url: URL(string: "http://localhost:3000/deleteevent/6199846c612d99bb5c619929")!)
            request.httpMethod = "delete"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            print("its working")
        let postString =
      "name=Create&" +
      "description=Create&" +
      "money=String&" +
      "moneyreached=String&"
             
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error?.localizedDescription))")
                    return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")

                if(responseString?.contains("true"))!{
                    print("status = true")
                }
                else{
                    print("Status = false")
                }
            }

            task.resume()
        }
}
