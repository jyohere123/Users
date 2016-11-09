//
//  UserListViewController.swift
//  Users
//
//  Created by HM on 11/8/16.
//  Copyright © 2016 MyLabSolutions. All rights reserved.
//

import UIKit

private let kUserCellIdentifier = "UserCell"

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    private var userService : UserService?
    private var userViewModelItems : [UserViewModel]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Users"
        self.acitivityIndicator.startAnimating()
        
        userService = UserService()
        fetchUsers()
        configureTableView()
    }
    
    private func fetchUsers()
    {
        userService?.fetchUsers(completion: { (userViewModelArray, error) in
            
            if let users = userViewModelArray
            {
                self.userViewModelItems = users
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
            self.acitivityIndicator.stopAnimating()
        })
    }
    
    private func configureTableView()
    {
        let nibName = UINib(nibName: kUserCellIdentifier, bundle:nil)
        self.tableView.register(nibName, forCellReuseIdentifier: kUserCellIdentifier)
        
        self.tableView.estimatedRowHeight = 180;
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.userViewModelItems?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: kUserCellIdentifier, for: indexPath) as! UserCell
        cell.userViewModel = self.userViewModelItems?[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let controller = (self.storyboard?.instantiateViewController(withIdentifier: "PostListViewController"))! as! PostListViewController
        controller.userID = self.userViewModelItems?[indexPath.row].id
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
