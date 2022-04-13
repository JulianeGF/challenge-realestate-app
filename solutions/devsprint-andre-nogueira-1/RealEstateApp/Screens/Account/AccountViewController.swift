//
//  AccountViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 06/12/21.
//

import UIKit

final class AccountViewController: UIViewController {
    
    private lazy var accountView: AccountView = {
        let view = AccountView()
        view.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        view.forgotButton.addTarget(self, action: #selector(forgotPressed), for: .touchUpInside)
        
        return view
    }()
    
    private var viewModel: AccountViewModelProtocol?
    
    init(viewModel: AccountViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
        configureViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = accountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureViewModel() {
        viewModel?.didLogin = { result in
            dump(result)
        }
        viewModel?.didForgot = { result in
            dump(result)
        }
    }
    
    @objc func loginPressed(){
        viewModel?.doLogin()
    }
    
    @objc func forgotPressed(){
        viewModel?.doForgot()
    }
}
