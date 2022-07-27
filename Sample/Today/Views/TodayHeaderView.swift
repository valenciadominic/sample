//
//  TodayHeaderView.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit
import SnapKit

class TodayHeaderView: UIView {
    
    private lazy var barButtonView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.addLayerChanges(cornerRadius: 15)
        return view
    }()
    
    private lazy var barButtonView2: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.addLayerChanges(cornerRadius: 15)
        return view
    }()
    
    private lazy var barButtonView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addLayerChanges(cornerRadius: 15)
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
        addSubview(barButtonView1)
        addSubview(barButtonView2)
        addSubview(barButtonView3)
        
        barButtonView1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        barButtonView2.snp.makeConstraints { make in
            make.leading.equalTo(barButtonView1.snp.trailing).offset(10)
            make.width.equalTo(100)
            make.height.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        barButtonView3.snp.makeConstraints { make in
            make.leading.equalTo(barButtonView2.snp.trailing).offset(10)
            make.width.equalTo(100)
            make.height.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
