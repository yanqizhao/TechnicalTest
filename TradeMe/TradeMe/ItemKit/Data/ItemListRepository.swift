//
//  ItemListRepository.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation
import Alamofire

final class ItemListRepository {
    
    func getItemList(onCompletion: @escaping (Result<[DLItem], Error>) -> Void) {
        if let cachedList = ItemListCacheService().getItemList() {
            onCompletion(.success(cachedList))
            return
        }
        getFromExternalService(onCompletion: onCompletion)
    }
    
    private func getFromExternalService(onCompletion: @escaping (Result<[DLItem], Error>) -> Void) {
        AF.request("https://api.tmsandbox.co.nz/v1/listings/latest.json", parameters: ["rows": "20"], headers: [
            HTTPHeader(name: "Authorization", value: "OAuth oauth_consumer_key=A1AC63F0332A131A78FAC304D007E7D1, oauth_signature_method=PLAINTEXT, oauth_signature=EC7F18B17A062962C6930A8AE88B16C7&"),
            HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")])
            .responseDecodable(of: DLResponse.self) { response in
                switch response.result {
                case .success(let result):
                    ItemListCacheService().save(list: result.List)
                    onCompletion(.success(result.List))
                case .failure(let error):
                    onCompletion(.failure(error))
                }
            }
    }
    
}
