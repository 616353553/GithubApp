//
//  RepositoryTVController.swift
//  assignment3
//
//  Created by Ningshuo Bai on 3/12/19.
//  Copyright © 2019 Ningshuo Bai. All rights reserved.
//

import UIKit
import Alamofire

class RepositoryTVController: UITableViewController {

    let username = "616353553"
    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RepositoryTVCell", bundle: nil), forCellReuseIdentifier: "repositoryTVCell")
        tableView.tableFooterView = UIView()
        
        Alamofire.request("https://api.github.com/users/\(username)/repos").responseJSON{ response in
            if let repositoriesData = response.result.value as? NSArray {
                for data in repositoriesData {
                    self.repositories.append(Repository(data: data as! NSDictionary))
                }
                self.tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "Error", message: "Cannot find repository data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryTVCell") as! RepositoryTVCell
        cell.nameLabel.text = repositories[indexPath.row].getName()
        cell.ownerLabel.text = repositories[indexPath.row].getOwner()
        cell.descriptionLabel.text = repositories[indexPath.row].getDescription() == "" ? "No description" : repositories[indexPath.row].getDescription()
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: repositories[indexPath.row].getUrl())!, options: [:], completionHandler: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
