import 'package:flutter/material.dart';
import 'package:navigation_pages/views/register_page.dart';

import '../components/custom_button.dart';
import '../components/custom_input.dart';
import '../components/social_auth.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 180,),
            CustomInput(labelText: 'Email',),
            CustomInput(labelText: 'Senha', obscure: true,),
            CustomButton(titleButton: 'Login',),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não tem uma conta?'),
                TextButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage())
                  );
                },
                    child: Text('Cadastre-se')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialAuth(),
                SocialAuth(),
                SocialAuth(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
