//
//  TrainViewController.swift
//  Verregular
//
//  Created by ozinchenko.dev on 15/03/2024.
//

import UIKit
import SnapKit

final class TrainViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var pastSimpleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "Past Simple"
        
        return label
    }()
    
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "Past Participle"
        
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "Score: 0"
        
        return label
    }()
    
    private lazy var currentVerbCountLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "\(count + 1)/\(dataSource.count)"
        
        return label
    }()
    
    private lazy var pastSimpleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.delegate = self
        
        return field
    }()
    
    private lazy var participleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.delegate = self
        
        return field
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray5
        button.setTitle("Check".localized, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action: #selector(checkAction),
                         for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    private var currentVerb: Verb? {
        guard dataSource.count > count else { return nil }
        return dataSource[count]
    }
    
    private var count = 0 {
        didSet {
            infinitiveLabel.text = currentVerb?.infinitive.uppercased()
            currentVerbCountLabel.text = "\(count + 1)/\(dataSource.count)"
            pastSimpleTextField.text = ""
            participleTextField.text = ""
            checkButton.setTitle("Check".localized, for: .normal)
            checkButton.backgroundColor = .systemGray5
            tapCount = 0
        }
    }
    
    private var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var isFirstAttempt: Bool = true
    
    var tapCount: Int = 0 {
        didSet {
            if tapCount > 1 {
                isFirstAttempt = false
            } else {
                isFirstAttempt = true
            }
        }
    }
    
    private let edgeInsets = 30
    private let dataSource = IrregularVerbs.shared.selectedVerbs
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Train verbs".localized

        setupUI()
        hideKeyboardWhenTappedAround()
        
        infinitiveLabel.text = dataSource.first?.infinitive.uppercased()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unregisterForKeyboardNotification()
    }
    
    // MARK: - Private Methods
    @objc
    private func checkAction() {
        tapCount += 1
        if checkAnswer() {
            scoreCount()
            if currentVerb?.infinitive == dataSource.last?.infinitive {
                navigationController?.popViewController(animated: true)
            } else {
                count += 1
            }
            showFinalScore()
        } else {
            checkButton.backgroundColor = .red
            checkButton.setTitle("Try again".localized,
                                 for: .normal)
        }
    }
    
    private func checkAnswer() -> Bool {
        pastSimpleTextField.text?.lowercased() == currentVerb?.pastSimple.lowercased() &&
        participleTextField.text?.lowercased() == currentVerb?.participle.lowercased()
    }

    private func scoreCount() {
        if isFirstAttempt {
            score += 1
        }
    }
    
    private func showFinalScore() {
        if count + 1 == dataSource.count  {
            let alert = UIAlertController(title: "Train is finished", message: "Score: \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized, style: .default))
            self.present(alert, animated: true)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([scoreLabel,
                                 currentVerbCountLabel,
                                 infinitiveLabel,
                                 pastSimpleLabel,
                                 pastSimpleTextField,
                                 participleLabel,
                                 participleTextField,
                                 checkButton])
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(edgeInsets)
            make.trailing.equalToSuperview().inset(edgeInsets)
        }
        
        currentVerbCountLabel.snp.makeConstraints { make in
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(10)
            make.centerX.equalTo(infinitiveLabel.snp.centerX)
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleLabel.snp.makeConstraints { make in
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(60)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleTextField.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleLabel.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleTextField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleTextField.snp.makeConstraints { make in
            make.top.equalTo(participleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(participleTextField.snp.bottom).offset(100)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
    }
}

// MARK: - UITextFieldDelegate
extension TrainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if pastSimpleTextField.isFirstResponder {
            participleTextField.becomeFirstResponder()
        } else {
            scrollView.endEditing(true)
        }
        
        return true
    }
}

// MARK: - Keyboard Events
private extension TrainViewController {
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self,
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? CGRect else { return }
        
        scrollView.contentInset.bottom = frame.height + 50
    }
    
    @objc
    func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero - 50
    }
    
    func hideKeyboardWhenTappedAround() {
        let recognizer = UITapGestureRecognizer(target: self,
                                             action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(recognizer)
    }
    
    @objc
    func hideKeyboard() {
        scrollView.endEditing(true)
    }
}
