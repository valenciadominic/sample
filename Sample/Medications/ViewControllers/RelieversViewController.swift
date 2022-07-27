//
//  RelieversViewController.swift
//  Sample
//
//  Created by Dominic Valencia on 7/27/22.
//

import UIKit

class RelieversViewController: UIViewController {

    private lazy var noRelieverView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addLayerChanges(cornerRadius: 15)
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.addLayerChanges(cornerRadius: 45)
        return imageView
    }()
    
    private lazy var noRelieverLabel: UILabel = {
        let label = UILabel()
        label.text = "No relievers"
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var noRelieverDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "You have no relievers saved at the moment."
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var addRelieverButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add reliever", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        button.addLayerChanges(cornerRadius: 15)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        
        self.view.addSubview(noRelieverView)
        noRelieverView.addSubview(imageView)
        noRelieverView.addSubview(noRelieverLabel)
        noRelieverView.addSubview(noRelieverDescriptionLabel)
        noRelieverView.addSubview(addRelieverButton)
        
        noRelieverView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(270)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.top.equalTo(20)
            make.centerX.equalTo(noRelieverView)
        }
        
        noRelieverLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalTo(noRelieverView)
        }
        
        noRelieverDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(noRelieverLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        addRelieverButton.snp.makeConstraints { make in
            make.top.equalTo(noRelieverDescriptionLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
