//
//  CommentsTableViewController.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 4.03.22.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    var comments: [Comment] = []

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
//        : UITableViewCell = UITableViewCell(style: UITableViewCell, reuseIdentifier: "commentCell")
        //= tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)

        let comment = comments[indexPath.row]
        cell.textLabel?.text = comment.name
        cell.detailTextLabel?.text = comment.body
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }

    func getComments(pathUrl: String) {

        guard let url = URL(string: pathUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.comments = try JSONDecoder().decode([Comment].self, from: data)
                print(self.comments)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            comments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
