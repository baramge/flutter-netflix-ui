import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/screen/MainScreen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final textControllerUser = TextEditingController(),
      textControllerPassword = TextEditingController();

  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    textControllerUser.addListener(_printLatestValue);
    textControllerPassword.addListener(_printLatestValue);
  }

  _printLatestValue() {
    setState(() {
      if (textControllerUser.text.length > 0 &&
          textControllerPassword.text.length > 0) {
        isCheck = true;
      } else if (textControllerUser.text.length == 0 ||
          textControllerPassword.text.length == 0) {
        isCheck = false;
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text(
              "Help",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/netflix_logo.png",height: 45,width: 40,),
                   Text("Sign In" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),

                ],
              ),


              Padding(
                padding: EdgeInsets.only(top: 20.0, right: 40, left: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(48, 45, 45, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    controller: textControllerUser,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      labelText: "Email or Phone number",
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, right: 40, left: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(48, 45, 45, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    controller: textControllerPassword,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: (isCheck)
                          ? Color.fromRGBO(213, 0, 2, 1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Center(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SIGN IN",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
                        new MainScreen()));

                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Center(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Recover Password",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 14, color: Colors.black),
                  children:<TextSpan>[
                    TextSpan(text: "Sign in is protected by Google reCAPTCHA to ensure you're not a bot.",style: TextStyle(color: Colors.grey)),
                    TextSpan(text: "Learn More",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey ))
                  ]
                        ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
