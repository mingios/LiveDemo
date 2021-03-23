//
//  YMHomeDataService.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit
import Foundation

class YMHomeDataService: NSObject {

}

extension YMHomeDataService :YMDataServiceProtocol{
    
    func loadData(adapter:YMBaseAdapter) {
        var dataArray:[ChannelModel] = []
        for index in 0...10 {
            let channelModel = ChannelModel()
            channelModel.name = "直播频道\(index)"
            dataArray.append(channelModel)
        }
        adapter.setDataArray(dataArray)
        self.context?.view?.reloadUIWithData()
    }
    
}
