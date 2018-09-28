//
//  ViewController.swift
//  ShareDesignPatter
//
//  Created by xiaorui on 2018/9/18.
//  Copyright © 2018年 Worktile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Private
  
  private var _tableView: UITableView!
  private var _data: [TestData] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _setupAppearence()
    _setupDataSource()
    
  }
  
  func _setupAppearence() {
    view.backgroundColor = .white
    _tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
    _tableView.delegate = self
    _tableView.dataSource = self
    _tableView.tableFooterView = UIView()
    
    view.addSubview(_tableView)
  }
  
  func _setupDataSource() {
    _data = [
      TestData(title: "工厂方法", vc: FactoryMethodViewController.self),
      TestData(title: "未完待续", vc: UIViewController.self)]
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return _data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = _data[indexPath.row].title
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.row < (_data.count - 1) {
      let vc: UIViewController = _data[indexPath.row].vc.init()
      vc.title = _data[indexPath.row].title
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 56
  }
}

extension ViewController {
  struct TestData {
    let title: String
    let vc: UIViewController.Type
  }
}
