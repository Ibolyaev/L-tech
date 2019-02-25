import Foundation
import Alamofire

protocol ListRequestFactory {
    func getList(
        completionHandler: @escaping (DataResponse<ListResult>) -> Void)
}
