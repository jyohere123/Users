//
//  PostListViewController.swift
//  Users
//
//  Created by HM on 11/9/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import UIKit

private let kPostCellIdentifier = "PostCell"

class PostListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    private var userService : UserService?
    private var posts : [PostModel]?
    
    var userID : Int?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Posts"
        self.activityIndicator.startAnimating()

        userService = UserService()
        fetchPosts()
        configureTableView()
    }
    
    private func fetchPosts()
    {
        userService?.fetchPosts(userID: self.userID!, completion: { (postModelArray, error) in
            
            if let posts = postModelArray
            {
                self.posts = posts
                self.tableView.isHidden = false
                self.emptyLabel.isHidden = true
                self.tableView.reloadData()
            }
            else
            {
                self.tableView.isHidden = true
                self.emptyLabel.isHidden = false
                self.emptyLabel.text = error?.localizedDescription
                print(error?.localizedDescription) //Need to display Alert
            }
            self.activityIndicator.stopAnimating()
        })
    }
    
    private func configureTableView()
    {
        let nibName = UINib(nibName: kPostCellIdentifier, bundle:nil)
        self.tableView.register(nibName, forCellReuseIdentifier: kPostCellIdentifier)
        
        self.tableView.estimatedRowHeight = 140;
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPostCellIdentifier, for: indexPath) as! PostCell
        cell.postModel = self.posts?[indexPath.row]
        
        return cell
    }


}
