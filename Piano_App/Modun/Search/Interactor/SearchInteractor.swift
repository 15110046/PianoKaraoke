//
//  SearchInteractor.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/15/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation
protocol SearchInteractor {
    func getNumberOfData() -> Int
    func getNumberOfDataSearched() -> Int
    func getData() -> [ModelSearch]?
    func getDataSearched() -> [ModelSearch]
    func getStaticCo(completion: @escaping (Bool) -> ())
    func textDidChange(searchText: String)
}
class SearchInteractorImp {
    private var dataSearch: [ModelSearch]?
    private var dataSearched = [ModelSearch]()
    private var co = false
    init() {
        ServiceOnline.share.getDataSearch(param: "Search") { [weak self] (data) in
            guard let strongSelf = self
                ,let data = data as? [String: [String: String]]
                else { return }
            strongSelf.dataSearch = data.map{ ModelSearch(data: $0.value) }
            strongSelf.co = true
        }
    }
}
extension SearchInteractorImp: SearchInteractor {
     func getNumberOfDataSearched() -> Int {
        return dataSearched.count
    }
    func textDidChange(searchText: String) {
        if searchText.count == 0 {
            dataSearched = [ModelSearch(data: [:])]
        }
        else {
            dataSearched = dataSearch?.filter({$0.name.prefix(searchText.count) == searchText }) ?? [ModelSearch]()
        }
       
    }
    
    func getDataSearched() -> [ModelSearch] {
        return dataSearched
    }
    
    func getStaticCo(completion: @escaping (Bool) -> ()) {
        completion(co)
    }
    
    func getData() -> [ModelSearch]? {
        return dataSearch
    }
    
    func getNumberOfData() -> Int {
        return dataSearch?.count ?? 0
    }
    
 
    
   
}
