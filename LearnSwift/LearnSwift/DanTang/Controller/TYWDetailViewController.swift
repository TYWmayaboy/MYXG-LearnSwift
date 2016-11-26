//
//  TYWDetailViewController.swift
//  LearnSwift
//
//  Created by apple on 2016/11/26.
//  Copyright © 2016年 tyw. All rights reserved.
//

import UIKit
import SVProgressHUD

class TYWDetailViewController: TYWBaseViewController {

    var homeItem: TYWHomeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView()
        
        webView.frame = view.bounds
        
        webView.scalesPageToFit = true
        
        webView.dataDetectorTypes = .all
        
        let url = NSURL(string: homeItem!.content_url!)
        
        let request = NSURLRequest(url: url! as URL)
        
        webView.loadRequest(request as URLRequest)
        
        webView.delegate = self
        
        view.addSubview(webView)
        
    }
    

}

extension TYWDetailViewController: UIWebViewDelegate {

    func webViewDidStartLoad(_ webView: UIWebView) {
        
        SVProgressHUD.setStatus("正在加载...")
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        SVProgressHUD.dismiss()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }

}
