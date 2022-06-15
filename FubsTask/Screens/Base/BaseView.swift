//
//  BaseView.swift
//  FubsTask
//
//  Created by Gökhan Aras on 12.06.2022.
//

import UIKit

class BaseView: UIView {
    // This initializer hides init(frame:) from subclasses
    let stackView = StackView()
    let scrollView = UIScrollView()
    var isScrollEnabled = true
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = Color.background
        drawBaseView()
    }
    
    // This attribute hides `init(coder:)` from subclasses
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
  
}

extension BaseView{
    
    func spacer(_ height:CGFloat = 8) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height)
        ])
        return view
    }

    
    private func drawBaseView() {
        backgroundColor = Color.background
        scrollView.addSubview(stackView)
        scrollView.isScrollEnabled = isScrollEnabled
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
       // scrollView.backgroundColor = .red
        addSubview(scrollView)
        //stackView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let guide = self.safeAreaLayoutGuide
        self.frame.size.width = UIScreen.main.bounds.width
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        let safeAreaHeight = ((topPadding == nil ? 0 : topPadding) ?? 0) + ((bottomPadding == nil ? 0 : bottomPadding) ?? 0)
        let height = UIScreen.main.bounds.height - (49 + safeAreaHeight)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor)

        ])
  
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: height)

    }
}

