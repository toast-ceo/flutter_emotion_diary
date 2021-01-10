# :blue_book: Flutter Project [EmotionDiary] 

<br>

## fourth week


<hr>

<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/4.%20forthweek/SmartSelectImage_2021-01-10-15-56-42.png?raw=true"> 

- 앞선, remindPage Class에서 해당 데이터의 날짜나 데이터의 숫자를 나타내주었다면 본 page Calss에서는 그 데이터의 내용을 출력해줌


### :clipboard: 출력page

- 전의 방식과 같이 argument를 이용하여 remindPage에서 정보를 가져옴

```dart
  final Map args = ModalRoute.of(context).settings.arguments;
```

- args변수를 활용하여 screen을 구성해줌

```dart
Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      args['title'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'NanumPenScript'),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 120.0,
                      height: 120.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(
                            "images/${args['image']}Girl.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      args['content'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'NanumPenScript'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
```

<hr>



### :clipboard: 보완할 점, 추가하고 싶은 점, 궁금한 점

#### :pushpin: 보완할 점 : 1. 정보를 저장하는 부분 구현이 아직 X

- 백엔드 개발자와 서버 구현 후, 보완할 예정
- 차선책 : shared_preferences Package를 이용


#### :pushpin: 보완할 점 : 2. 전체적인 테마 구성

- 현재, 감정의 색깔, 전체적인 테마의 색 구성이 확정 X, 또한 블랙, 화이트 테마로 나누고 캐릭터의 남녀 테마를 만들고 싶음


#### :pushpin: 추가할 점 : 3. 사진 기능 추

-  Camera Package를 이용하여 사진들도 저장하는 기능 추가

#### :pushpin: 궁금한점 : 4. remindPage(데이터의 날, 갯수를 보여주는 부분)의 감정 선택 부분 Logic

- PopupMenu위젯을 통해 감정을 선택시키고, 논리 연산을 이용하여 페이지를 구현. 하지만 ListView.builder의 한계가 있는 듯함. 공부 필요

<hr>

