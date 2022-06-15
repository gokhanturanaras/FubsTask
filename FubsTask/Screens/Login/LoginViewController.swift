//
//  LoginViewController.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class LoginViewController: BaseViewController {
    var viewSource: LoginView {
        return self.view as! LoginView
    }
    
    override func loadView() {
        view = LoginView()
    }
    
    override func navbarShow() -> Bool {
        return true
    }
    
    override func navigationBarTitle() -> String {
        return ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidObserver() {
      
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

