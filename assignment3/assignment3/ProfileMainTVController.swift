//
//  ProfileMainTVController.swift
//  assignment3
//
//  Created by Ningshuo Bai on 3/11/19.
//  Copyright © 2019 Ningshuo Bai. All rights reserved.
//

import UIKit
import Alamofire

class ProfileMainTVController: UITableViewController {
    
    @IBOutlet weak var avatarBackgroudImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var repoCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    let username = "616353553"
//    let username = "applre"
    var profile: Profile!
    var indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
//        tableView.allowsSelection = false
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        view.isUserInteractionEnabled = false
        indicator.startAnimating()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        Alamofire.request("https://api.github.com/users/\(username)").responseJSON{ response in
            self.indicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            if let responseCode = response.response?.statusCode {
                if responseCode == 200 {
                    self.profile = Profile(data: response.result.value as! NSDictionary)
                    let url = URL(string: self.profile.getAvatarURL())
                    let data = try? Data(contentsOf: url!)
                    self.avatarBackgroudImage.image = UIImage(data: data!)
                    self.avatarImage.image = UIImage(data: data!)
                    self.avatarImage.layer.borderWidth = 1
                    self.avatarImage.layer.borderColor = UIColor.white.cgColor
                    self.avatarImage.layer.masksToBounds = false
                    self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height/2
                    self.avatarImage.clipsToBounds = true
                    self.nameLabel.text = self.profile.getName()
                    self.nameLabel.textColor = UIColor.white
                    self.usernameLabel.text = self.profile.getUsername()
                    self.usernameLabel.textColor = UIColor.white
                    self.bioLabel.text = self.profile.getBio() ?? "No Bio"
                    self.blogLabel.text = self.profile.getBlog() != "" ? self.profile.getBlog() : "No Blog"
                    self.emailLabel.text = self.profile.getEmail() ?? "No Email"
                    self.repoCountLabel.text = String(self.profile.getPublicRepoCount())
                    self.followerCountLabel.text = String(self.profile.getFollowerCount())
                    self.followingCountLabel.text = String(self.profile.getFollowingCount())
                    self.createdDateLabel.text = self.profile.getCreatedDateString()
                } else {
                    let alert = UIAlertController(title: "Error", message: "Code \(responseCode)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "Cannot find user data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 4:
            print(indexPath)
            self.tabBarController?.selectedIndex = 1
        case 5:
            self.tabBarController?.selectedIndex = 2
        case 6:
            self.tabBarController?.selectedIndex = 3
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
