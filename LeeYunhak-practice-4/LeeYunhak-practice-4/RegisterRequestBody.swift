import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}

struct CheckExistRequestBody: Codable {
    let isExist: Bool
}
