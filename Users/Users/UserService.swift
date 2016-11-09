//
//  UserService.swift
//  Users
//
//  Created by HM on 11/8/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import Alamofire
import SwiftyJSON

class UserService: NSObject
{
    func fetchUsers(completion: @escaping ([UserViewModel]?, Error?) -> Void)
    {
            let endPointURL = UsersAPI.Users.url
        
            Alamofire.request(endPointURL)
            .validate()
            .responseJSON { response in
                
                switch response.result
                {
                    case .success(let value):
                        let json = JSON(value)
                        let userModelArray = ResponseParser.parseUsers(json: json)
                        let userViewModelArray = userModelArray.map{ (userModel) -> UserViewModel in
                            
                            let viewModel = UserViewModel(userModel: userModel as UserModel)
                            return viewModel
                        }
                        completion(userViewModelArray, nil)
                    
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
    
    func fetchPosts(userID: Int, completion: @escaping ([PostModel]?, Error?) -> Void)
    {
        let endPointURL = UsersAPI.Posts(userID: userID).url

        Alamofire.request(endPointURL)
            .validate()
            .responseJSON { response in
                
                switch response.result
                {
                    case .success(let value):
                        let json = JSON(value)
                        let postModelArray = ResponseParser.parsePosts(json: json)
                   
                        completion(postModelArray, nil)
                    
                    case .failure(let error):
                        completion(nil, error)
                }
        }
    }
}
