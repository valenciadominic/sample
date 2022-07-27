//
//  LogViewController.swift
//  Sample
//
//  Created by Dominic Valencia on 7/27/22.
//

import UIKit
import PullUpController

class LogViewController: PullUpController {
    
    enum InitialState {
        case contracted
        case expanded
    }

    var initialState: InitialState = .contracted
    
    var initialPointOffset: CGFloat {
        switch initialState {
        case .contracted:
            return 0 + safeAreaAdditionalOffset
        case .expanded:
            return pullUpControllerPreferredSize.height
        }
    }
    
    override var pullUpControllerPreferredSize: CGSize {
        return portraitSize
    }
    
    override var pullUpControllerPreferredLandscapeFrame: CGRect {
        return landscapeFrame
    }
    
    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        switch initialState {
        case .contracted:
            return [0]
        case .expanded:
            return [400 + safeAreaAdditionalOffset, 400]
        }
    }
    
    override var pullUpControllerBounceOffset: CGFloat {
        return 20
    }
    
    override func pullUpControllerAnimate(action: PullUpController.Action,
                                          withDuration duration: TimeInterval,
                                          animations: @escaping () -> Void,
                                          completion: ((Bool) -> Void)?) {
        switch action {
        case .move:
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: animations,
                           completion: completion)
        default:
            UIView.animate(withDuration: 0.3,
                           animations: animations,
                           completion: completion)
        }
    }
    
    public var portraitSize: CGSize = .zero
    public var landscapeFrame: CGRect = .zero
    
    private var safeAreaAdditionalOffset: CGFloat {
        400
    }
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var logEventLabel: UILabel = {
        let label = UILabel()
        label.text = "Log event"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .blue
        return label
    }()
    
    private lazy var logEventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Which event do you want to log:"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        portraitSize = CGSize(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height),
                              height: 400)
        landscapeFrame = CGRect(x: 5, y: 50, width: 280, height: 400)
        
        view.addSubview(indicatorView)
        view.addSubview(logEventLabel)
        view.addSubview(logEventDescriptionLabel)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(EventView(eventType: .Wheeze))
        stackView.addArrangedSubview(EventView(eventType: .Medication))
        
        indicatorView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.width.equalTo(70)
            make.height.equalTo(3)
            make.centerX.equalTo(view)
        }
        
        logEventLabel.snp.makeConstraints { make in
            make.top.equalTo(indicatorView.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.centerX.equalTo(view)
        }
        
        logEventDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logEventLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logEventDescriptionLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-50)
        }
        
    }

}
