import Foundation
import Alamofire

class PhoneMaskRequestDefault: BasicFactory {
}

extension PhoneMaskRequestDefault: PhoneMaskRequestFactory {    
    func getMask(
    completionHandler: @escaping (DataResponse<PhoneMask>) -> Void) {
        let requestModel = PhoneMaskRequest(baseUrl: configuration.baseUrl, parameters: nil)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
extension PhoneMaskRequestDefault {
    struct PhoneMaskRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.phoneMasks
        var parameters: Parameters?
    }
}
