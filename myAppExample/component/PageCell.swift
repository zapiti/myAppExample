//
//  PageCell.swift
//  myAppExample
//
//  Created by Nathan Ranghel on 12/10/18.
//  Copyright © 2018 Nathan Ranghel. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{

            guard let unwrappedPage = page  else {return}
            
            zapitiImageView.image = UIImage(named:  unwrappedPage.imageName)
            let atributedText = NSMutableAttributedString(string: unwrappedPage.headerText,
                                                          attributes:
                [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            atributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.contentText)",
                                                    attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor:UIColor.gray]))
            descriptionTextView.attributedText = atributedText
            descriptionTextView.textAlignment =  .center
   
        }
    }
    
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
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        
        return textView
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //iniciando componentes
        setupLayout()
        
  
    }
    
    
    func setupLayout(){
        //region <!Ajuste da imagem no topo!>
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo:topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo:leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo:trailingAnchor).isActive = true
        topImageContainerView.addSubview(zapitiImageView)
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor,
                                                      multiplier: 0.5).isActive = true
        
        zapitiImageView.centerXAnchor.constraint(equalTo:
            topImageContainerView.centerXAnchor).isActive = true
        zapitiImageView.centerYAnchor.constraint(equalTo:
            topImageContainerView.centerYAnchor).isActive = true
        zapitiImageView.heightAnchor.constraint(equalTo:
            topImageContainerView.heightAnchor,multiplier: 0.8).isActive = true
        
        //endregion
        
        //region <!Descricao textview!>
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor,constant : 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor,constant : -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor,constant:0).isActive = true
        //endregion

    }
   
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("nao foi inicializado")
    }
}
