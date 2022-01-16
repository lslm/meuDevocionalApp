//
//  OnboardViewController.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 16/01/22.
//

import Foundation


import UIKit
class OnboardViewController: UIViewController {
    
    
    var isOnboarding: Bool
    
    private lazy var closeButtonBar: UIBarButtonItem  = .init(barButtonSystemItem: .close, target: self, action: #selector(actionDismiss))
    
    //MARK: -View
    lazy var view0:ViewOnboarding =  {
        let view = ViewOnboarding(titulo: "Welcome!",
                   text: "This is Coverless: your book discovery app. Find out everything you can discover and remember: never judge a book by its cover!",
                   imageName: "Onboard1")
        return view
    }()
    
    
    lazy var view1:ViewOnboarding =  {
        let view = ViewOnboarding(titulo: "Discover",
                   text: "The first available screen is the discovery one. Select the book category you want and then have at hand several books selected through its synopsis. You can view more information of the book through the 'Learn more button or add the book to your bookshelf of discoveries.",
                   imageName: "Onboard2")
        return view
    }()
    
    lazy var view2:ViewOnboarding =  {
        let view = ViewOnboarding(titulo: "Shelf",
                   text: "Your bookshelf is divided in two parts: Favorites and discoveries. You can add to favorites a book of your collection by clicking the heart shaped button.",
                   imageName: "Onboard3")
        return view
    }()
    
    lazy var view3:ViewOnboarding =  {
        let view = ViewOnboarding(titulo: "Favorite Books",
                   text: "When viewing a book from your bookshelf, select whether you have already read, are reading or have abandoned that reading. Also, don't forget to share the synopsis of the book with other fellow readers.",
                   imageName: "Onboard4")
        return view
    }()
    
    
    lazy var arrayViews = [view0, view1, view2, view3]
    
    //MARK: -scrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(arrayViews.count), height: view.frame.height)
        
        for i in 0..<arrayViews.count {
            scrollView.addSubview(arrayViews[i])
            
            pageControl.accessibilityLabel = "Page \(i+1) of four"
            
            arrayViews[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        scrollView.delegate = self
    
        return scrollView
    }()
    
    //MARK: -pageControl
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = arrayViews.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor(named: "Accent")
        pageControl.pageIndicatorTintColor = UIColor(named: "Accent")?.withAlphaComponent(0.3)
        pageControl.isEnabled = false
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .valueChanged)
        return pageControl
    }()
    
    //MARK: -butão
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundColor")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(named: "Accent"), for: .normal)
        button.addTarget(self, action: #selector(addPageContol), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundColor")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(named: "Accent"), for: .normal)
        button.addTarget(self, action: #selector(subPageContol), for: .touchUpInside)
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundColor")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(named: "Accent"), for: .normal)
        
        if isOnboarding {
            button.addTarget(self, action: #selector(actionNavigateViewController), for: .touchUpInside)
        } else {
            button.addTarget(self, action: #selector(actionDismiss), for: .touchUpInside)
        }
        
        
        return button
    }()
    
    //MARK: -Inits
    init(isOnboarding: Bool) {
        self.isOnboarding = isOnboarding
        super.init(nibName: nil, bundle: nil)
        setAccessibility()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        //navigationController?.navigationBar.isHidden = true
        navigationItem.rightBarButtonItem = closeButtonBar
        
        super.viewDidLoad()
        
        //acessibilidade
        view.accessibilityViewIsModal = true
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(closeButton)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        
        setupConstraints()
    }

    
    //MARK: -Constraints
    func setupConstraints(){
        
        //pagecontrol
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        let pageControlConstraints:[NSLayoutConstraint] = [
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(pageControlConstraints)
        
        //scrollview
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewConstraints:[NSLayoutConstraint] = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/6),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height/3)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
        
        //botoes
        nextButton.translatesAutoresizingMaskIntoConstraints=false
        let nextButtonConstraints:[NSLayoutConstraint] = [
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-30)
        ]
        NSLayoutConstraint.activate(nextButtonConstraints)
        
        previousButton.translatesAutoresizingMaskIntoConstraints=false
        let previousButtonConstraints:[NSLayoutConstraint] = [
            previousButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            previousButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30)
        ]
        NSLayoutConstraint.activate(previousButtonConstraints)
        
        closeButton.translatesAutoresizingMaskIntoConstraints=false
        let closeButton:[NSLayoutConstraint] = [
            closeButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant: +50),
            closeButton.leftAnchor.constraint(equalTo: view.rightAnchor,constant: -50)
        ]
        NSLayoutConstraint.activate(closeButton)
    }

    
    //MARK: -ação de mudar de pagina na pageControl
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage )
        scrollView.scrollRectToVisible(frame, animated: true)
        
    }
    
    @objc
    func addPageContol(){
        if (scrollView.contentOffset.x+view.frame.width < view.frame.width*CGFloat(arrayViews.count)) {
            
            scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x+view.frame.width, y: 0), animated: false)
            
            if (scrollView.contentOffset.x+view.frame.width == view.frame.width*CGFloat(arrayViews.count)) {
                nextButton.setTitle("End", for: .normal)
            }
        } else {
            //dismiss
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    @objc
    func subPageContol(){
        nextButton.setTitle("Next", for: .normal)
        if (scrollView.contentOffset.x-view.frame.width>=0){
            scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x-view.frame.width, y: 0), animated: false)
        }
        
        
    }
    
    @objc
    func actionDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func actionNavigateViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setAccessibility(){
        closeButtonBar.isAccessibilityElement = true
        closeButtonBar.accessibilityLabel = "Close presentation"
        closeButtonBar.accessibilityHint = "Click to close onboard page"
        
        nextButton.isAccessibilityElement = true
        nextButton.accessibilityHint = "Click to next onboard page"
        previousButton.isAccessibilityElement = true
        previousButton.accessibilityHint = "Click to previous onboard page"
        pageControl.isAccessibilityElement = true
        pageControl.accessibilityLabel = "Page control"

    }
}

//MARK: -Delegate
extension OnboardViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
    }
}

