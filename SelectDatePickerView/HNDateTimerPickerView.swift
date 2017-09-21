//
//  HNDateTimerPickerView.swift
//  Merchant
//
//  Created by Zerella on 2017/9/1.
//  Copyright © 2017年 Zerella. All rights reserved.
//

import UIKit

protocol HNdatePickerDelagate: NSObjectProtocol{
    func finishBtnAction(date:String)     // 完成
    func hideDataTimePickerView()         // 取消
}

class HNDateTimerPickerView: UIView {
    @IBOutlet weak var dataPicker: UIDatePicker!
    weak var view:UIView?
    weak var delegate:HNdatePickerDelagate?  // 代理
    
    static func newInstance() -> HNDateTimerPickerView? {
        let nibView = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)
        if let view = nibView?.first as? HNDateTimerPickerView {
            return view
        }
        return nil
    }
    
    // HNdatePickerDelagate
    @IBAction func finishBtn(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let sourceTimeZone = NSTimeZone.system
        dateFormatter.timeZone = sourceTimeZone
        let dateStr = dateFormatter.string(from: self.dataPicker.date)
        print(dateStr)
        self.delegate?.finishBtnAction(date: dateStr)
    }
    
    // 取消
    @IBAction func cancelBtn(_ sender: Any) {
        self.delegate?.hideDataTimePickerView()
    }
}
