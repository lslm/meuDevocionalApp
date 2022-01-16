//
//  ViewOnboard.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/01/22.
//

import UIKit
class ViewOnboarding:UIView{
    
    private let scrollView: UIScrollView
    public let labelTitulo = UILabel()
    public let label = UILabel()
    var imageName = String()
    
    lazy var image = UIImage(named: imageName)
    lazy var imageView = UIImageView(image: image)
    
    init(titulo:String,text:String,imageName:String){
        self.scrollView = UIScrollView()
        
        super.init(frame: .zero)
        self.addSubview(scrollView)
        self.backgroundColor = UIColor(named: "BackgroundColor")

        labelTitulo.text = titulo
        labelTitulo.numberOfLines = 0
        scrollView.addSubview(labelTitulo)
        
        label.text = text
        label.numberOfLines = 0
        scrollView.addSubview(label)
        
        self.imageName = imageName
        scrollView.addSubview(imageView)
        setupConstrainstsOnbarding()
        setAccessibility()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrainstsOnbarding(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollConstraints:[NSLayoutConstraint] = [
        scrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
        scrollView.topAnchor.constraint(equalTo: self.topAnchor),
        scrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -200)]
        NSLayoutConstraint.activate(scrollConstraints)

        
        labelTitulo.translatesAutoresizingMaskIntoConstraints = false
        let labelTituloConstraints:[NSLayoutConstraint] = [
            labelTitulo.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 12),
            labelTitulo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            labelTitulo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ]
        NSLayoutConstraint.activate(labelTituloConstraints)

        label.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraints:[NSLayoutConstraint] = [
            label.topAnchor.constraint(equalTo: labelTitulo.bottomAnchor,constant: 2),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imgConstrainsts:[NSLayoutConstraint] = [
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor,multiplier: 0.3),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 4)
        ]
        
        NSLayoutConstraint.activate(imgConstrainsts)
        
        
    }
    func setAccessibility(){
        labelTitulo.isAccessibilityElement = true
        labelTitulo.accessibilityHint = "Title of onboard Page"
        label.isAccessibilityElement = true
        imageView.isAccessibilityElement = false
    }
}

