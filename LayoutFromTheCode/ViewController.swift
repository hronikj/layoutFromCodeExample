//
//  ViewController.swift
//  LayoutFromTheCode
//
//  Created by Jiří Hroník on 28/03/16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func firstLayout() {
        print(view.frame)
        view.backgroundColor = UIColor.lightGrayColor()
        
        let view1 = UIView(frame: CGRectMake(100, 50, 100, 100))
        view1.backgroundColor = UIColor.redColor()
        view1.opaque = true
        view1.alpha = 1
        
        
        let view2 = UIView(frame: CGRectMake(100, 200, 100, 100))
        view2.backgroundColor = UIColor.magentaColor()
        
        let label1 = UILabel(frame: CGRectMake(100, 50, 100, 100))
        label1.enabled = true
        label1.text = "this is a label"
        label1.textColor = UIColor.cyanColor()
        
        view.addSubview(label1)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(label1)
        view1.removeFromSuperview()
    }
    
    func secondLayout() {
        view.backgroundColor = UIColor.lightGrayColor()
        
        let vLayout = VerticalLayout(width: view.frame.width)
        vLayout.backgroundColor = UIColor.cyanColor()
        view.addSubview(vLayout)
        
        let view1 = UIView(frame: CGRectMake(100, 50, 100, 100))
        view1.backgroundColor = UIColor.redColor()
        vLayout.addSubview(view1)
        
        let view2 = UIView(frame: CGRectMake(100, 50, 100, 100))
        view2.backgroundColor = UIColor.magentaColor()
        vLayout.addSubview(view2)
    }
    
    func thirdLayout() {
        // add views
        let view1 = UILabel()
        view1.translatesAutoresizingMaskIntoConstraints = false
        //view1.backgroundColor = UIColor.redColor()
        view1.text = "Label:"
        
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = UIColor.greenColor()
        
        let view3 = UITextField()
        view3.translatesAutoresizingMaskIntoConstraints = false
        //view3.backgroundColor = UIColor.blueColor()
        view3.text = "test"
        view3.textColor = UIColor.blackColor()
        view3.borderStyle = UITextBorderStyle.RoundedRect
        //view3.borderStyle = UITextBorderStyle.Line
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
    
        // MARK: constraints
        // make dictionary for views
        let viewsDictionary = [
            "view1": view1,
            "view2": view2,
            "view3": view3
        ]
        
        let metricsDictionary = [
            "view1Height": 30.0,
            "view2Height": 40,
            "viewHeight": 50.0
        ]
        
        let view1_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1(>=view1Height)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricsDictionary, views: viewsDictionary)
        let view1_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1(>=30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let view2_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:[view2(50)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let view2_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[view2(>=40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let view3_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:[view3(>=30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let view3_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[view3(>=30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view1.addConstraints(view1_constraint_H)
        view1.addConstraints(view1_constraint_V)
        view2.addConstraints(view2_constraint_H)
        view2.addConstraints(view2_constraint_V)
        view3.addConstraints(view3_constraint_H)
        view3.addConstraints(view3_constraint_V)
        
        // position constraints
        let view_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[view2]-8-[view3]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let view_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-36-[view1]-8-[view2]-10-|", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: viewsDictionary)
        let view_constraint2_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-36-[view3]-8-[view2]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)
        view.addConstraints(view_constraint2_V)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        thirdLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

