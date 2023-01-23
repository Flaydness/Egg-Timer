//
//  ViewController.swift
//  EggTimer
//
//  Created by FLT on 18.01.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private lazy var headLabel: UILabel = {
        let label = UILabel()
        
        label.text = "How do you like your eggs?"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        
        return label
    }()
    
    private lazy var progressBar: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .red
        
        return progress
    }()
    
    private lazy var leftButton: UIButton = {
        
        var backgroundConfig =  UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.image = UIImage(named: "soft_egg")
        backgroundConfig.imageContentMode = .scaleAspectFit
    
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.background = backgroundConfig
        buttonConfig.baseBackgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonConfig.title = "Soft"
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.startTimerFrom(from: 3)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    private func startTimerFrom(from time: Int) {
        timer.invalidate()
        totalTime = time
        progressBar.progress = 0
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = Float(percentageProgress)
            secondsPassed += 1
        }
        else {
            headLabel.text = "DONE!"
            timer.invalidate()
        }
    }
    
    private lazy var midButton: UIButton = {
        
        var backgroundConfig =  UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.image = UIImage(named: "medium_egg")
        backgroundConfig.imageContentMode = .scaleAspectFit
    
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.background = backgroundConfig
        buttonConfig.baseBackgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonConfig.title = "Medium"
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.startTimerFrom(from: 5)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        
        var backgroundConfig =  UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.image = UIImage(named: "hard_egg")
        backgroundConfig.imageContentMode = .scaleAspectFit
    
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.background = backgroundConfig
        buttonConfig.baseBackgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonConfig.title = "Hard"
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.startTimerFrom(from: 7)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        view.addSubview(headLabel)
        view.addSubview(leftButton)
        view.addSubview(midButton)
        view.addSubview(rightButton)
        view.addSubview(progressBar)
        
        
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            headLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            leftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            leftButton.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            leftButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            leftButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            midButton.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: 5),
            midButton.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            midButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            midButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            rightButton.leftAnchor.constraint(equalTo: midButton.rightAnchor, constant: 5),
            rightButton.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            rightButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            rightButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            progressBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            progressBar.topAnchor.constraint(equalTo: midButton.bottomAnchor, constant: 100),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }


}

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

