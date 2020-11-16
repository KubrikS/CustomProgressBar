//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by Stanislav on 16.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var circularView = CircularProgressView()
    var duration: TimeInterval!
    
    @IBAction func startDownload(_ sender: UIButton) {
        duration = 3    //Play with whatever value you want :]
        circularView.progressAnimation(duration: duration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        circularView.center = view.center
        view.addSubview(circularView)
    }
}

