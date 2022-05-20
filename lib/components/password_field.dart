import 'package:flutter/material.dart';
import 'package:textapp/string_extensions.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;
   final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (s)  {
          if(s!.isWhitespcae()){
            return "this is a require field";
          }
          return null;
        },
        controller: passwordController,
          obscureText: obscurePassword,
          decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: ()=> setState(() => obscurePassword = !obscurePassword),
            icon:Icon(obscurePassword? Icons.visibility : Icons.visibility_off,)),
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)),
          ),
        ),

      ),
    );
  }
}
