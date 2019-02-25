import Foundation
import Alamofire

protocol PhoneMaskRequestFactory {
    func getMask(
        completionHandler: @escaping (DataResponse<PhoneMask>) -> Void)
}
