//
//  YMHomeInteractor.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit

class YMHomeInteractor: YMCInteractor{
    
    func gotoLiveStream() {
        let vc = YMLiveDetailViewController()
        self.baseController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
