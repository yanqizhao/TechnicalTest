//
//  ItemListCacheService.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation
import Cache

final class ItemListCacheService {
    
    let key = String(describing: ItemListCacheService.self)
    let storage: Storage<String, [DLItem]>? = try? Storage<String, [DLItem]>.init(diskConfig: DiskConfig(name: "item"),
                                                                                  memoryConfig: MemoryConfig(),
                                                                                  transformer: TransformerFactory.forCodable(ofType: [DLItem].self))
    
    func getItemList() -> [DLItem]? {
       try? storage?.object(forKey: key)
    }
    
    func save(list: [DLItem]) {
       try? storage?.setObject(list, forKey: key)
    }
    
}
