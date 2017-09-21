//
//  ViewController.swift
//  SelectDatePickerView
//
//  Created by Zerella on 2017/9/21.
//  Copyright © 2017年 Zerella. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HNdatePickerDelagate {
    var bgView :UIView?
    @IBOutlet weak var dateLab: UILabel!
    lazy var pickerView: HNDateTimerPickerView = {
        guard let pickerView = HNDateTimerPickerView.newInstance() else {
            return HNDateTimerPickerView()
        }
        return pickerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        // 灰色背景视图
        bgView = UIView()
        bgView?.frame = self.view.bounds
        bgView?.backgroundColor = UIColor(white: 0.1, alpha: 0.6)
    }
    
    // 选择地址
    @IBAction func dateBtnAction(_ sender: Any) {
        self.view.addSubview(bgView!)
        self.pickerView.frame = CGRect(x: 0, y: self.view.frame.height, width:self.view.frame.width, height: 0)
        UIView.animate(withDuration: 0.25, animations: {
            self.pickerView.frame = CGRect(x: 0, y: self.view.frame.height - 280, width: self.view.frame.width, height: 280)
        })
        self.view.addSubview(self.pickerView)
        // 添加移除手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideView))
        bgView?.addGestureRecognizer(tapGesture)
    }
    
    // 移除动画
    func hideView() {
        UIView.animate(withDuration: 0.3) {
            self.pickerView.frame = CGRect(x:0,y:self.view.frame.height,width:self.view.frame.width,height:0)
            self.pickerView.removeFromSuperview()
            self.bgView?.removeFromSuperview()
        }
    }
    
    /// mark: HNdatePickerDelagate 完成
    func finishBtnAction(date: String) {
        print(date)
        self.dateLab?.text = date
        self.hideView()
    }
    
    /// mark: HNdatePickerDelagate 取消
    func hideDataTimePickerView() {
        self.hideView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

