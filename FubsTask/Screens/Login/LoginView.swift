//
//  LoginView.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class LoginView: BaseView {
    let companyLogo = UIImageView()
    let titleLabel = Label(text: "GSM numaranı ve şifreni girerek\nFUPS hesabına giriş yapabilirsin.", type: .title, aligment: .center)
    let textFieldCountryCode = TextField(textFiledType: .picker, placeHolder: "Ülke Kodu")
    let textFieldGsmNo = TextField(textFiledType: .texField, placeHolder: "GSM Numaran")
    let textFielPassword = TextField(textFiledType: .password, placeHolder: "Şifren")
    let entryButton = Button(buttonType: .primaryButton, title: "Giriş Yap")
    let buttonForgotPassword = Button(buttonType: .text,title: "Şifremi Unuttum",image: "combinedShape",textColor: Color.accentBlue, alignment: .left)
    let hStackView = UIStackView()
    let horizontalCollectionView = HorizontalCollectionView()
    let bottomView = UIView()
    let accountTitleLabel = Label(text: "HESABINLA NELER YAPABİLİRSİN?", type: .info, aligment: .left)
    
    override init() {
        super.init()
        configuration()
        draw()
        bottomStickyView()
        setupConstraints()
    }
    
    private func configuration()
    {
        titleLabel.numberOfLines = 0
        companyLogo.image = UIImage(named: "elementLogoFups")
        companyLogo.contentMode = .scaleAspectFit
        hStackView.axis = .horizontal
        hStackView.alignment = .fill
        hStackView.distribution = .fill
        textFieldCountryCode.setText("+90")
    }
    
    func bottomStickyView(){
        addSubview(bottomView)
        bottomView.addSubview(horizontalCollectionView)
        horizontalCollectionView.setData(dataSource: getData())
        bottomView.addSubview(accountTitleLabel)
    }
    
    func getData() ->  [HorizontalCollectionViewDataSource] {
        var dataSource: [HorizontalCollectionViewDataSource] = []
        dataSource.append(HorizontalCollectionViewDataSource(image: "imageBannerBig01", title: "SOSYAL HESAP", subtitle: "Sosyal Hesap’larını oluşturarak sevdiklerine para gönder, iste."))
        dataSource.append(HorizontalCollectionViewDataSource(image: "imageBannerBig02", title: "OYUN & E-PIN", subtitle: "Oyun servislerine hızlıca para aktarın, vakit kaybetmeyin.para gönder, iste."))

        return dataSource
    }
}

extension LoginView{
    func draw()  {
        
        hStackView.addArrangedSubview(textFieldCountryCode)
        hStackView.addArrangedSubview(textFieldGsmNo)
        stackView.addArrangedSubviews([
            spacer(24),
            companyLogo,
            spacer(31),
            titleLabel,
            spacer(49),
            hStackView,
            spacer(12),
            textFielPassword,
            spacer(19),
            buttonForgotPassword,
            spacer(30),
            entryButton
        ])
    }
    
    func setupConstraints(){
        companyLogo.translatesAutoresizingMaskIntoConstraints = false
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        accountTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldCountryCode.widthAnchor.constraint(equalToConstant: 128),
            hStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
            hStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
            companyLogo.heightAnchor.constraint(equalToConstant: 36),
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            textFielPassword.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
            textFielPassword.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 240),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 170),
            accountTitleLabel.bottomAnchor.constraint(equalTo: horizontalCollectionView.topAnchor, constant: -21),
            accountTitleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20)

        ])
    }
}
