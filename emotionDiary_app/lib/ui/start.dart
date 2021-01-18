import 'package:flutter/material.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.people, color: Colors.grey, size: 25,),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/people');
                  },
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.28),
            Text('One day', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),),
            Text('Diary', style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100),),
            SizedBox(height: 80,),
            InkWell(
              child: Text('Start',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
              onTap: ()=> Navigator.of(context).pushReplacementNamed('/menu'),
            ),
          ],
        ),
      ),
    );
  }
}
