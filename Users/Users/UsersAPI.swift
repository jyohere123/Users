//
//  UsersAPI.swift
//  Users
//
//  Created by HM on 11/9/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import UIKit

enum UsersAPI
{
    case Users
    case Posts(userID : Int)
}

extension UsersAPI
{
    private var baseURL : String
    {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    private var path: String?
    {
        switch self
        {
            case .Users:
                return "users"
            case .Posts:
                return "posts"
        }
    }
    
    private var parameters: [String: String]?
    {
        switch self
        {
            case .Users:
                return nil
            case let .Posts(userID):
                return ["userId": "\(userID)"]
        }
    }
    
    var url : String
    {
         var url = baseURL
        
         if let path = self.path
         {
            url = url + path
         }
        
        if let parameters = self.parameters
        {
            url = url + "?"
            for parameter in parameters
            {
                url.append("\(parameter.key)=\(parameter.value)&")
            }
        }
        print(url)
        return url
    }
}
