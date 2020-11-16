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
    @IBOutlet var textField: UITextField!
    
    @IBAction func startDownload(_ sender: UIButton) {
        guard let text = textField.text else { return }
        let value = (Double(text) ?? 0) / 100
//        fetchImage()
        circularView.progressAnimation(toValue: value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(circularView)
        progressView.isHidden = true
        circularView.center = view.center
    }
}


//extension ViewController {
//    private func fetchImage() {
//        circularView.isHidden = false
//        AF.request("https://dog.ceo/api/breeds/image/random")
//            .responseDecodable(of: ImageBreed.self) { (response) in
//                guard let response = response.value else { return }
//                AF.request(response.url)
//                    .downloadProgress(closure: { progress in
//                        self.circularView.progressAnimation(toValue: progress.fractionCompleted)
//                    })
//                    .response(completionHandler: { response in
//                        guard let data = response.data, let image = UIImage(data: data) else { return }
//                        DispatchQueue.main.async {
//                            self.imageView.image = image
//                            self.circularView.isHidden = true
//                        }
//                    })
//            }
//    }
//}


