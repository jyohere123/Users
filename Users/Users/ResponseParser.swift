//
//  ResponseParser.swift
//  Users
//
//  Created by HM on 11/8/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import SwiftyJSON

class ResponseParser: NSObject
{
    static func parseUsers(json: JSON) -> [UserModel]
    {
        var array = Array<UserModel>()
        
        for userJson in json.array!
        {
            let userModel = UserModel()
            
            userModel.id = userJson["id"].intValue
            userModel.name = userJson["name"].stringValue
            userModel.userName = userJson["username"].stringValue
            userModel.email = userJson["email"].stringValue
            userModel.street = userJson["address"]["street"].stringValue
            userModel.suite = userJson["address"]["suite"].stringValue
            userModel.city = userJson["address"]["city"].stringValue
            userModel.zipCode = userJson["address"]["zipcode"].stringValue
            
            array.append(userModel)
        }
        
        return array
    }
    
    static func parsePosts(json: JSON) -> [PostModel]
    {
        var array = Array<PostModel>()
        
        for postJson in json.array!
        {
            let postModel = PostModel()
            
            postModel.id = postJson["id"].intValue
            postModel.title = postJson["title"].stringValue
            postModel.body = postJson["body"].stringValue
            
            array.append(postModel)
        }
        
        return array
    }
}
