# :blue_book: Flutter Project [EmotionDiary] 

<br>

## second week


<hr>

<img width = "200" src = "https://github.com/toast-ceo/flutter_emotion_diary/blob/progress/2.%20secondweek/screen.png?raw=true"> 

### :clipboard: TextFormField 위젯을 이용한 스크릿 구현

#### 앞서, argument로 넘겨준 데이터를 Map의 형태로 받아줌

```dart
   final Map args = ModalRoute.of(context).settings.arguments;
```

변수 args에 받은 데이터들을 바탕으로 Screen을 구성하고 TextFomField 위젯을 활욯한다


#### :open_book: title 입력 TextFormField
```dart
  TextFormField(
                      controller: _titleCotroller,
                      cursorColor: Colors.grey,
                      textAlign: TextAlign.center, 
                      maxLength: 15, // 글자 수를 15개로 제한
                      maxLines: 1, // 보여지는 글자 line을 1개로 설정

		//키보드에 -> 버튼을 만들어 content를 입력하는 부분으로 넘어갈 수 있게하는 로직
                      textInputAction: TextInputAction.next,
                      focusNode: _titleFocus,
                      onFieldSubmitted: (term) {
                        _fieldFocusChange(context, _titleFocus, _contentFocus);
                      },

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, bottom: 10, top: 10, right: 10),
                          hintText: "Title",
                          hintStyle: TextStyle(fontSize: 20, letterSpacing: 2),
                        counterStyle: TextStyle(fontSize: 12,  fontFamily: 'NanumMeongjo',)
                      ),
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NanumPenScript',
                      ),
		//다음 class로 넘어가기 위해 확인해주는 Logic
                      onChanged: (value){
                        setState(() {
                          if(value.length< 16&&value.isNotEmpty){
                            titleCheck = true;
                          }else{
                            titleCheck = false;
                          }
                        });
                      },
                    ),
```

#### :open_book: content 입력 TextFormField
```dart
TextFormField(
                      controller: _contentController,
                      cursorColor: Colors.grey,
                      textAlign: TextAlign.center,
                      minLines: 15,
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                      focusNode: _contentFocus,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, bottom: 10, top: 10, right: 10),
                          hintText: "Content",
                          hintStyle: TextStyle(fontSize: 22, letterSpacing: 2)),
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NanumPenScript',
                      ),
                      onChanged: (value){
                        setState(() {
                          if(value.isNotEmpty){
                            contentCheck = true;
                          }else{
                            contentCheck = false;
                          }
                        });
                      },
                    ),
 
```


#### :open_book: 다음 TextFormField로 넘어가게 해주는 Logic

```dart
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
```

<hr>

#### :open_book: 앞서 bool변수들을 이용해서 변수가 True일 경우, 변수 ? ㅁ:ㅁ 로직을 이용하여 버튼 활성화를 시켜줌 

```dart
 titleCheck&&contentCheck ? InkWell(
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w300),
                      ),
                        Navigator.pushReplacementNamed(context, '/menu');
                        // Navigator.of(context)
                        //   .pushReplacementNamed('/start');
                      },
                    ): Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w300,color: Colors.grey),
                    ),
```

<hr>


### :clipboard: Provider 및 데이터 관리

#### :open_book: Provider 정리 :pushpin:("https://github.com/toast-ceo/flutter_cording/blob/main/Memo/Provider.md") 

- Provider를 이용하여 입력된 text를 string 형태로 저장 시켜줌

- 해당 데이터를 Map의 형태로 만들어 준 뒤, Provider를 관리하는 함수로 넘겨줌

```dart
 Map<String, dynamic> data = {
                          'date': todayData,
                          'title': _titleCotroller.text,
                          'content': _contentController.text,
                          'color': args['color'],
                          'image': args['image'],
                        };
                        userdata.addText(data);
```


- 해당 데이터를 추가해주는 Logic, <String, List>의 형식으로 저장

```dart
class Products with ChangeNotifier {

  Map<String, List> userAllData={};

  void addText(var data){

    final dateLogic = DateTime.now();
    final dateNow =  DateFormat('yyyyMMdd').format(dateLogic);
    int difference = dateLogic.difference(DateTime.parse(data['date'])).inDays;
    final dateKey = DateFormat('yyyyMMdd').format(DateTime.parse(dateNow).subtract(Duration(days: difference)));
    print(dateKey);

    if(userAllData.containsKey(dateKey)==true){
      userAllData[dateKey].add(data);
    }else{
      userAllData.addAll({dateKey: [data]});
    }
   
    notifyListeners();
  }
}
```
