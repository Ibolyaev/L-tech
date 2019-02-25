import Alamofire

// Собирает все используемые фабрики запросов

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        let manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    func makeListRequestFactory() -> ListRequestFactory {
        let errorParser = makeErrorParser()
        return ListRequestFactoryDefault(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
    func makePhoneMaskRequestFactory() -> PhoneMaskRequestFactory {
        let errorParser = makeErrorParser()
        return PhoneMaskRequestDefault(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
        )
    }
}
