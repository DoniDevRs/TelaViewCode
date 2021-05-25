//
//  IntroViewController.swift
//  TelaViewCode
//
//  Created by Doni Silva on 24/05/21.
//

import UIKit

final class IntroViewController: UIViewController{
    
    /// É melhor criar um enum com static, evitando magic numbers no código
    enum Metrics {
        static let fontSize: CGFloat = 16
        static let titleFont: CGFloat = 40
        static let margin: CGFloat = 20
        static let textFieldW: CGFloat = 60
        static let buttonH: CGFloat = 44
        static let radius: CGFloat = 8
    }
    
    /// É melhor criar um enum para evitar strings soltas no código
    
    enum Constants {
        static let passGenerate = "Gerador de Senhas"
        static let quantityPass = "Quantidade de Senhas: "
        static let totalCharacters = "Total de Caracteres: "
        static let useLowerCase = "Usar Letras Minúsculas: "
        static let useNumbers = "Usar Números: "
        static let makePass = "Gerar Senha"
    }
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel()
        label.text = Constants.passGenerate
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelQtdeSenhas: UILabel = {
        let label = UILabel()
        label.text = Constants.quantityPass
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tfSenhas: UITextField = {
        /// Se você vai suar constrains e autolayout você não precisa definir o frame da view
        //let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 400, height: 40))
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lbTotalCharacters: UILabel = {
        let label = UILabel()
        label.text = Constants.totalCharacters
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
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
        label.text = Constants.useLowerCase
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbNumeros: UILabel = {
        let label = UILabel()
        label.text = Constants.useNumbers
        label.font = UIFont.systemFont(ofSize: Metrics.fontSize)
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
        button.setTitle(Constants.makePass, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        /// Deixa o button mais redondo nas bordas
        button.layer.cornerRadius = Metrics.radius
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
    
    
    // MARK: - Adiconar Views
    
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
    
    
    // MARK: - Configurar Constraints
    
    private func constraintLabelTitle(){
        /// Você pode usar assim para ativar todas constraints, e evitar o uso de isActive = true
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metrics.margin),
            lbTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin),
            lbTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metrics.margin)
        ])
    }
    
    private func constraintLabelQtdeSenhas(){
        labelQtdeSenhas.centerYAnchor.constraint(equalTo: tfSenhas.centerYAnchor).isActive = true
        labelQtdeSenhas.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin).isActive = true
        labelQtdeSenhas.trailingAnchor.constraint(equalTo: tfSenhas.leadingAnchor, constant: -Metrics.margin).isActive = true
    }
    
    private func constraintTfSenhas(){
        tfSenhas.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: Metrics.margin).isActive = true
        tfSenhas.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin).isActive = true
        /// Como textfield não tem conteudo ou texto quando é renderizado, você precisa definir um width pra ele ou ancorar em margens de uma view maior
        tfSenhas.widthAnchor.constraint(equalToConstant: Metrics.textFieldW).isActive = true
    }
    
    private func constraintTotalCharacters(){
        lbTotalCharacters.centerYAnchor.constraint(equalTo: tfCharacters.centerYAnchor).isActive = true
        lbTotalCharacters.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin).isActive = true
        lbTotalCharacters.trailingAnchor.constraint(equalTo: tfCharacters.leadingAnchor, constant: -Metrics.margin).isActive = true
    }
    
    private func constraintTfCharacters(){
        tfCharacters.topAnchor.constraint(equalTo: tfSenhas.bottomAnchor, constant: Metrics.margin).isActive = true
        tfCharacters.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin).isActive = true
        /// Como textfield não tem conteudo ou texto quando é renderizado, você precisa definir um width pra ele ou ancorar em margens de uma view maior
        tfCharacters.widthAnchor.constraint(equalToConstant: Metrics.textFieldW).isActive = true
    }
    
    private func constraintLbLetrasMin(){
        lbLetrasMin.topAnchor.constraint(equalTo: tfCharacters.bottomAnchor, constant: Metrics.margin).isActive = true
        lbLetrasMin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin).isActive = true
        lbLetrasMin.trailingAnchor.constraint(equalTo: swLetrasMin.leadingAnchor, constant: -Metrics.margin).isActive = true
    }
    
    private func constraintSwLetrasMin(){
        swLetrasMin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin).isActive = true
        /// Você pode centralizar seu switch centralizado ao label de letras min
        swLetrasMin.centerYAnchor.constraint(equalTo: lbLetrasMin.centerYAnchor).isActive = true
    }
    
    private func constraintLbNumeros(){
        lbNumeros.topAnchor.constraint(equalTo: lbLetrasMin.bottomAnchor, constant: Metrics.margin).isActive = true
        lbNumeros.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin).isActive = true
        lbNumeros.trailingAnchor.constraint(equalTo: swUsarNumeros.leadingAnchor, constant: -Metrics.margin).isActive = true
    }
    
    private func constraintUsarNumeros(){
        swUsarNumeros.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin).isActive = true
        /// Você pode centralizar seu switch centralizado ao label de letras min
        swUsarNumeros.centerYAnchor.constraint(equalTo: lbNumeros.centerYAnchor).isActive = true
    }
    
    private func constraintBtGerarSenha(){
        btGerarSenha.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.margin).isActive = true
        btGerarSenha.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.margin).isActive = true
        btGerarSenha.heightAnchor.constraint(equalToConstant: Metrics.buttonH).isActive = true
        btGerarSenha.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.margin).isActive = true
    }
    
    
}
