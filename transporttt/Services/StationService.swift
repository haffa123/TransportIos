
import Foundation
import Alamofire
import SwiftUI

struct Stationservice {
    
    func fetchStations(completion: @escaping(Result<fetchStationsResponse?, Error>) -> Void) {
        AF.request("\(Network.fetchStationUrl)",
                   method: .get,
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                print(responseData)
                do {
                    let parsedData = try JSONDecoder().decode(fetchStationsResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {
                    print(error)
                    completion(.failure(error))
                }
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(err))
            }
        }
    }
    
}
