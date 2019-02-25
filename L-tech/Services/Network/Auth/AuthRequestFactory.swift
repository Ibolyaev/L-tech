import Alamofire

protocol AuthRequestFactory { 
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
}
