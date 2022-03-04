//
//  UserCell.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 4.03.22.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    func configure(with user: User) {
        nameLabel.text = user.name
        usernameLabel.text = user.username
    }
}
