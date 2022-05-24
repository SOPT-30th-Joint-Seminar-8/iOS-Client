//
//  PostViewController.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/17.
//
 
import UIKit

class PostViewController: UIViewController {

    // MARK: - @IBOutlet Part
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var successBtn: UIButton!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderUI()
        postTextView.delegate = self
//        addKeyboardNotification()
    }
    
    // MARK: - Custom Method Part
    private func configureHeaderUI(){
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        headerView.layer.shadowOpacity = 0.1
        headerView.layer.zPosition = 1
        successBtn.backgroundColor = UIColor(rgb: 0xEFC3BC)
        successBtn.tintColor = UIColor(rgb: 0xFFFFFF)
        successBtn.layer.cornerRadius = 7
    }
    
    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillShow),
          name: UIResponder.keyboardWillShowNotification,
          object: nil
        )
        
        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillHide),
          name: UIResponder.keyboardWillHideNotification,
          object: nil
        )
      }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keybaordRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keybaordRectangle.height
          print("키보드의 높이: \(keyboardHeight)")
          print("footerView의 높이(변경전) : \(footerView.frame.origin.y)")
        footerView.frame.origin.y -= keyboardHeight
          print("footerView의 높이 : \(footerView.frame.origin.y)")
      }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            footerView.frame.origin.y += keyboardHeight
        }
    }
    
    // MARK: - @IBAction Part
    @IBAction func successBtnTap(_ sender: Any) {
        let storyboard: UIStoryboard? = UIStoryboard(name: "PostDetail", bundle: Bundle.main)
        guard let postDetailVC = storyboard?.instantiateViewController(identifier: "PostDetail") as? PostDetailViewController else {
            return
        }
        
        postDetailVC.modalPresentationStyle = .fullScreen
        postDetailVC.postText = postTextView.text
        self.present(postDetailVC, animated: true)
    }
    
}

// MARK: - Extension Part
extension PostViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        successBtn.backgroundColor = UIColor(rgb: postTextView.hasText ? 0xED6653 :0xEFC3BC)
    }
}
