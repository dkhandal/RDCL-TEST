//
//  ViewController.swift
//  ABCD
//
//  Created by Sujay Pidara on 5/24/16.
//  Copyright © 2016 RADICLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnLoadData(sender: UIButton) {
            loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func loadData() {
        
        JHProgressHUD.sharedHUD.showInView(self.view, withHeader: "Loading", andFooter: "Please Wait")
        
        AFWrapper.requestGETURL("https://httpbin.org/get", success: { //https://httpbin.org/get
            (JSONResponse) -> Void in
            
            //self.hideLoadingHUD()  // <-- Add this line
            
            JHProgressHUD.sharedHUD.hide()
            print("JSONResponse: \(JSONResponse)" )
        }) {
            (error) -> Void in
            JHProgressHUD.sharedHUD.hide()
            print(error)
        }
    }


}

