//
//  TextField.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class TextField: UIView {
    private var textField:UITextField!
    private var viewBackgroundColor: UIColor?
    private let viewBg = UIView()
    private var placeHolder:String!
    private var textFiledType:TextFieldType?
    private var placeHolderLabel = Label(type: .standart, fontType: .regular, textColor: Color.placeholder, aligment: .left)
    private var imageView = UIImageView()

    init(textFiledType:TextFieldType,placeHolder:String, viewBackgroundColor:UIColor = Color.white) {
        super.init(frame: .zero)
        self.viewBackgroundColor = viewBackgroundColor
        self.placeHolder = placeHolder
        self.textFiledType = textFiledType
        textFieldConfiguration()
        viewConfiguration()
        if self.textFiledType == .picker {
            drawPicker()
        }else{
            draw()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(_ data:String?){
        self.textField.text = data
    }
}

extension TextField{
    func textFieldConfiguration(){
        textField = UITextField()
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.smartDashesType = .no
        textField.smartInsertDeleteType = .no
        textField.delegate = self
        if self.textFiledType != .picker {
            textField.attributedPlaceholder = NSAttributedString(string:placeHolder, attributes: [NSAttributedString.Key.foregroundColor: Color.placeholder])
        }else{
            self.placeHolderLabel.setText(placeHolder)
        }
        textField.isSecureTextEntry = self.textFiledType == .password
    }
    
    func viewConfiguration(){
        viewBg.backgroundColor = viewBackgroundColor
        viewBg.layer.cornerRadius = 12
        viewBg.translatesAutoresizingMaskIntoConstraints = false
    }
    func draw() {
        addSubview(viewBg)
        viewBg.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: viewBg.bottomAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: viewBg.leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: viewBg.trailingAnchor, constant: -15),
            viewBg.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            viewBg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            viewBg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            viewBg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            viewBg.heightAnchor.constraint(equalToConstant: 53),
        ])
    }
    
    func drawPicker() {
        addSubview(viewBg)
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        viewBg.addSubview(placeHolderLabel)
        viewBg.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 15),
            textField.bottomAnchor.constraint(equalTo: viewBg.bottomAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: viewBg.leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: viewBg.trailingAnchor, constant: -15),
            viewBg.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            viewBg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            viewBg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            viewBg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            viewBg.heightAnchor.constraint(equalToConstant: 53),
            placeHolderLabel.leadingAnchor.constraint(equalTo: viewBg.leadingAnchor, constant: 20),
            placeHolderLabel.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 10)

        ])
        textField.isEnabled = false
        addImage()
    }
    
    
    func addImage(){
            imageView.image = UIImage(named: "icon20HelperDropdown")
            self.imageView.contentMode = .scaleAspectFit
            self.addSubview(self.imageView)
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            ])
            
        
    }
}


extension TextField: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

enum TextFieldType {
    case texField
    case password
    case picker

}

