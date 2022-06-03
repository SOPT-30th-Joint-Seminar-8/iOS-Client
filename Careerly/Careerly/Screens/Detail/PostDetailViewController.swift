//
//  PostDetailViewController.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/17.
//

import UIKit

class PostDetailViewController: UIViewController {
  // MARK: - @IBOutlet Part
  @IBOutlet weak var commentTextField: UITextField!
  @IBOutlet weak var submitBtn: UIButton!
  @IBOutlet weak var postTableView: UITableView!
  
  // MARK: - Vars & Lets Part
  var model: Post?
  var commentData : [CommentModel] = []
  var postText : String?
  var writeBool: Bool?
  
  
  
  // MARK: - Life Cycle Part
  override func viewDidLoad() {
    super.viewDidLoad()
    addNotiObserver()
    configureUI()
    setUpTextField()
    registerNib()
    setUpDelegate()
    setTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    //postid
    tabBarController?.tabBar.isHidden = true
  }
  
  // MARK: - Custom Method Part
  private func addNotiObserver(){
    print("된건가4")
    NotificationCenter.default.addObserver(self, selector: #selector(getPostID), name: Notification.Name("notiData"), object: nil)
    print("된건가 최종")
  }

  private func registerNib(){
    let postNib = UINib(nibName: PostDetailTVC.identifier, bundle: nil)
    postTableView.register(postNib, forCellReuseIdentifier: PostDetailTVC.identifier)
    let commentNib = UINib(nibName: PostCommentTVC.identifier, bundle: nil)
    postTableView.register(commentNib, forCellReuseIdentifier: PostCommentTVC.identifier)
  }
  
  private func setUpDelegate(){
    postTableView.dataSource = self
  }
  
  private func setTableView(){
    postTableView.rowHeight = UITableView.automaticDimension
    postTableView.estimatedRowHeight = 500
  }
  
  private func configureUI(){
    submitBtn.backgroundColor = UIColor(rgb: 0xEFC3BC)
    submitBtn.tintColor = UIColor(rgb: 0xFFFFFF)
    submitBtn.layer.cornerRadius = 7
  }
  
  private func setUpTextField(){
    commentTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
  }
  
  @objc func textFieldEditingChanged(_ textField: UITextField) {
    submitBtn.isEnabled = commentTextField.hasText
    submitBtn.backgroundColor = UIColor(rgb: commentTextField.hasText ? 0xED6653 :0xEFC3BC)
  }
  
  // MARK: - @IBAction Part
  @IBAction func submitBtnTap(_ sender: Any) {
    guard let commentText = commentTextField.text, let postId = model?.postId else { return }
    postComment(postId: postId, contents: commentText)
  }
  
  
  @objc func getPostID(notification : NSNotification){
    print("된건가5")
      if let text = notification.object as? String{
        print("된건가6")
        getComments(postId: text)
        
      }
    }
}

// MARK: - Extension Part
extension PostDetailViewController: UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 1 : commentData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section{
    case 0:
      if writeBool == true {
        guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostDetailTVC.identifier, for: indexPath) as? PostDetailTVC else { return UITableViewCell() }
        cell.setWriteData(PostDetailModel(postText: postText ?? ""))
        return cell
      } else {
        guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostDetailTVC.identifier, for: indexPath) as? PostDetailTVC else { return UITableViewCell() }
        guard let model = model else { return UITableViewCell() }
        cell.setData(model)
        return cell
      }
    case 1:
      guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostCommentTVC.identifier, for: indexPath) as? PostCommentTVC else { return UITableViewCell() }
      cell.setData(commentData[indexPath.row])
      return cell
    default:
      return UITableViewCell()
    }
  }
  
}


//MARK: - API

extension PostDetailViewController {
  func postComment(postId: String, contents: String) {
    CommentService.shared.postComment(postId: postId, contents: contents) { response in
      switch response {
      case .success(_):
        self.commentData.append(CommentModel(postId: postId, text: contents))
        self.commentTextField.text?.removeAll()
        self.postTableView.reloadData()
      case .requestErr(let data):
        print(data)
      case .pathErr(let data):
        print(data)
      case .serverErr:
        print("Server Error")
      case .networkFail:
        print("Network Fail")
      }
    }
  }
  
  func getComments(postId:String) {
    CommentService.shared.getComments(postId: postId) { response in
      switch response {
      case .success(let data):
          guard let data = data as? BaseResponse<GetCommentModel> else { return }
          guard let getData = data.data else { return }
          
        print("되는건가2")
        //아마 데이터 연달아서 올거라 반복문써서 append 해야할거임..!
        let postId = postId
        let text = getData.text
        
        self.commentData.append(CommentModel(postId: postId, text: text))
        self.commentTextField.text?.removeAll()
        print("되는건가10")
        self.postTableView.reloadData()
        
      case .requestErr(let data):
        print(data)
      case .pathErr(let data):
        print(data)
      case .serverErr:
        print("Server Error")
      case .networkFail:
        print("Network Fail")
      }
    }
  }
}
  
