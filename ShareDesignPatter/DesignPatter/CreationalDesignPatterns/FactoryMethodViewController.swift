//
//  FactoryMethodViewController.swift
//  ShareDesignPatter
//
//  Created by xiaorui on 2018/9/24.
//  Copyright © 2018年 Worktile. All rights reserved.
//

import UIKit

class FactoryMethodViewController: UIViewController {
  
  private var _textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "工厂方法"
    //    _textView = UITextView(frame: CGRect(x: 100, y: 100, width: UIScreen.main.bounds.width - 200, height: 500))
    //    _textView.backgroundColor = UIColor.gray
    //    _textView.textColor = .white
    //    view.addSubview(_textView)
    //
    _setup()
  }
}

extension FactoryMethodViewController {
  
  // 女娲
  func _setup() {
    let factory = HumanFactory()
    
    // 黑种人
    let balck: BlackHuman = factory.createHumanGenic(human: BlackHuman.self)
    balck.getColor()
//    let balck: BlackHuman = factory.createHuman(humanType: .black) as! BlackHuman
//    balck.getColor()
    
    // 白种人
    let white: WhiteHuman = factory.createHuman(humanType: .white) as! WhiteHuman
    white.getColor()
    
    // 黄种人
    let yellow: YellowHuman = factory.createHuman(humanType: .yellow) as! YellowHuman
    yellow.getColor()
  }
}

// 人
protocol HumanProtocol{
  func getColor()
}

class BlackHuman: UIViewController, HumanProtocol {
  func getColor() {
    debugPrint("这是一个黑种人！")
  }
}

class WhiteHuman: UIViewController, HumanProtocol {
  func getColor() {
    debugPrint("这是一个白种人！")
  }
}

class YellowHuman: UIViewController, HumanProtocol {
  func getColor() {
    debugPrint("这是一个黄种人！")
  }
}

enum HumanType {
  case black
  case white
  case yellow
}

// 八卦炉
protocol AbstractHumanFactory {
  func createHuman(humanType: HumanType) -> AnyObject
  func createHumanGenic<T>(human: AnyObject) -> T
}

class HumanFactory: AbstractHumanFactory {
  func createHuman(humanType: HumanType) -> AnyObject {
    switch humanType {
    case .black:
      return BlackHuman()
    case .white:
      return WhiteHuman()
    case .yellow:
      return YellowHuman()
    }
  }
  
  
  func createHumanGenic<T>(human: AnyObject) -> T {
    return (human as! UIViewController.Type).init() as! T
  }
}

// 简单工厂模式
//class HumanFactory1 {
//  static func createHuman(humanType: HumanType) -> AnyObject {
//    switch humanType {
//    case .black:
//      return BlackHuman()
//    case .white:
//      return WhiteHuman()
//    case .yellow:
//      return YellowHuman()
//    }
//  }
//}
