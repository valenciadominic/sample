//
//  MedicationsViewController.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit
import Swift_PageMenu

struct UnderlinePagerOption: PageMenuOptions {

    var isInfinite: Bool = false

    var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: UIScreen.main.bounds.width / 3, height: 30)
    }
    
    var menuTitleColor: UIColor {
        return .lightGray
    }
    
    var menuTitleSelectedColor: UIColor {
        return .blue
    }
    
    var menuCursor: PageMenuCursor {
        return .underline(barColor: .blue, height: 2)
    }

    var font: UIFont {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
    
    var menuItemMargin: CGFloat {
        return 8
    }
    
    var tabMenuBackgroundColor: UIColor {
        return UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    public init(isInfinite: Bool = false) {
        self.isInfinite = isInfinite
    }
}

class MedicationsViewController: PageMenuController {

    let items: [UIViewController] = [RelieversViewController(), RelieversViewController(), RelieversViewController()]

    let titles: [String] = ["Relievers", "Preventers", "Other meds"]

    override init(options: PageMenuOptions? = nil) {
        super.init(options: UnderlinePagerOption())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupPageMenu()
        self.title = "Medications"
        self.view.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupNavigationBar() {
        guard let nav = self.navigationController else {
            return
        }
        
        nav.title = "Medications"
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.tintColor = .white
        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        
        func addMedicationButton() {
            let view = UIView()
            let button = UIButton(type: .custom)
            button.setTitle("Add medication", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 12)
            button.setTitleColor(.blue, for: .normal)
            button.layer.cornerRadius = 5
            button.backgroundColor = .blue.withAlphaComponent(0.2)
            
            view.addSubview(button)
            
            view.snp.makeConstraints { make in
                make.height.equalTo(nav.navigationBar.frame.height)
            }
            
            button.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(35)
                make.width.equalTo(100)
                make.height.equalTo(20)
            }
            
            let barButton = UIBarButtonItem(customView: view)

            self.navigationItem.rightBarButtonItem = barButton
       }
        
        addMedicationButton()
    }
    
    private func setupPageMenu() {
        if self.options.tabMenuPosition == .custom {
            self.view.addSubview(self.tabMenuView)
            self.tabMenuView.translatesAutoresizingMaskIntoConstraints = false

            self.tabMenuView.heightAnchor.constraint(equalToConstant: self.options.menuItemSize.height).isActive = true
            self.tabMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.tabMenuView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            if #available(iOS 11.0, *) {
                self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            }
        }

        self.delegate = self
        self.dataSource = self
    }
}

extension MedicationsViewController: PageMenuControllerDataSource {
    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController] {
        return self.items
    }

    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String] {
        return self.titles
    }

    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int {
        return 0
    }
}

extension MedicationsViewController: PageMenuControllerDelegate {
    func pageMenuController(_ pageMenuController: PageMenuController, didScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller will begin scrolling to a new page.
        print("didScrollToPageAtIndex index:\(index)")
    }

    func pageMenuController(_ pageMenuController: PageMenuController, willScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller scroll progress between pages.
        print("willScrollToPageAtIndex index:\(index)")
    }

    func pageMenuController(_ pageMenuController: PageMenuController, scrollingProgress progress: CGFloat, direction: PageMenuNavigationDirection) {
        // The page view controller did complete scroll to a new page.
        print("scrollingProgress progress: \(progress)")
    }

    func pageMenuController(_ pageMenuController: PageMenuController, didSelectMenuItem index: Int, direction: PageMenuNavigationDirection) {
        print("didSelectMenuItem index: \(index)")
    }
}

