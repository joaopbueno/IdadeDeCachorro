//
//  ViewController.swift
//  IdadeDeCachorro
//
//  Created by João Bueno on 17/10/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dogImage")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    } ()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite a idade do seu cachorro, para descobrir a idade em anos humanos."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    } ()
    
    private lazy var idadeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Digite a idade..."
        textField.keyboardType = .numberPad
        textField.textColor = UIColor(named: "greyColor")
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        
        return textField
    } ()
    
    private lazy var calculaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular Idade", for: .normal)
        button.backgroundColor = UIColor(named: "seconderyColor")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculaIdade), for: .touchUpInside)
        
        return button
    } ()
    
    @objc func calculaIdade() {
        if let texto = idadeTextField.text, let valor = Int(texto) {
            let idadeHumano = valor * 7
            
            idadeLabel.text = (idadeLabel.text ?? "") + " \(idadeHumano)"
        } else {
            print("Valor inválido ou o campo está vazio.")
            
            
        }
        
    }
    
    private lazy var idadeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A idade do seu cachorro é: "
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "primaryColor")
        
        setupView()
    }

    
    private func setupView() {
        setHierarchy()
        
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(iconImageView)
        view.addSubview(descLabel)
        view.addSubview(idadeTextField)
        view.addSubview(calculaButton)
        view.addSubview(idadeLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            iconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            iconImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            iconImageView.heightAnchor.constraint(equalToConstant: 220),
            
            descLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 30),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            idadeTextField.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 50),
            idadeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idadeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idadeTextField.heightAnchor.constraint(equalToConstant: 50),
            
            calculaButton.topAnchor.constraint(equalTo: idadeTextField.bottomAnchor, constant: 60),
            calculaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            calculaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            calculaButton.heightAnchor.constraint(equalToConstant: 80),
            
            idadeLabel.topAnchor.constraint(equalTo: calculaButton.bottomAnchor, constant: 40),
            idadeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            idadeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
        ])
    }

}

