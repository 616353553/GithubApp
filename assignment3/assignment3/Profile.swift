//
//  Profile.swift
//  assignment3
//
//  Created by Ningshuo Bai on 3/11/19.
//  Copyright © 2019 Ningshuo Bai. All rights reserved.
//

import Foundation

class Profile {
    private var avatarURL: String
    private var name: String
    private var username: String
    private var bio: String?
    private var blog: String?
    private var email: String?
    private var publicRepoCount: Int
    private var publicRepoURL: String
    private var followerCount: Int
    private var followerURL: String
    private var followingCount: Int
    private var followingURL: String
    private var createdDate: Date
    
    init(data: NSDictionary) {
        self.avatarURL = data["avatar_url"] as! String
        self.name = data["name"] as! String
        self.username = data["login"] as! String
        if let bio = data["bio"] as? String {
            self.bio = bio
        }
        if let blog = data["blog"] as? String {
            self.blog = blog
        }
        if let email = data["email"] as? String {
            self.email = email
        }
        self.publicRepoCount = data["public_repos"] as! Int
        self.publicRepoURL = data["repos_url"] as! String
        self.followerCount = data["followers"] as! Int
        self.followerURL = data["followers_url"] as! String
        self.followingCount = data["following"] as! Int
        self.followingURL = data["following_url"] as! String
        // parse date string to date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        self.createdDate = dateFormatter.date(from:data["created_at"] as! String)!
    }
    
    public func getAvatarURL() -> String {
        return self.avatarURL
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getUsername() -> String {
        return self.username
    }
    
    public func getBio() -> String? {
        return self.bio
    }
    
    public func getBlog() -> String? {
        return self.blog
    }
    
    public func getEmail() -> String? {
        return self.email
    }
    
    public func getPublicRepoCount() -> Int {
        return self.publicRepoCount
    }
    
    public func getPublicRepoURL() -> String {
        return self.publicRepoURL
    }
    
    public func getFollowerCount() -> Int {
        return self.followerCount
    }
    
    public func getFollowerURL() -> String {
        return self.followerURL
    }
    
    public func getFollowingCount() -> Int {
        return self.followingCount
    }
    
    public func getFollowingURL() -> String {
        return self.followingURL
    }
    
    public func getCreatedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self.createdDate)
    }
}
