//
//  ViewController.swift
//  myAppExample
//
//  Created by Nathan Ranghel on 12/10/18.
//  Copyright © 2018 Nathan Ranghel. All rights reserved.
//

import UIKit


extension UIColor{
    static var orangeLight = UIColor(red: 232/255, green: 140/255 , blue: 133/255 , alpha: 0.3)
}

class ViewController: UIViewController {
    
    let zapitiImageView:UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "ic_zapiti_first"))
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageview.contentMode = .scaleAspectFit
        
        return imageview
    }()
    
    let descriptionTextView:UITextView = {
        
        let textView = UITextView()
        
        let atributedText = NSMutableAttributedString(string: "Bem vindo ao meu portifolio de aplicativo iOS!",
                                                      attributes:
            [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        atributedText.append(NSAttributedString(string: "\n\n\nEsta preparado(a) para ver novidades , itens ,animações , aprendizado de um promissor programador mobile?\nVocê ira se surpreender com as possibilidades nativa de programar.",
                                                attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor:UIColor.gray]))
        
        textView.attributedText = atributedText
        
        //        textView.text = "Bem vindo ao meu portifolio de aplicativo iOS"
        //        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment =  .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pular", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Proximo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.orange, for: .normal)
        
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .orange
        
        
        pc.pageIndicatorTintColor = .orangeLight
        
        return pc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(zapitiImageView)
        view.addSubview(descriptionTextView)
        
        //iniciando componentes
        setupLayout()
        //iniciando botoes
        setupBottomConstrols()
        
    }
    
    
    func setupLayout(){
        //region <!Ajuste da imagem no topo!>
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        topImageContainerView.addSubview(zapitiImageView)
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                      multiplier: 0.5).isActive = true
        
        zapitiImageView.centerXAnchor.constraint(equalTo:
            topImageContainerView.centerXAnchor).isActive = true
        zapitiImageView.centerYAnchor.constraint(equalTo:
            topImageContainerView.centerYAnchor).isActive = true
        zapitiImageView.heightAnchor.constraint(equalTo:
            topImageContainerView.heightAnchor,multiplier: 0.8).isActive = true
        
        //endregion
        
        //region <!Descricao textview!>
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,constant : 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor,constant : -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:0).isActive = true
        //endregion
        
    }
    fileprivate func setupBottomConstrols(){
        //view.addSubview(previousButton)
        // previousButton.backgroundColor = .red
        //previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        //        let yellowView = UIView()
        //        yellowView.backgroundColor = .yellow
        //
        //        let greenView = UIView()
        //        greenView.backgroundColor = .green
        
        //        let blueView = UIView()
        //         blueView.backgroundColor = .blue
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        //bottomControlsStackView.axis = .vertical
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            //previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    
}



