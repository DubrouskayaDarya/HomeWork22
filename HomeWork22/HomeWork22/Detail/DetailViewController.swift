//
//  DetailViewController.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 4.03.22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyBsLabel: UILabel!
    @IBOutlet weak var companyCatchPhraseLabel: UILabel!

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWithData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPosts",
            let postsVC = segue.destination as? PostsTableViewController {
            postsVC.user = user
        }
    }

    private func setupUIWithData() {
        nameLabel.text = user?.name
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        websiteLabel.text = user?.website
        streetLabel.text = user?.address?.street
        suiteLabel.text = user?.address?.suite
        cityLabel.text = user?.address?.city
        zipcodeLabel.text = user?.address?.zipcode
        companyNameLabel.text = user?.company?.name
        companyBsLabel.text = user?.company?.bs
        companyCatchPhraseLabel.text = user?.company?.catchPhrase
    }
}
