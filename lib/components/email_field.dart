import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final emailController;
  const EmailField({Key? key,this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final emailController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress ,
        controller: emailController,
        decoration: const InputDecoration(
          // suffixIcon: Icon(icon.),
          labelText: "Email Address",
          helperText: "",
          prefixIcon: Icon(Icons.account_circle),
          hintText:"example@test.com",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
