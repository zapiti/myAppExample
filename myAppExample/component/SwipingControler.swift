//
//  SwipingControler.swift
//  myAppExample
//
//  Created by Nathan Ranghel on 12/10/18.
//  Copyright © 2018 Nathan Ranghel. All rights reserved.
//

import UIKit


struct Page {
    let imageName : String
    let headerText : String
    let colorPage : UIColor
    let contentText : String

}


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "ic_zapiti_first", headerText:  "Bem vindo ao meu portifolio de aplicativo iOS!",colorPage : .orange, contentText : "Esta preparado(a) para ver novidades , itens ,animações , aprendizado de um promissor programador mobile?\nVocê ira se surpreender com as possibilidades nativa de programar."),
        
        Page(imageName: "ic_zapiti_second", headerText: "A possibilidade desenvolver utilizando o Objective-C, contudo, o Swift é a linguagem mais recente/moderna, a sucessora do Objective-C.",colorPage : .yellow, contentText :  "A sintaxe da Swift é simples e eficiente, além de sua escrita ser limpa, permitindo que possamos produzir mais em menos linhas de código. Além disso, possui muitas semelhanças com outras linguagens de programação fazendo com que desenvolvedores se sintam a vontade com sua sintaxe. "),
        
        Page(imageName: "ic_zapiti_third", headerText: "A linguagem da Apple chamada Swift está cada vez mais sendo utilizada.",colorPage : .blue,contentText :  "A Swift possui conceitos que as linguagens de programação modernas podem oferecer: é type safe, usa o conceito de Optionals para tratar valores nulos, não exige ponto-e-vírgula ao final de cada linha, possui um melhor gerenciamento de memória, trabalha com closures, generics, tuplas, subscripts, entre outros."),
        
        Page(imageName: "ic_zapiti_fourth", headerText: "As vantagens de programar por hobby",colorPage : .purple, contentText :  "A meu ver, existem várias vantagens em fazer um projeto próprio, como poder criar sem ter a pressão de concluir o trabalho, poder experimentar novas tecnologias, mudar o rumo graças às novas ideias e até mesmo conversar com outras pessoas sobre o projeto, sem o problema de confidencialidade. Quando a pessoa só programou no trabalho, talvez tenha deixado de lado uma das partes mais legais de desenvolver, que é ver um “filho” seu nascer e crescer.")
    ]
    
    
    let previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pular", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handleMain), for: .touchUpInside)
        return button
    }()
    
  let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Proximo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)

        button.setTitleColor(.orange, for: .normal)
    
        return button
    }()
    
    @objc func handleNext(){
        
        let nextIndex = min(pageControl.currentPage + 1,pages.count - 1)
        let indexPath = IndexPath(item: nextIndex,section : 0 )
        pageControl.currentPage = nextIndex
        
        previsButtonActive(max(nextIndex ,0))
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handleMain(){
        print("Vai pra main")
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = .orangeLight
        
        return pc
    }()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //iniciando e colorindo layout
        setupBottomConstrols()
        collectionView.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
     
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }else{
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        },completion: nil)
        collectionViewLayout.invalidateLayout()
    }
    
    
    fileprivate func previsButtonActive(_ index: Int) {
        if index == 0 {
            previousButton.setTitle("Pular", for: .normal)
            previousButton.isEnabled = true
        }
        else {
            previousButton.setTitle("", for: .normal)
            previousButton.isEnabled = false

        }
        if (index != min(pages.count + 1,pages.count - 1)){
            nextButton.setTitle("Proximo", for: .normal)
            nextButton.removeTarget(self, action: #selector(handleMain), for: .touchUpInside)
        }else{
            nextButton.setTitle("Continuar", for: .normal)
            nextButton.addTarget(self, action: #selector(handleMain), for: .touchUpInside)
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
 
        let x = targetContentOffset.pointee.x
        let index =  Int(x / view.frame.width)
        pageControl.currentPage = index
        
        previsButtonActive(index)
        
     
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page: Page = pages[indexPath.item]

        
        cell.page = page
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
