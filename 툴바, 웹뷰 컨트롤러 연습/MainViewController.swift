//
//  MainViewController.swift
//  툴바, 웹뷰 컨트롤러 연습
//
//  Created by 이도헌 on 2022/07/28.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "시작화면"
//        navigationItem.backButtonTitle = "Back"

        // Do any additional setup after loading the view.
    }

    
    @IBAction func trans(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ViewController.id) as? ViewController else { return }
        
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
}
