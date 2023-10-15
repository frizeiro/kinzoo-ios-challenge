//
//  CharactersViewController.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import UIKit
import NiceTable

class CharactersViewController: NiceCollectionViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Do any additional setup after loading the view.

//        DataSource.shared.character.fetch(page: 1, name: "Steve Jobs Rick").done { response in
//            print(response)
//        }.catch { error in
//            print(error)
//        }.finally {
//            print("bbbb")
//        }

        
//        DataSource.shared.character.fetch(page: 1, name: "Steve Jobs Rick").done { response in
//            print(response)
//        }.catch { error in
//            print(error)
//        }.finally {
//            print("bbbb")
//        }
        
        DataSource.shared.character.detail(id: 100).done { response in
            print(response)
        }.catch { error in
            print(error)
        }.finally {
            print("bbbb")
        }
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        // TODO: Add to localizeble
        title = "RNM Universe"
        
        collectionView?.itemsSize = .estimatedProportional(width: 170, proportionalHeight: 1)
    }


}

