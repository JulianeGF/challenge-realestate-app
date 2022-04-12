//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {
    
    let loginApiClient = LoginAPIClient()

    let propertyListView: PropertyListView = {

        let propertyListView = PropertyListView()
        return propertyListView
    }()

    let apiClient = RealEstateAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Real Estate App 🏡"

        self.view.backgroundColor = .white

        fetchProperties()
        let logimodel = loginApiClient.pegaloginmodel()
        logimodel?.success
    }

    override func loadView() {
        self.view = propertyListView
    }

    func fetchProperties() {
        apiClient.fetchProperties { [weak self] result in
            guard let self = self else { return }
            //passar os dados para a PropertyListView
        }
    }
}

