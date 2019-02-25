import Alamofire

class Auth: BasicFactory {
}

extension Auth: AuthRequestFactory {
    
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        
        let requestModel = Login(baseUrl: configuration.baseUrl, login: userName, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}

// Login
extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = Api.login
        
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "phone": login,
                "password": password
            ]
        }
    }
}
