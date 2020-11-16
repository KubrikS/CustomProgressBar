//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by Stanislav on 16.11.2020.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var circularView = CircularProgressView()
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func downloadButton(_ sender: UIBarButtonItem) {
        fetchImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(circularView)
        progressView.isHidden = true
        circularView.center = view.center
    }
}


extension ViewController {
    private func fetchImage() {
        var timer = Timer()
        var first = 0.0
        
        AF.request("https://dog.ceo/api/breeds/image/random")
            .responseDecodable(of: ImageBreed.self) { (response) in
                guard let response = response.value else { return }
                AF.request(response.url)
                    .downloadProgress(closure: { progress in
                        let last = progress.fractionCompleted
                        self.circularView.isHidden = false
                        self.circularView.progressAnimation(first: first, last: last)
                        if first < last { first = last }
                    })
                    .response(completionHandler: { response in
                        guard let data = response.data, let image = UIImage(data: data) else { return }
                        DispatchQueue.main.async {
                            timer.invalidate()
                            timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false, block: { _ in
                                self.imageView.image = image
                                self.circularView.isHidden = true
                            })
                        }
                    })
            }
    }
}


