# :blue_book: Flutter Project [EmotionDiary] 

<br>

## third week


<hr>

<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/3.%20thirdweek/GIF.gif?raw=true"> 

### :clipboard: 1. 입력된 데이터를 바탕으로 달력패키지를 활용해서 나타내기

- 달력패키지는 [:open_book:](https://github.com/toast-ceo/flutter_cording/blob/main/Memo/Flutter_Calendar.md) 참고
- 달력패키지를 통해 들어온 데이터를 각 달력과 리스트 뷰로 뿌려줌
- 달력에다 뿌리는 것은 달력패키지에서 설명

<hr>

<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/3.%20thirdweek/GIF1.gif?raw=true"> 

#### :pushpin:ListView 부분

```dart
ListView.builder(
        itemCount: _selectedEvents.length,//선택된 날(Key값)의 리스트의 수 
        itemBuilder: (context, index){
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.8),
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
            child: Row(
              children: [
                FlatButton(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.width * 0.22,
                          alignment: Alignment.center,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(2.0)),
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage(
                                  "images/${_selectedEvents[index]['image']}Girl.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ), //그림
                        Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${_selectedEvents[index]['title']}",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontFamily: "NanumPenScript"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${_selectedEvents[index]['date']}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    print(_selectedEvents[index].hashCode);
                    Navigator.pushReplacementNamed(context, "/todayDiary",
                        arguments: _selectedEvents[index]);
                  },
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(Icons.cancel_outlined),
                        iconSize: 20,
                        color: Colors.grey,
                        onPressed: () {
                          cancelCheckDialog(context,  index, _selectedEvents[index]);
                        }),
                  ],
                )
              ],
            ),
          );
        }
    );
```
<hr>

### :clipboard: 2. 데이터를 감정별로 나타내기

<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/3.%20thirdweek/gif2.gif?raw=true"> 

#### :pushpin: 핵심 로직

- 해당 감정을 선택하기위한 PopupMenu 위젯

- List를 만들어줌

```dart
 List _options = ['happy', 'blue', 'unknown', 'mood', 'angry', 'all'];
```


```dart
PopupMenuButton(
              icon: Icon(
                Icons.format_list_bulleted,
                size: 28,
                color: Colors.grey,
              ),
              itemBuilder: (BuildContext bc) {
                return _options
                    .map((emotion) => PopupMenuItem(
                          child: Text(
                            emotion,
                            style: TextStyle(fontSize: 25),
                          ),
                          value: emotion,
                        ))
                    .toList();
              },
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              }),
```

- 앞서 선택한 감정을 비교해서 나타내는 로직

```dart
userListData[index]['image'] == selectedItem || selectedItem =='all'
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2),
                    child: Row(
                      children: [
                        FlatButton(
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.width * 0.22,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.0)),
                                      image: DecorationImage(
                                        alignment: Alignment.center,
                                        image: AssetImage(
                                          "images/${userListData[index]['image']}Girl.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ), //그림
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${userListData[index]['title']}",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.black,
                                            fontFamily: "NanumPenScript"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${userListData[index]['date']}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            print(userListData[index]['emotionState'] == selectedItem);
                            Navigator.pushReplacementNamed(
                                context, "/todayDiary",
                                arguments: userListData[index]);
                          },
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                iconSize: 20,
                                color: Colors.grey,
                                onPressed: () {
                                  cancelCheckDialog(
                                      context, index, userListData[index]);
                                }),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(child: Center(child: Text("해당 감정이 없어요"),),);
```

<hr>

### :clipboard: 해당 데이터를 삭제하고 싶을 때, AlertDialog 활용

#### AlertDialog를 활용한 삭제 핵심 로직

- AlertDialog위젯 부분

```dart

AlertDialog(
	shape: RoundedRectangleBorder(),//AlertDialog 모양
	title: Column(),//AlertDialog제목
	content: Column(),//AlertDialog내용부분
	actions: <Widget>[Row(),],//AlertDialog의 버튼
);

```

- 삭제할 때 데이터 처리 로직

```dart
 void removeText(DateTime data, int removeIndex, Map removeData) {
    String checkKey = DateFormat('yyyyMMdd').format(data);
    if (userAllData.containsKey(checkKey) == true) {
      print("성공");
      for(int a=0; a< userAllData[checkKey].length;a++){
        if(userAllData[checkKey][a] == removeData){
          userAllData[checkKey].removeAt(a);
        }
      }
    }
    notifyListeners();
  }
```

<hr>


