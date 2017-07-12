//
//  ProductSearchService.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 11/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class ProductSearchService: WebServicesBase {
    
    func searchProductsWith(params:[String:String],completionHandler: @escaping(_ response:[String:Any]?, _ error: Error?) -> Swift.Void) {
        let query = kSearchPath + self.queryString(params: params)
        let urlString = (kBaseURL + query).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        debugPrint(urlString!)
        let url = URL(string: urlString!)
        let request = NSMutableURLRequest(url: url!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = kHTTPGETMethod
        let dataTask = self.session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if data != nil {
                do {
                    let text = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    debugPrint(text as Any)
                } catch {
                    
                }
            }
            if (error != nil) {
                debugPrint(error as Any)
                completionHandler(nil,error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                debugPrint(httpResponse as Any)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    completionHandler(json as? [String:Any], nil)
                } catch {
                    debugPrint(error)
                }
            }
        })
        
        dataTask.resume()
    }
    
    func queryString(params:[String:String]) -> String {
        var query = ""
        var isFirst = true
        for (key,value) in params {
            if isFirst {
                query += "?"
                isFirst = false
            } else {
                query += "&"
            }
            query += key + "=" + value
        }
        return query
    }
}
