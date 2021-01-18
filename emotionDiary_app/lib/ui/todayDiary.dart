import 'package:flutter/material.dart';

class TodayDiary extends StatefulWidget {
  @override
  _TodayDiaryState createState() => _TodayDiaryState();
}

class _TodayDiaryState extends State<TodayDiary> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    print(args);
    return Scaffold(
      backgroundColor: args['color'],
      appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: args['color'],
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/remind");
            },
          )),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.88,
              height: MediaQuery.of(context).size.height * 0.85,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  children: <Widget>[
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
