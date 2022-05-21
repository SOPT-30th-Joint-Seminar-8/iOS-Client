# iOS-Client
🔥 클 디 합 동 세 미 나 8 조 🔥 - 커리어리 (ㅇㅅㅈ팀에 눈치 없이 낀 ㅇㅎㅈ)

</br>

### 👩🏻‍💻 Developers

|안현주|이소진|이세진|
|---|---|---|
|<img width="300" src="https://user-images.githubusercontent.com/62981652/169638826-f739f276-2099-4d54-9c6c-3b1042e5681b.png"> |<img width="300" src="https://user-images.githubusercontent.com/62981652/169638836-6b6c5b97-cbf9-446f-9c50-f4920c18bb2e.png"> |<img width="300" src="https://user-images.githubusercontent.com/62981652/169638830-a8eca792-01e5-4fc8-be62-a6bd783b97aa.png">|
||||



</br>

### 👀 Simulator

|메인뷰|게시글상세뷰|
|---|---|---|
||||

</br>

### 🛠 Development Environment

<img width="77" alt="스크린샷 2021-11-19 오후 3 52 02" src="https://img.shields.io/badge/iOS-15.0+-silver"> <img width="93" alt="스크린샷 2021-11-19 오후 3 52 02" src="https://img.shields.io/badge/Xcode-13.3.1-blue">

</br>


### 🎁 Library

| 라이브러리        |       |
| ----------------- | ----- |
| Alamofire           | `PodFile` |
| KingFisher           | `PodFile` |



</br>

### 🗂 Foldering

<img width="258" alt="스크린샷 2022-05-21 오후 3 25 53" src="https://user-images.githubusercontent.com/62981652/169638977-b86c5290-a65d-40d1-9cf5-81c1e41da8f4.png">



</br>

### 🔀 Git Branch

Branch를 생성하기 전 Issue를 먼저 작성한다.
Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch의 이름을 결정한다. 

`<Prefix>/<Issue_Number>-<Description>` 의 양식을 따른다.

- `main` : 개발이 완료된 산출물이 저장될 공간
- `develop` : feature 브랜치에서 구현된 기능들이 merge될 브랜치. default
- `feature` : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다
- `fix` : 버그 수정하는 브랜치


</br>

### 👊🏻 Git Flow

1. dev 브랜치를 파서 dev를 default 브랜치로 한다 // merge를 main이 아닌 dev로 할 예정
2. issue를 만들고 // 기능이나 작업 단위로
3. 해당 issue 브랜치에 해당하는 브랜치를 판다 여기서!!!! 브랜치 생성 형태는 
//feature/3-photoCV --> 이런식으로 해서 어떤 개발 작업인지/이슈번호-정확하게 어떤뷰
4. commit은 큰 기능들이 완료 될때마다 한다 (깃 꼬일때 되돌리기 편할라면..ㅎ)
5. PR을 작성하고, 작성자 외의 팀원들을 리뷰어에 추가한다.
6. 코드 리뷰가 완료되고 1명 이상이 approve 하면 dev 브랜치로 merge한다
7. 다른 팀원들은 merge된 작업물을 pull 하고 각자 작업

*꼭 지켜줘야할것*
pr을 날리기전에 꼭 dev 브랜치(디폴트브랜치)의 내용을 pull 하고 내 로컬 컴퓨터에서 conflict 해결해주세요!!
그리고 꼭 push 날리기 전에 Xcode에서 실행 제대로 되는지 확인하고 Push 해주삼
*** project 어쩌구 파일 충동이면 현주 Call 하기 ***


</br>

### ⚠️ Issue Naming Rule

`[<PREFIX>] <Description>` 의 양식을 준수하되, Prefix는 협업하며 맞춰가기로 한다.
또한 Prefix는 대문자를 사용한다.

```
[FEAT] 회원가입 구현
[DEBUG] MainActivity 버그 수정
[STYLE] 폰트 변경
```

</br>

### 🍗 Commit Message Convention

- `[Fix]` : 버그, 오류 해결
- `[Chore]`: 코드 수정, 내부 파일 수정
- `[Correct]` : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- `[Add]` : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View 생성
- `[Feat]` : 새로운 기능 구현
- `[Del]` : 쓸모없는 코드 삭제
- `[Docs]` : README나 WIKI 등의 문서 개정
- `[Mod]` : storyboard 파일만 수정한 경우
- `[Move]` : 프로젝트 내 파일이나 코드의 이동
- `[Rename]` : 파일 이름 변경이 있을 때 사용합니다.
- `[Improve]` : 향상이 있을 때 사용합니다.
- `[Refactor]` : 전면 수정이 있을 때 사용합니다


```
[#이슈번호] 해당 커밋 요약

### Description
- 커밋 상세내용 1
- 커밋 상세내용 2

Resolve #이슈번호
```


</br>


### ✔️ MARK 
```
// MARK: - Vars & Lets Part
// MARK: - @IBOutlet Part
// MARK: - Life Cycle Part
// MARK: - @IBAction Part
// MARK: - Custom Method Part
// MARK: - @objc Function Part
// MARK: - Extension Part
```

### 🌀 Code Covention

[StyleShare/swift-style-guide](https://github.com/StyleShare/swift-style-guide) 를 기본으로 따르고 필요에 따라 추가한다.
