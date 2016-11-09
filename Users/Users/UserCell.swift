//
//  UserCell.swift
//  Users
//
//  Created by HM on 11/8/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
   
    var userViewModel : UserViewModel?
    {
        didSet
        {
            self.nameLabel.text = userViewModel?.name
            self.userNameLabel.text = userViewModel?.userName
            self.emailLabel.text = userViewModel?.email
            self.addressLabel.text = userViewModel?.address
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        self.containerView.layer.shadowOpacity = 0.2
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    
}
