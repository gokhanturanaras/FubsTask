//
//  Button.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class Button: UIView {
    
    private var title:String? = ""
    private var buttonType:ButtonType!
    private var button = UIButton()
    private var size:CGFloat!
    private var buttonImage:String?
    private var textColor:UIColor!
    private var alignment:NSTextAlignment!
    private let gl = Color().gradiantColor
    private var leftImage:String?
    private var imageView = UIImageView()
    private var labelTitle:Label!
    init(buttonType:ButtonType, title:String? = nil, image:String? = nil, size:CGFloat  = 23, textColor:UIColor? = nil, alignment:NSTextAlignment = .center, leftImage:String? = nil) {
        super.init(frame: .zero)
        self.buttonType = buttonType
        self.title = title
        self.size = size
        self.buttonImage = image
        self.textColor = textColor
        self.alignment = alignment
        self.leftImage = leftImage
        draw()
    }
    
    func setTitle(_ title:String){
        self.title = title
        labelTitle.setText(title)
    }
    
    func setImage(image:UIImage){
        imageView.image = image
    }
  
    func click( _ closure: @escaping ()->()) {
        button.addAction {
            closure()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}


extension Button{
    func draw() {
        switch buttonType {
          case .text:
            configurationTextButton()
            break
        case .primaryButton:
            configurationPrimaryButton()
            break
        case .none:
            break
        }
        addButtonImage()
    }
    
    func addButtonImage(){
        if self.buttonImage != nil {
            imageView.image = UIImage(named: self.buttonImage ?? "")
            self.imageView.contentMode = .scaleAspectFit
            self.addSubview(self.imageView)
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
                self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            ])
            
        }
    }
    
    private func configurationTextButton(){
        labelTitle = Label(type:.title, fontType: .bold, aligment: alignment)
        labelTitle.textColor = textColor == nil ? Color.gray1 : textColor
        labelTitle.setText(title)
        self.addSubview(labelTitle)
        self.addSubview(button)
        self.backgroundColor = Color.clear
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            labelTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        ])
    }
 
    private func configurationPrimaryButton(){
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = Color.accentBlue
        self.addSubview(view)
        labelTitle = Label(text:title,type:.title, fontType: .bold, aligment: alignment)
        labelTitle.textColor = textColor == nil ? Color.white : textColor
        view.addSubview(labelTitle)
        view.addSubview(button)
        self.backgroundColor = .clear
        
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 56),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        ])
        
      
      
    }
    

}


enum ButtonType {
    case primaryButton
    case text
}


extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

@objc class ClosureSleeve: NSObject {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}
