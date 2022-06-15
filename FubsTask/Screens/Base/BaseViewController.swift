//
//  BaseViewController.swift
//  FubsTask
//
//  Created by Gökhan Aras on 12.06.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    public var pageData:Any!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationItem.hidesBackButton = true
        self.navigationItem.titleView = Label(text:navigationBarTitle(), type: .title, aligment: .center)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.setNeedsStatusBarAppearanceUpdate()
        setNavigationBar()
        viewDidObserver()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(!navbarShow(), animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(!navbarShow(), animated: animated)
    }
 
    func navigationBarTitle() -> String {
        return "Title"
    }
    
    func navbarShow() -> Bool {
        return false
    }
    
    func viewDidObserver() {
        
    }
    
    private func setNavigationBar() {

        self.navigationItem.setHidesBackButton(true, animated:false)

        //your custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 15, width: 20, height: 13.5))

        if let imgBackArrow = UIImage(named: "ic_back") {
            imageView.image = imgBackArrow
        }
        view.addSubview(imageView)

        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        view.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view )
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
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
