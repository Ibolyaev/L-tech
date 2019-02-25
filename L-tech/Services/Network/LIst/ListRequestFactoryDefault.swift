import Foundation
import Alamofire

class ListRequestFactoryDefault: BasicFactory {
}

extension ListRequestFactoryDefault: ListRequestFactory {
    
    func getList(completionHandler: @escaping (DataResponse<ListResult>) -> Void) {
        let requestModel = ListRequest(baseUrl: configuration.baseUrl, parameters: nil)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
extension ListRequestFactoryDefault {
    struct ListRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = Api.list
        var parameters: Parameters?
    }
}
