import 'package:flutter/material.dart';
import 'package:odd_app/models/provider.dart';
import 'package:provider/provider.dart';


class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    bool dataLength = false;
    Products userdata = Provider.of<Products>(context, listen: false);
    if(userdata.userAllData.length > 0){
      dataLength = true;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/start");
            },
          )),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: dataLength ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(height: 100),
            InkWell(
              child: Text('Record',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300),),
              onTap: ()=> Navigator.of(context).pushReplacementNamed('/record'),
            ),
            SizedBox(height: 90),   
            InkWell(
              child: Text('Remind',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300),),
              onTap: ()=> Navigator.of(context).pushReplacementNamed('/remind'),
            ),
            SizedBox(height: 100),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Colors.grey,
            ),
          ],
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(height: 165),
            InkWell(
              child: Text('Record',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300),),
              onTap: ()=> Navigator.of(context).pushReplacementNamed('/record'),
            ),
            SizedBox(height: 165),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

/// bool a = false;
/// a ? card : card