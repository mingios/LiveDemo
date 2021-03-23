//
//  ChannelModel.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit

class ChannelModel: NSObject ,YMListCellProtocol{
    var name:String?
    
    var identifier: String  = YMHomeTableViewCell.ym_reuseIdentifier
    var cellHeight: CGFloat = 100
}

