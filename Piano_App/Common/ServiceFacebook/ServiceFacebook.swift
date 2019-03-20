//
//  ServiceFacebook.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/20/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import FBSDKLoginKit

class ServiceFacebook {
    static var share = ServiceFacebook()
    func loginFB(graphPath: String, parameters: Dictionary<String, Any>, httpMethod: HttpMethod.RawValue ,comletion: @escaping (_ data: Any?) -> ()) {
        let request: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: graphPath, parameters: parameters, httpMethod: httpMethod)
        request.start(completionHandler: { (connection, data, err) in
//            guard let dataExport = data as? Dictionary<String, Any> else {
//                return
//            }
//            let result = AccountUserModel(data: dataExport)
//            print(result)
//            print(data)
            guard let data = data else {
                DispatchQueue.main.async {
                    comletion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                comletion(data)
            }
            
        })
    }
}
enum HttpMethod: String {
    case GET = "GET"
    case POST = "POST"
    var result: String {
        return self.rawValue
    }
}
