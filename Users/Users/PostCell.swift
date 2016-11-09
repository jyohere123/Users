//
//  PostCell.swift
//  Users
//
//  Created by HM on 11/9/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var postModel : PostModel?
    {
        didSet
        {
            self.titleLabel.text = postModel?.title
            self.bodyLabel.text = postModel?.body
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        self.containerView.layer.shadowOpacity = 0.2
    }
}
