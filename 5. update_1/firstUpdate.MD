# :blue_book: Flutter Project [EmotionDiary] 

<br>

## first update



<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/5.%20update_1/GIF.gif?raw=true"> 

### :clipboard: 업데이트 내용 : 서버 구축

### 정보를 저장하는 부분에서 내부에 저장할지 서버에서 관리할지 고민하다 서버 구축 선택
- 서버에는 기존에 정보를 저장했던 것처럼, date, title, content, image의 정보가 있다. 이를 바탕으로 해당 감정의 색깔 로직을 구성
- 백엔드와 함께 작업. 필자는 HTTP통신의 Put& Delete,Get 사용 
- 추후, 로그인 기능 구현 예정. 현재는 일정 Id값이 있다 가정하여 구현시킴

#### 비동기로 서버 연결하는 부분 

```dart
   Future fetchPost() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(server); //server은 서버주소 값
    var temp = jsonDecode(response.body);
    return temp['data']['body']; // 서버에서 요청한 값
  }
```
<hr>

#### 데이터를 서버에 추가시키는 로직

- Http.Put 요청을 통해 서버에 데이터를 추가시킴 

```dart
  void addText(Map<String, dynamic> data) async {
    String bodyF = jsonEncode(data);
    http.Response response = await http.put(
      server,
      body: bodyF,
    );
    if (response.statusCode == 200) {
      print("성공");
    } else {
      print("실패");
    }
    notifyListeners();
  }

```

<hr>

#### 데이터를 서버에 삭제시키는 로직

- 데이터를 서버에서 하나하나 찾아 삭제하는 것이 어려워, 해당 일기의 데이터와 모든 것이 일치할 경우 삭제 요청

```dart
  void removeText(Map removeData) async {
    final client = http.Client();
    String bodyF = jsonEncode(removeData);

    try {
      http.StreamedResponse response = await client
          .send(http.Request("DELETE", Uri.parse(server))..body = bodyF);
      if (response.statusCode == 200) {
        print("성공");
      } else {
        print("실패");
      }
    } finally {
      client.close();
    }
    notifyListeners();
  }
```

<hr>


### :clipboard: 남여 테마 결정하기

- Provider를 이용하여 선택시 테마가 바뀔 수 있게 구성



### :clipboard: 보완할 점

- 로그인 기능 활성화
- 스크린 디자인 & UX를 고려해서 기능들을 배치하기
- 앱 배포를 위한 준비하기



