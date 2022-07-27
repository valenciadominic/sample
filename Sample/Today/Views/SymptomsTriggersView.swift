//
//  SymptomsTriggersView.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit
import SnapKit
import HTagView

class SymptomsTriggersView: UIView {

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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Symptoms & triggers"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .blue
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Did any of the following symptoms affect you yesterday?"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var symptomsView: HTagView = {
        let view = HTagView()
        view.dataSource = self
        view.tagFont = UIFont.systemFont(ofSize: 10)
        view.tagMainBackColor = UIColor(red: 1, green: 130/255, blue: 103/255, alpha: 1)
        view.tagSecondBackColor = UIColor.lightGray
        view.tagSecondTextColor = UIColor.darkText
        return view
    }()
    
    private lazy var addTriggersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add triggers", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        button.addLayerChanges(cornerRadius: 17)
        return button
    }()
    
    private lazy var noSymptomsButton: UIButton = {
        let button = UIButton()
        button.setTitle("I had no symptoms yesterday", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .clear
        button.addLayerChanges(cornerRadius: 17)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tags = ["Coughing", "Wheezing", "Shortness of breath", "Limits to exercise", "Chest tightness", "Night workings"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        addSubview(contentView)
        contentView.addLayerChanges(cornerRadius: 15)
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(symptomsView)
        mainStackView.addArrangedSubview(addTriggersButton)
        mainStackView.addArrangedSubview(noSymptomsButton)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(320)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(-20)
            make.top.leading.equalToSuperview().offset(20)
        }
        
        symptomsView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
    }
}

extension SymptomsTriggersView: HTagViewDataSource {
    func numberOfTags(_ tagView: HTagView) -> Int {
        return tags.count
    }
    
    func tagView(_ tagView: HTagView, titleOfTagAtIndex index: Int) -> String {
        return tags[index]
    }
    
    func tagView(_ tagView: HTagView, tagTypeAtIndex index: Int) -> HTagType {
        return .select
    }
    
    func tagView(_ tagView: HTagView, tagWidthAtIndex index: Int) -> CGFloat {
        return .HTagAutoWidth
    }
}

