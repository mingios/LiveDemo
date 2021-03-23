//
//  YMHomeViewController.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit

/*
 vc             控制器       只做建立连接，进行各个模块的调度工作
 adapter        适配器       只做cell适配
 dataService    数据提供层    从网络请求数据，进行封装，将数据传个adapter
 interactor     交互层       拥有 vc ，主要做UI交互，跳转，动画等
 homeView       UI层        UI布局
 context        百宝箱       拥有 dataService、interactor(vc)、homeView
 NSObjc 添加分类，让所有的类都拥有 context
 */

class YMHomeViewController: YMBaseViewController {

    let homeAdapter:YMHomeAdapter = YMHomeAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        homeAdapter.delegate = self
        
        configContext(name: "Home")
        
        self.context?.view?.buildView(adapter: homeAdapter)
        
        self.context?.dataService?.loadData(adapter:homeAdapter)
    }

}

extension YMHomeViewController : YMListDelegate {
    func didSelectCell(model: YMListCellProtocol) {
        guard let interactor:YMHomeInteractor = self.context?.interactor as? YMHomeInteractor else { return }
        interactor.gotoLiveStream()
    }
}

