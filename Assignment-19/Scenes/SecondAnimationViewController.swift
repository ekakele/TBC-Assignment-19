//
//  SecondAnimationViewController.swift
//  Assignment-19
//
//  Created by Eka Kelenjeridze on 13.11.23.
//

import UIKit

final class SecondAnimationViewController: UIViewController {
    // MARK: - Properties
    private let gradientLayer = CAGradientLayer()
    private let colorPaletteOne = [UIColor.blue.cgColor, UIColor.red.cgColor]
    private let colorPaletteTwo = [UIColor.yellow.cgColor, UIColor.green.cgColor]
    
    private let TBCLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientLayer()
        animateLayerColors()
        setupLabel()
        animateScale(for: TBCLabel)
        animateSpin(for: TBCLabel)
    }
    
    // MARK: - Private Methods
    private func setupGradientLayer() {
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = colorPaletteOne
        view.layer.addSublayer(gradientLayer)
    }
    
    private func animateLayerColors() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.duration = 3.0
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.fromValue = colorPaletteOne
        animation.toValue = colorPaletteTwo
        gradientLayer.add(animation, forKey: "changeColor")
    }
    
    private func setupLabel() {
        view.addSubview(TBCLabel)
        
        NSLayoutConstraint.activate([
            TBCLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            TBCLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func animateScale(for label: UILabel) {
        label.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        label.alpha = 0.0
        UIView.animate(withDuration: 2.0) {
            label.alpha = 1.0
            label.transform = .identity
        }
    }
    
    private func animateSpin(for label: UILabel) {
        UIView.animate(
            withDuration: 5.0,
            delay: 0.0,
            options: [.autoreverse, .repeat],
            animations: {
                label.transform = label.transform.rotated(by: .pi)
            })
    }
}
