//
//  YMHomeAdapter.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit

class YMHomeAdapter: YMBaseAdapter {

    override func cellConfigureBefore(cell: UITableViewCell,model:YMListCellProtocol,indexPath:IndexPath){
        
        guard let cell:YMHomeTableViewCell = cell as? YMHomeTableViewCell,
              let model:ChannelModel = model as? ChannelModel
        else {
            return
        }
        
        cell.setCellContent(model)
    }
    
}
