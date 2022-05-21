import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textapp/components/email_field.dart';
import 'package:textapp/components/password_field.dart';
import 'package:textapp/second_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Login"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SizedBox(height: 40,),
                Container(child: FlutterLogo(size: 100)),
                SizedBox(height: 120,),
                 
                EmailField(emailController: emailController,),
                PasswordField(),
                Divider(
                  height: 5.0,
                ),
                ElevatedButton(onPressed: () async{
                  final isValid = _formKey.currentState!.validate();
                  isValid ?
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()), )
                       :
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                  );
                  
                  // Fluttertoast.showToast(msg: 'Welcome ', toastLength: Toast.LENGTH_SHORT);
                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString("email", emailController.text);
                }, child: const Text('Submit'))
             
              ],
            ),
          ),

        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     final isValid = _formKey.currentState!.validate();
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('Processing Data')),
      //     );
      //   },
      //   child: const Icon(Icons.check),
      // ),
    );
  }
}
