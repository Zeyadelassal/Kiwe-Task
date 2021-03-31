//
//  ProfileViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import UIKit


protocol ProfileViewProtocol {
    
}


class ProfileViewController: UIViewController, ProfileViewProtocol{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var presenter : ProfilePresenterProtocol?
    var userMail : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xF9F9F9)
        presenter = ProfilePresenter(view: self)
        presenter?.getUser(mail: userMail)
        setupView()
    }
    
    func setupView(){
        guard let presenter = presenter else {return}
        nameLabel.text = "NAME: \(presenter.getUserName())"
        emailLabel.text = "EMAIL: \(presenter.getUserEmail())"
        ageLabel.text = "AGE: \(presenter.getUserAge())"
    }
}
