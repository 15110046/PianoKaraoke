//
//  ServiceFacebook.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/20/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import FBSDKLoginKit
import UIKit
enum LoginResulFb {
    case error(message: String)
    case success(data: FBSDKLoginManagerLoginResult)
}
class ServiceFacebook {
    static var share = ServiceFacebook()
    private let login = FBSDKLoginManager()
    private let currentAccessToken = FBSDKAccessToken.current
    func loginIn(withReadPermissions: [Any],from: UIViewController, completion: @escaping (LoginResulFb)->()) {
        if currentAccessToken()?.appID != FBSDKSettings.appID() {
            ServiceFacebook.share.login.logOut()
        }
        login.logIn(withReadPermissions: withReadPermissions, from: from) { (result, error) in
            if let result = result {
                completion(LoginResulFb.success(data: result))
            }
            else {
                completion(LoginResulFb.error(message: error?.localizedDescription ?? ""))
            }
        }
    }
    func logOut() {
        login.logOut()
    }
    func dataUserFromFB(graphPath: String, parameters: Dictionary<String, Any>, httpMethod: HttpMethod.RawValue ,comletion: @escaping (_ data: Any?) -> ()) {
        let request: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: graphPath, parameters: parameters, httpMethod: httpMethod)
        request.start(completionHandler: { (connection, data, err) in
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
