import Foundation
import Alamofire

class SignUpViewModel {
    let url = APIConstants.signUpURL
    func fetch(id: String, password: String) {
        let url = url
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // parameter
        let params = ["email": id, "password": password] as Dictionary

        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            
            print(response.response?.statusCode)
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("error: \(error.errorDescription!)")
            }
        }
    }
}
