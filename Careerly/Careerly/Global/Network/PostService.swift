//
//  PostService.swift
//  Careerly
//
//  Created by 안현주 on 2022/05/21.
//


import Foundation
import Alamofire

/// 게시글 정보를 가져오기 위한 Service
struct PostService {
    static let shared = PostService()
    
    private init() {}
    
    // 게시글 전체 정보 가져오기
    func getPosts(completion: @escaping(NetworkResult<Any>) -> Void) {
        let url = APIConstants.getPostsURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url, method: .get, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = parseJSON(by: statusCode, data: value, type: PostData.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    func parseJSON<T: Codable> (by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
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
