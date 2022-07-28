//
//  ViewController.swift
//  툴바, 웹뷰 컨트롤러 연습
//
//  Created by 이도헌 on 2022/07/28.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    static let id = "ViewController"
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let destinationURL: String = "https://www.google.co.kr"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        openWebPage(url: destinationURL)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissTosb))
    }
    
    @objc func dismissTosb() {
        self.dismiss(animated: true)
        
    }
    
    @IBAction func goBackButtonClicked(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func reloadButtonClicked(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goForwardButtonClicked(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    func openWebPage(url: String) {
        //유효한 페이지인지 검사
        guard let url = URL(string: url) else {
            print("유효하지 않은 URL")
            
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


//MARK: - UISearchBarDelegate 프로토콜 채택
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let url = "https://\(searchBar.text!)"
        openWebPage(url: url)
        
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        // searchBar의 우선권 포기
        searchBar.resignFirstResponder()
    }
}

