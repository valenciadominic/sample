//
//  TodayViewController.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import UIKit
import SnapKit

class TodayViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Private
    func setupView() {
        tableView.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        cell.backgroundColor = .clear
        
        switch indexPath.row {
        case 0:
            let dailyProgressView = DailyProgressView()
            cell.contentView.addSubview(dailyProgressView)
            
            dailyProgressView.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.bottom.equalToSuperview()
            }
        default:
            let cardsView = CardsView()
            cell.contentView.addSubview(cardsView)
            
            cardsView.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.bottom.equalToSuperview()
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TodayHeaderView()
        
        headerView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(30)
        }
        
        return headerView
    }
}
