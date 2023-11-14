//
//  FistAnimationViewController.swift
//  Assignment-19
//
//  Created by Eka Kelenjeridze on 12.11.23.
//

import UIKit

final class FistAnimationViewController: UIViewController {
    // MARK: - Properties
    private let TBCLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.38, green: 0.74, blue: 0.81, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupLabel()
        animateBounce(for: TBCLabel)
        animateFade(for: TBCLabel)
        setupScreenTapGesture()
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupLabel() {
        view.addSubview(TBCLabel)
        
        NSLayoutConstraint.activate([
            TBCLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            TBCLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func animateBounce(for label: UILabel) {
        UIView.animate(withDuration: 2.2, animations: {
            label.frame.origin.y += 50
        }) { _ in
            UIView.animate(withDuration: 2.2, animations: {
                label.frame.origin.y -= 50
            }) { _ in
                self.animateBounce(for: label)
            }
        }
    }
    
    private func animateFade(for label: UILabel) {
        UIView.animate(withDuration: 2.2, animations: {
            label.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 2.2) {
                label.alpha = 1.0
            } completion: { _ in
                self.animateFade(for: label)
            }
        }
    }
    
    private func setupScreenTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToSecondAnimation))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func navigateToSecondAnimation() {
        navigationController?.pushViewController(SecondAnimationViewController(), animated: true)
    }
}

