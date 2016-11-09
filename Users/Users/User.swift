//
//  User.swift
//  Users
//
//  Created by HM on 11/8/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import Foundation

class UserModel: NSObject
{
    var id : Int?
    var name : String?
    var userName : String?
    var email : String?
    var street : String?
    var suite : String?
    var city : String?
    var zipCode : String?
}

class UserViewModel : NSObject
{
    var id : Int
    var name : String
    var userName : String
    var email : String
    var address : String

    init(userModel : UserModel)
    {
        self.id = userModel.id!
        self.name = "Name : \(userModel.name!)"
        self.userName = "User Name : \(userModel.userName!)"
        self.email = "Email : \(userModel.email!)"
        self.address = "Address : \(userModel.street!), \(userModel.suite!), \(userModel.city!), \(userModel.zipCode!) "
    }
}




