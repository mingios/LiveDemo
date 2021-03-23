//
//  YMHomeView.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit
import SnapKit
class YMHomeView: UIView {

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
//        tableView.separatorStyle = .none
        return tableView
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


extension YMHomeView:YMViewProtocol {
    
    func buildView(adapter:YMBaseAdapter) {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.delegate = adapter
        tableView.dataSource = adapter
        
        tableView.register(YMHomeTableViewCell.self, forCellReuseIdentifier: YMHomeTableViewCell.ym_reuseIdentifier)
    }
    
    func reloadUIWithData() {
        tableView.reloadData()
    }
    
}
