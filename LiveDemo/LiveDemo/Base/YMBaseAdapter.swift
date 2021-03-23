//
//  YMBaseAdapter.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit

public protocol YMReusable: class {
    static var ym_reuseIdentifier: String { get }
}

extension UITableViewCell: YMReusable {
    public static var ym_reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol YMListDelegate:NSObjectProtocol {
    func didSelectCell(model:YMListCellProtocol)
}

public protocol YMListCellProtocol:NSObjectProtocol {
    var identifier: String { get set }
    var cellHeight: CGFloat { get set }
}

public class YMBaseAdapter: NSObject {
    var rows:[YMListCellProtocol]?
    weak var delegate:YMListDelegate?
    
    func setDataArray(_ array:[YMListCellProtocol]) {
        rows = array
    }
    
    func cellConfigureBefore(cell: UITableViewCell,model:YMListCellProtocol,indexPath:IndexPath){
        
    }
}


extension YMBaseAdapter : UITableViewDataSource,UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rows = rows,
              indexPath.row < rows.count - 1 else {
            return UITableViewCell()
        }
        
        let model = rows[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: model.identifier, for: indexPath)
        
        cellConfigureBefore(cell: cell, model: model, indexPath: indexPath)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let rows = rows,
              indexPath.row < rows.count - 1 else {
            return 0
        }
        let model = rows[indexPath.row]
        return model.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rows = rows,
              indexPath.row < rows.count - 1 else {
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        delegate?.didSelectCell(model:rows[indexPath.row])
    }
}
