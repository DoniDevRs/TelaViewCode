//
//  IntroViewController.swift
//  TelaViewCode
//
//  Created by Doni Silva on 24/05/21.
//

import UIKit

final class IntroViewController: UIViewController{
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.text = "Gerador de Senhas"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelQtdeSenhas: UILabel = {
        let label = UILabel()
        label.text = "Quantidade de Senhas: "
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tfSenhas: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 400, height: 40))
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lbTotalCharacters: UILabel = {
        let label = UILabel()
        label.text = "Total de Caracteres: "
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tfCharacters: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lbLetrasMin: UILabel = {
        let label = UILabel()
        label.text = "Usar Letras Minúsculas: "
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbNumeros: UILabel = {
        let label = UILabel()
        label.text = "Usar Números: "
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var swLetrasMin: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .purple
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var swUsarNumeros: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .purple
        sw.isOn = true
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var btGerarSenha: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .purple
        button.setTitle("Gerar Senha", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubView()
        constraintLabelTitle()
        constraintLabelQtdeSenhas()
        constraintTfSenhas()
        constraintTotalCharacters()
        constraintTfCharacters()
        constraintLbLetrasMin()
        constraintSwLetrasMin()
        constraintLbNumeros()
        constraintUsarNumeros()
        constraintBtGerarSenha()
        
    }
    
    
    //Adiconar Views
    private func addSubView(){
        view.addSubview(lbTitle)
        view.addSubview(labelQtdeSenhas)
        view.addSubview(tfSenhas)
        view.addSubview(lbTotalCharacters)
        view.addSubview(tfCharacters)
        view.addSubview(lbLetrasMin)
        view.addSubview(swLetrasMin)
        view.addSubview(lbNumeros)
        view.addSubview(swUsarNumeros)
        view.addSubview(btGerarSenha)
    }
    
    
    //Condigurar Constraints
    private func constraintLabelTitle(){
        lbTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        lbTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
    }
    
    private func constraintLabelQtdeSenhas(){
        labelQtdeSenhas.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 20).isActive = true
        labelQtdeSenhas.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
    }
    
    private func constraintTfSenhas(){
        tfSenhas.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 20).isActive = true
        tfSenhas.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 135).isActive = true
        
    }
    
    private func constraintTotalCharacters(){
        lbTotalCharacters.topAnchor.constraint(equalTo: labelQtdeSenhas.bottomAnchor, constant: 25).isActive = true
        lbTotalCharacters.leadingAnchor.constraint(equalTo: labelQtdeSenhas.leadingAnchor).isActive = true
    }
    
    private func constraintTfCharacters(){
        tfCharacters.topAnchor.constraint(equalTo: tfSenhas.bottomAnchor, constant: 10).isActive = true
        tfCharacters.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 135).isActive = true
    }
    
    private func constraintLbLetrasMin(){
        lbLetrasMin.topAnchor.constraint(equalTo: lbTotalCharacters.bottomAnchor, constant: 25).isActive = true
        lbLetrasMin.leadingAnchor.constraint(equalTo: lbTotalCharacters.leadingAnchor).isActive = true
  
    }
    
    private func constraintSwLetrasMin(){
        swLetrasMin.topAnchor.constraint(equalTo: tfCharacters.bottomAnchor, constant: 10).isActive = true
        swLetrasMin.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 135).isActive = true
        swLetrasMin.centerXAnchor.constraint(equalTo: lbLetrasMin.centerXAnchor).isActive = true
    }
    
    private func constraintLbNumeros(){
        lbNumeros.topAnchor.constraint(equalTo: lbLetrasMin.bottomAnchor, constant: 25).isActive = true
        lbNumeros.leadingAnchor.constraint(equalTo: lbLetrasMin.leadingAnchor).isActive = true
    }
    
    private func constraintUsarNumeros(){
        swUsarNumeros.topAnchor.constraint(equalTo: swLetrasMin.bottomAnchor, constant: 10).isActive = true
        swUsarNumeros.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 135).isActive = true
    }
    
    private func constraintBtGerarSenha(){
        btGerarSenha.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        btGerarSenha.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        btGerarSenha.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btGerarSenha.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    }
    
    
}
