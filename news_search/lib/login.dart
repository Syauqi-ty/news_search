import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_search/home_page.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'profile'
    'email'
  ]
);

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    if(_currentUser=null){
      return HomePage();
    }
    else
    return Column(
      children: <Widget>[
        Text('Sorry You are Not Signed in'),
        RaisedButton(
          onPressed: _handleSignIn,
          child: Text('Sign In'),
        )
      ],
    );
  }
}

Future<void> _handleSignIn() async {
  try {
  await _googleSignIn.signIn();
  }catch(error){
    print(error);
  }
}
