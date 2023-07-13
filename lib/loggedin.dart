import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin/provider.dart';
import 'package:provider/provider.dart';
class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({super.key});

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            final provider=Provider.of<GoogleSigninProvider>(context,listen:false);
            provider.logout();
          }, child: Text("Logout"))
        ],
      ),
      body:Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile"),
            CircleAvatar(backgroundImage: NetworkImage(user.photoURL!),radius: 60,),
            Text(user.displayName!,style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            Text(user.email!,style: TextStyle(color: Colors.white,
                fontSize: 20),
            )
          ],
        ),
      )
    );
  }
}
