//
//  DailyProgressView.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit

class DailyProgressView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private lazy var dailyStackView: UIView = {
        let stackView = UIView()
        return stackView
    }()
    
    private lazy var dailyProgressView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var dailyProgressLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily progress"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .blue
        return label
    }()
    
    private lazy var dailyProgressValue: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = .systemFont(ofSize: 14)
        label.text = "0s"
        return label
    }()
    
    private lazy var dailyStreakLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily streak"
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var dailyStreakValue: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = "0"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var progressView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var progressViewValue: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.addLayerChanges(cornerRadius: 5)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        addSubview(contentView)
        contentView.addLayerChanges(cornerRadius: 15)
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(dailyStackView)
        mainStackView.addArrangedSubview(progressView)
        
        dailyStackView.addSubview(dailyProgressLabel)
        dailyStackView.addSubview(dailyProgressValue)
        dailyStackView.addSubview(dailyStreakLabel)
        dailyStackView.addSubview(dailyStreakValue)
        
        progressView.addSubview(progressViewValue)
        
        
        contentView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        dailyProgressLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().offset(20)
        }
        
        dailyProgressValue.snp.makeConstraints { make in
            make.leading.equalTo(dailyProgressLabel.snp.trailing).offset(5)
            make.width.equalTo(20)
            make.centerY.equalTo(dailyProgressLabel)
        }
        
        dailyStreakValue.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(dailyProgressLabel)
        }
        
        dailyStreakLabel.snp.makeConstraints { make in
            make.trailing.equalTo(dailyStreakValue.snp.leading).inset(-2)
            make.centerY.equalTo(dailyProgressLabel)
        }
        
        progressViewValue.snp.makeConstraints { make in
            make.height.equalTo(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(progressView)
        }
        
    }
    
}
