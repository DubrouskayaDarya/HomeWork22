//
//  ImageViewController.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 28.02.22.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!

    private let imageUrl = ["https://farm2.staticflickr.com/1949/45717354341_a8dc471d63_b.jpg", "https://papik.pro/uploads/posts/2021-09/1631449929_9-papik-pro-p-krasivie-peizazhi-9.jpg", "https://bipbap.ru/wp-content/uploads/2017/09/50dca6763731640fb4fa59a302daf612.jpg", "https://cs9.pikabu.ru/post_img/big/2017/11/08/5/1510122348150469955.jpg", "https://funart.pro/uploads/posts/2021-03/1617048985_26-p-oboi-krasivie-peizazhi-prirodi-28.jpg"]
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        activityIndicator.hidesWhenStopped = true
    }

    private func fetchImage() {
        guard let url = URL(string: imageUrl.randomElement() ?? "Изображений не найдено") else { return }

        let session = URLSession.shared

        activityIndicator.startAnimating()
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()

                if let error = error {
                    let alertVC = UIAlertController(
                        title: "Error",
                        message: "Error connecting to the server",
                        preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                }

                if let response = response {
                    print(response)
                }

                print("\n", data ?? "", "\n")

                if let data = data, let image = UIImage(data: data) {
                    self.imageView.image = image
                } else {
                    let alertVC = UIAlertController(
                        title: "Error",
                        message: "Error connecting to the server",
                        preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
        task.resume()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }

    @objc func updateTimer() {
        fetchImage()
    }
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 3.0,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true)
        }
    }
}
