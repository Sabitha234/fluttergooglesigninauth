import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:googlesignin/provider.dart';
import 'package:provider/provider.dart';
class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Google Signin"),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey.shade900,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){
                final provider=Provider.of<GoogleSigninProvider>(context,listen: false);
                provider.googleLogin();
              },
                  icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
                  label: Text("Sign up with google"))
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
