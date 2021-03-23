//
//  YMContext.swift
//  LiveDemo
//
//  Created by star on 2021/3/23.
//

import UIKit

public protocol YMContextProtocol:NSObjectProtocol {
    static func instance() -> Self
    var context:YMContext? { get set }
}

public extension YMContextProtocol where Self: NSObject {
    static func instance() -> Self {
        return Self.init()
    }
}


public protocol YMDataServiceProtocol: YMContextProtocol {
    func loadData(adapter:YMBaseAdapter)
}

public protocol YMViewProtocol:YMContextProtocol where Self: UIView {
    func buildView(adapter:YMBaseAdapter)
    func reloadUIWithData()
}

public class YMCInteractor:NSObject,YMContextProtocol {
    weak var baseController:UIViewController?
}

public class YMContext: NSObject {
    var dataService:YMDataServiceProtocol?
    var interactor:YMCInteractor?
    var view:YMViewProtocol?
}


extension NSObject {
    
    static var contextKey = "contextKey"
    
    public var context:YMContext? {
        set {
            objc_setAssociatedObject(self, &NSObject.contextKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let rs = objc_getAssociatedObject(self, &NSObject.contextKey) as? YMContext {
                return rs
            }
            if let view = self as? UIView {
                var superview = view.superview
                while superview != nil {
                    if let context = superview?.context {
                        self.context = context
                        return context
                    }
                    superview = superview?.superview
                }
            }
            return nil
        }
    }
    
}





