import Foundation

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequest(userName: String) -> URLRequest {
        let url = URL(string: "http://3.39.54.196:8080/api/v1/members/check?username=\(userName)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func PostRegisterData(userName: String) async throws -> CheckExistRequestBody? {
        do {
            let request = self.makeRequest(userName: userName)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }
    }
    
    
    private func parseUserInfoData(data: Data) -> CheckExistRequestBody? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CheckExistRequestBody.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }

    
    
    
    func makeRequestBody(userName: String,
                         password: String,
                         nickName: String) -> Data? {
        do {
            let data = RegisterRequestBody(username: userName,
                                           password: password,
                                           nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func PostRegisterData(userName: String,
                          password: String,
                          nickName: String) async throws -> Int {
        do {
            guard let body = makeRequestBody(userName: userName,
                                             password: password,
                                             nickName: nickName)
            else { throw NetworkError.requstEncodingError }
            
            let request = self.makeRequest(body: body)
            let (_, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return httpResponse.statusCode
        } catch {
            throw error
        }
        
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
