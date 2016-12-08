//
//  Friend.swift
//  GithubFriends
//
//  Created by Jonathan Archille on 12/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

struct Friend
{
    let name: String
    
    init(name: String)
    {
        self.name = name
    }
    
    static func friendsWithJSON(_ results: [Any]) -> [Friend]
    {
        var friends = [Friend]()
        {
            if results.count > 0
            {
                for result in results
                {
                    if let dictionary = result as? [String: Any]
                    {
                        let name = dictionary["name"] as? String ?? ""
                    }
                    friends.append(Friend(name: name)
                }
            }
        }
        return friends
    }
}
