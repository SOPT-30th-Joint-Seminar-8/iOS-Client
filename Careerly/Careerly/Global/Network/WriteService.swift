//
//  WriteService.swift
//  Careerly
//
//  Created by 안현주 on 2022/06/03.
//

import Foundation
import Alamofire

/// 게시글 작성하기 Service
struct WriteService {
  static let shared = WriteService()
  
  func postWrite(text: String,completion: @escaping(NetworkResult<Any>) -> Void) {
    
    let url = APIConstants.postWriteURL
    
    let header: HTTPHeaders = ["Content-Type" : "application/json"]
    
    let body: Parameters = [
      "text" : text
    ]
    
    let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
    
    dataRequest.responseData { response in
      switch response.result {
      case .success:
        guard let statusCode = response.response?.statusCode else { return }
        guard let value = response.value else { return }
        let networkResult = parseJSON(by: statusCode, data: value, type: WriteModel.self)
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
