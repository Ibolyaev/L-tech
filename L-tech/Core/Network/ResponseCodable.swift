import Alamofire

extension DataRequest {
    @discardableResult
    func responseCodable<T: Decodable>(
        errorParser: AbstractErrorParser,
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<T>) -> Void)
        -> Self {
            let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
                if let error = errorParser.parse(response: response, data: data, error: error) {
                    return .failure(error)
                }                
                let result = Request.serializeResponseData(response: response, data: data, error: nil)
                switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = Api.dateFormat
                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        let value = try decoder.decode(T.self, from: data)
                        return .success(value)
                    } catch {
                        let customError = errorParser.parse(error)
                        return .failure(customError)
                    }
                case .failure(let error):
                    let customError = errorParser.parse(error)
                    return .failure(customError)
                }
            }
            return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
