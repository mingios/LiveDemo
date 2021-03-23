//
//  YMBaseViewController.swift
//  LiveDemo
//
//  Created by star on 2021/3/18.
//

import UIKit

let targetName = Bundle.main.infoDictionary!["CFBundleExecutable"]!

class YMBaseViewController: UIViewController {
    
    var name:String?
    
    var mvpEnabled = false
    
    var rootContext:YMContext?
    
    func configContext(name:String) {
        mvpEnabled = true
        self.name = name
        
        rootContext = YMContext()   //vc 释放，rootContext(strong) 释放
        context = rootContext       //将 rootContext 的生命周期给 context
//        context = YMContext()     //context 弱引用，创建就直接释放了
        
        if let dataServiceClass:YMDataServiceProtocol.Type = NSClassFromString(String(format: "\(targetName).YM%@DataService", name)) as? YMDataServiceProtocol.Type {
            context?.dataService = dataServiceClass.instance()
            context?.dataService?.context = context
        }
        
        
        if let interactorClass:YMContextProtocol.Type = NSClassFromString(String(format: "\(targetName).YM%@Interactor", name)) as? YMContextProtocol.Type {
            if let interactor:YMCInteractor = interactorClass.instance() as? YMCInteractor{
                context?.interactor = interactor
            }
            context?.interactor?.context = context
        }
        
        if let viewClass:YMViewProtocol.Type = NSClassFromString(String(format: "\(targetName).YM%@View", name)) as? YMViewProtocol.Type {
            context?.view = viewClass.instance()
            context?.view?.context = context
            context?.view?.bounds = self.view.bounds
            self.view = context?.view
        }
        
        context?.interactor?.baseController = self
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
