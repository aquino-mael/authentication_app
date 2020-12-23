import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/common.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: FutureBuilder(
        future: Firebase.initializeApp(name: 'authenticationApp'),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }else if (snapshot.connectionState == ConnectionState.none) {
            return Center(child: Text('Erro ao estabelecer conexão'));
          }else {
            return _buildBody();
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Authentication App'),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        Form(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 56.0
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  InputText(
                    labelText: 'E - mail',
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  InputText(
                    labelText: 'Senha',
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Button(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    icon: FontAwesomeIcons.signInAlt,
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Não possui uma conta? Tente as ',
                      style: TextStyle(
                        color: text,
                        fontSize: 13.0
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'alternativas abaixo!',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ]
                    ),
                  ),
                  SizedBox(
                    height: 16.0
                  ),
                  _buildSocialLogin(
                    assets: 'assets/images/google.png',
                    boxColor: Color(0xFFF0F0F0),
                    text: 'Google',
                    textColor: Color(0xFF4F4F4F),
                    padding: EdgeInsets.all(8.0),
                    onTap: () async {
                      appState = await _googleSignIn();
                      if(appState == null) return;
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  SizedBox(
                    height: 12.0
                  ),
                  _buildSocialLogin(
                    assets: 'assets/images/facebook.png',
                    boxColor: Color(0xFF3B5998),
                    imageColor: Color(0xFFFFFFFF),
                    text: 'Facebook',
                    textColor: Color(0xFFFFFFFF),
                    padding: EdgeInsets.all(8.0),
                    onTap: () async {
                      appState = await _facebookSignIn();
                      if(appState == null) return;
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLogin({
    @required String assets,
    @required Color boxColor,
    @required Color textColor,
    @required String text,
    @required Function onTap,
    Color imageColor,
    EdgeInsetsGeometry padding,
  }) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 4.0,
        child: Container(
          height: 50,
          padding: padding,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  child: Image(
                    image: AssetImage(assets),
                    color: imageColor,
                  ),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> _facebookSignIn() async {
    try{
      final result = await FacebookAuth.instance.login();
      final facebookCredential = FacebookAuthProvider.credential(result.token);
      return await FirebaseAuth.instance.signInWithCredential(facebookCredential);
    } catch (e) {
      print('--- ERRO FACEBOOK: $e');
      _buildPopUp();
      return null;
    }
  }

  Future<UserCredential> _googleSignIn() async {
    try {
      // Realiza o login no google
      final googleUser = await GoogleSignIn().signIn();

      // Obtem os detalhes da conta do google
      final googleAuth = await googleUser.authentication;
      
      // Gerar uma credencial de acordo com os dados obtidos da autênticação
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(googleCredential);
    } catch (e) {
      print('--- ERRO GOOGLE: $e');
      _buildPopUp();
      return null;
    }
  }

  _buildPopUp() {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Ocorreu um Erro!'),
        content: Text(
          'Tente novamente ou verifique a sua conexão!',
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context), 
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}