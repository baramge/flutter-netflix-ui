import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}):super(key:key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final textControllerUser=TextEditingController(),
  textControllerPassword=TextEditingController();

  bool isCheck = false;

  @override
  void initState(){
    super.initState();
  }

  _printLatestValue(){
    setState(() {
      if(textControllerUser.text.length>0 && textControllerPassword.text.length>0){
        isCheck=true;
      }else if(textControllerUser.text.length==0 || textControllerPassword.text.length==0){
        isCheck=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20,top: 20),
            child: Text("Help",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
          )
        ],
        elevation: 0,
      ),
      body: Center(),
    );
  }
}
