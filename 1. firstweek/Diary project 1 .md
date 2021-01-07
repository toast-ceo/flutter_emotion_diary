# :blue_book: Flutter Project [EmotionDiary] 


<br>

## first week



<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/1.%20firstweek/first%20week%201.gif?raw=true"> <img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/1.%20firstweek/first%20week%202.gif?raw=true">



<hr>

### :clipboard: 폴더 정리 

프로젝트를 진행하며, 코드를 체계적으로 유지하기 위해 폴더 구조를 만들어 체계적으로 관리해야합니다.
따라서, 필자는 Root 디렉터리에 font와 image를 관리하기 위해 각 폴더를 만들어 주었습니다.  
그리고 코드의 주요한 골자를 포함하는 lib 디렉터리에서는 models, screens, service, utils, widgets 폴더로 나눌 수 있는데 필자는 models, ui(screens)로 써서 폴더를 정리했습니다. 

<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/1.%20firstweek/first%20week%20Folder.png?raw=true">


<hr>

### :clipboard: main()의 theme 설정 

ThemeData를 사용하여 메인의 color와 font를 설정
Provider에 대한 설명은 2주차에서 진행 

```dart

void main() {
  initializeDateFormatting().then((_) =>  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products(),),
      ],
      child: MaterialApp(
          title: 'one day diary',
          theme: ThemeData(
            fontFamily: 'Caveat',
            primaryColor: Colors.white,
          ),
          initialRoute: '/start',
          routes: {
            '/start': (context) => StartPage(),
            '/menu': (context) => MenuPage(),
          },
      ),
    ),
  ));
}

```

<hr>

### :clipboard: StartPage() 

StartPage()에서는 첫 페이지로써 MenuPage로 가는 부분만 구현

- 나중 로그인 페이지로 업데이트할 예정
- InkWell 위젯을 이용 
- Navigator.of(context).pushReplacementNamed을 사용하여 미리 스택을 정의한 후, Class를 넘겨줌으로 관리

```dart
InkWell(
              child: Text('Start',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
              onTap: ()=> Navigator.of(context).pushReplacementNamed('/menu'),
            ),
```

<hr>

### :clipboard: MenuPage()

- Record & Remind의 기능을 구현하기 위해 선택 버튼 위젯을 사용
- Provider의 데이터가 없을 땐, Remind의 버튼 비활성 (안보이게 함)



```dart
InkWell(
              child: Text('Start',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
              onTap: ()=> Navigator.of(context).pushReplacementNamed('/menu'),
            ),
```



<hr>


### :clipboard: RecordPage()

- ListviewBuilider를 통해 5개의 감정을 선택할 수 있는 버튼을 구현
- 5개의 감정은 List<Map<>>형태로 정의
- 해당 감정을 선택한 후 다음 클래스로 이동할 때, argument를 사용하여 선택된 감정의 정보를 넘겨줌
```dart
ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (images[index]['status'] == true) {
                              images[index]['status'] = false;
                              textCheck = false;
                            } else {
                              for (int a = 0; a < 5; a++) {
                                images[a]['status'] = false;
                              }
                              images[index]['status'] = true;
                              textCheck = true;
                              argumentIndex = index;
                            }
                          });
                        },
                        child: images[index]['status']
                            ? Card(
                                elevation: 0,
                                color: images[index]['color'],
                                child: Container(
                                  height: 250.0,
                                  width: 200.0,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 120.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16.0)),
                                          image: DecorationImage(
                                            alignment: Alignment.center,
                                            image: AssetImage(
                                              "images/${images[index]['image']}Girl.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 90.0,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${images[index]['image']}",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                elevation: 0,
                                child: Container(
                                  height: 250.0,
                                  width: 200.0,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 120.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            alignment: Alignment.center,
                                            image: AssetImage(
                                              "images/${images[index]['image']}Girl.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 90.0,
                                        alignment: Alignment.center,
                                        child: Text("${images[index]['image']}",
                                            style: TextStyle(fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    },
                  ),

```
argument Logic

```dart
InkWell(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                      '/record2',
                      arguments: images[argumentIndex]),
                ),
```

