//
//  CommentService.swift
//  Careerly
//
//  Created by User on 2022/05/31.
//

import Foundation
import Alamofire

struct CommentService {
    
    static let shared = CommentService()
    
    private init() {}
    
    func postComment(postId: String, contents: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        let url = APIConstants.postCommentURL + "/\(postId)"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "text": contents
        ]
        
        let dataReqeust = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataReqeust.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = parseJSON(by: statusCode, data: value, type: PostCommentModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func parseJSON<T: Codable> (by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(BaseResponse<T>.self, from: data) else { return .pathErr("Decoding failed") }
        
        switch statusCode {
        case 200..<300: return .success(decodedData)
        case 400..<500: return .requestErr(decodedData)
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
}
