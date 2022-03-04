//
//  UsersTableViewController.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 4.03.22.
//

import UIKit

class UsersTableViewController: UITableViewController {

    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let user = sender as? User {
            destination.user = user
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: "ShowDetail", sender: user)
    }

    func fetchData () {
        guard let url = ApiConstants.remoteUsersUrl else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
                print(self.users)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
