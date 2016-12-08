//
//  APIController.swift
//  GithubFriends
//
//  Created by Jonathan Archille on 12/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

protocol APIControllerProtocol
{
    func didReceiveAPIResults(_ results: [Any])
}

class APIController
{
    
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func searchGithubFor(_ searchTerm: String)
    {
        let githubusername = searchTerm.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.caseInsensitive, range: nil)
        
        if let escapedSearchTerm = githubusername.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
        {
            let urlPath = "https://api.github.com/users/\(escapedSearchTerm)"
            let url = URL(string: urlPath)
            let session = URLSession.shared
            let task = session.dataTask(with: url!, completionHandler: {data, response, error -> Void in
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                if let dictionary = self.parseJSON(data!)
                {
                    if let results = dictionary["id"] as? [Any]
                    {
                        self.delegate.didReceiveAPIResults(results)
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [String: Any]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any]
            {
                return dictionary
            }
            else
            {
                return nil
            }
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}
