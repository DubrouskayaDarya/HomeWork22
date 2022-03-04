//
//  AddPostViewController.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 4.03.22.
//

import UIKit


class AddPostViewController: UIViewController {

    @IBOutlet weak var titlePostTextField: UITextField!
    @IBOutlet weak var textPostTextView: UITextView!
    @IBOutlet weak var addPostButton: UIButton!

    var user: User!

    @IBAction func addPostTouchUpInside(_ sender: Any) {
        if let userId = user.id,
            let title = titlePostTextField.text,
            let text = textPostTextView.text,
            let url = ApiConstants.postsPathURL
        {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let post: [String: Any] = ["userId": userId,
                "title": title,
                "body": text]

            guard let httpBody = try? JSONSerialization.data(withJSONObject: post, options: []) else { return }
            request.httpBody = httpBody

            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                print(response ?? "")
                if let data = data {
//                    print(JSON(data))
                    DispatchQueue.main.async {
                        self?.navigationController?.popViewController(animated: true)
                    }
                } else if let error = error {
                    print(error)
                }
            }.resume()
        }
    }

}
