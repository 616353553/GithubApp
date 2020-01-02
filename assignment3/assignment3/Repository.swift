//
//  Repository.swift
//  assignment3
//
//  Created by Ningshuo Bai on 3/12/19.
//  Copyright © 2019 Ningshuo Bai. All rights reserved.
//

import Foundation

class Repository {
    private var name: String
    private var owner: String
    private var description: String
    private var url: String
    
    init(data: NSDictionary) {
        self.name = data["name"] as! String
        if let ownerData = data["owner"] as? NSDictionary {
            self.owner = ownerData["login"] as! String
        } else {
            owner = ""
        }
        self.url = data["html_url"] as! String
        if let description = data["description"] as? String {
            self.description = description
        } else {
            self.description = ""
        }
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getOwner() -> String {
        return self.owner
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func getUrl() -> String {
        return self.url
    }
}
