//
//  ViewController.swift
//  ExampleApp
//
//  Created by y H on 2024/11/1.
//

import UIKit
import SwiftyHUD

class ViewController: UIViewController {
    lazy var hudContentView = UIView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.width))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(hudContentView)
        hudContentView.backgroundColor = .systemBlue

        func call() {
            Task {
                await requestHUD()
                try await Task.sleep(for: .seconds(1))
                call()
            }
        }
//        call()
        
        Task {
            SwiftyHUD.showToast("Hello", in: hudContentView)
            try await Task.sleep(for: .seconds(2))
            SwiftyHUD.show(.text(.default(text: "Hello1"), style: .init(position: .top(10))), in: hudContentView)
            try await Task.sleep(for: .seconds(2))
            SwiftyHUD.show(.text(.default(text: "Hello2"), style: .init(position: .default)), in: hudContentView, duration: 2)
        }
        
    }

    func requestHUD() async {
        do {
            try await Task.sleep(for: .seconds(1))
            Task {
                let activityHUD = SwiftyHUD.activity(.default, message: .default(text: "Activity..."), animation: .default, style: .default)
                SwiftyHUD.show(activityHUD, in: hudContentView)

                try await Task.sleep(for: .milliseconds(1500))
//                let imageHUD = SwiftyHUD.image(.default(image: .checkmark), message: .default(text: "Done."))
                SwiftyHUD.show(.image(.default(image: .checkmark),
                                      message: .default(text: "Already done.")),
                               in: hudContentView,
                               duration: 1)
            }

            try await Task.sleep(for: .seconds(2))
            let spinnerHUD = SwiftyHUD.spinner(.default, message: .default(text: "Spinner"), animation: .default, style: .default)
            SwiftyHUD.show(spinnerHUD, animation: .default, completion: nil)

            try await Task.sleep(for: .seconds(2))
            SwiftyHUD.show(percentageHUD(ratio: 0.1), animation: .default, completion: nil)
            try await Task.sleep(for: .milliseconds(500))
            SwiftyHUD.show(percentageHUD(ratio: 0.3), animation: .default, completion: nil)
            try await Task.sleep(for: .milliseconds(300))
            SwiftyHUD.show(percentageHUD(ratio: 0.6), animation: .default, completion: nil)
            try await Task.sleep(for: .seconds(1))
            let failureHUD = SwiftyHUD.failure(.init(color: .systemRed), message: .default(text: "Download Failure. (Retry after 3 seconds)"), animation: .default, style: .default)
            SwiftyHUD.show(failureHUD)
            try await Task.sleep(for: .seconds(3))
            SwiftyHUD.show(percentageHUD(ratio: 0.6), animation: .default, completion: nil)
            try await Task.sleep(for: .milliseconds(250))
            SwiftyHUD.show(percentageHUD(ratio: 0.8), animation: .default, completion: nil)
            try await Task.sleep(for: .milliseconds(400))
            SwiftyHUD.show(percentageHUD(ratio: 1), animation: .default, completion: nil)
            try await Task.sleep(for: .milliseconds(150))
            let successHUD = SwiftyHUD.success(.init(color: .systemGreen), message: .default(text: "Download successed."), animation: .default, style: .default)
            SwiftyHUD.show(successHUD, duration: 1)
        } catch {
            print(error)
        }
    }

    func percentageHUD(ratio: CGFloat) -> SwiftyHUD {
        SwiftyHUD.percentage(.default(ratio: ratio), message: .default(text: "Downloading \(ratio * 100)%"), animation: .default, style: .default)
    }
}
