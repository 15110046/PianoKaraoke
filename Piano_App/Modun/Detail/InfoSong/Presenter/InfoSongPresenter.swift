//
//  InfoSongPresenter.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 2/28/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import Foundation

protocol InfoSongPresenter {
    func present() 
    func getData(completion: @escaping (Result) -> ())
}
class InfoSongPresenterImp: InfoSongPresenter {
    func getData() {
    }
    
    private var interacter: InfoSongInteracter?
    private var router: InfoSongRouter?
    func present() {
       router?.present()
    }
    
    init(interacter: InfoSongInteracter, router: InfoSongRouter) {
        self.interacter = interacter
        self.router = router
    }
     func getData(completion: @escaping (Result) -> ()) {
        interacter?.getData(completion: { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        })
    }
}

