//
//  NewFriendViewController.swift
//  GithubFriends
//
//  Created by Jonathan Archille on 12/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class NewFriendViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    
    let textField = UITextField(frame: CGRect(x: 8, y: 15, width: 44, height: 44))
        self.view.addSubview(textField)
        
    let searchButton = UIButton(frame: CGRect(x: 8, y: 75, width: 44, height: 44))
        searchButton.addTarget(self, action: #selector(self.searchButtonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(searchButton)
        
    let cancelButton = UIButton(frame: CGRect(x: 8, y: 135, width: 44, height: 44))
        searchButton.addTarget(self, action: #selector(self.cancelButtonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(cancelButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchButtonTapped(_ button: UIButton)
    {
        dismiss(animated: false, completion: nil)
        
    }
    
    func cancelButtonTapped(_ button: UIButton)
    {
        dismiss(animated: false, completion: nil)
    }

}
