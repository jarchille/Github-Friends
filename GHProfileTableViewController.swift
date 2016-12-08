//
//  GHProfileTableViewController.swift
//  GithubFriends
//
//  Created by Jonathan Archille on 12/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class GHProfileTableViewController: UITableViewController, APIControllerProtocol
{

    var api = APIController!
    var friends = [Friend]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        api = APIController(delegate: self)
        api.searchGithubFor("jcgohlke")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        title = "Friends"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        
        return cell
    }
    
    func didReceiveAPIResults(_ results: [Any])
    {
        let queue = DispatchQueue.main
        queue.async {
            self.friends = Friend.friendsWithJSON(results)
            self.tableView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
}
