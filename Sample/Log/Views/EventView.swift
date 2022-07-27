//
//  EventView.swift
//  Sample
//
//  Created by Dominic Valencia on 7/27/22.
//

import UIKit

class EventView: UIView {
    
    enum EventType: String {
        case Wheeze = "Wheeze recording"
        case Medication = "Medication"
    }
    
    var eventType: EventType
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private lazy var imageViewArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()

    init(frame: CGRect = .zero, eventType: EventType) {
        self.eventType = eventType
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addLayerChanges(cornerRadius: 15, borderWidth: 1, borderColor: .lightGray)
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(imageViewArrow)
        
        snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.width.height.equalTo(30)
            make.leading.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        
        imageViewArrow.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.width.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        titleLabel.text = eventType.rawValue
    }
    
}
