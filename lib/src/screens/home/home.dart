import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../common/common.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firebaseMessaging = FirebaseMessaging();
  bool send = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appState.user.displayName),
      ),
      body: Center(
        child: FutureBuilder(
          future: _firebaseMessaging.getToken(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              print('--- FCM TOKEN: ${snapshot.data}');
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: Image(
                      image: NetworkImage('${appState.user.photoURL}'),
                    ),
                  ),

                  Text(
                    'Welcome, @${appState.user.displayName}!!',
                  ),
                  Text(
                    'Your E-Mail: ${appState.user.email.toUpperCase()}'
                  ),
                  RaisedButton(
                    onPressed: send ? () async {
                      setState(() {
                        send = false;
                      });
                      await appState.user.sendEmailVerification();
                      setState(() {
                        send = true;
                      });
                    } : null,
                    child: Text('Verifique seu E-Mail!'),
                  ),
                  Text('Verified e-mail: ${appState.user.emailVerified}')
                ],
              );
            } else if(snapshot.hasError) {
              print('--- Error FCM: ${snapshot.error}');
              return Text('Erro na conexão, verifique sua internet.');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}