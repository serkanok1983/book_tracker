import 'package:book_tracker/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'input_decoration.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
              'Lütfen geçerli bir e-posta adresi ve en az 6 karakterden oluşan bir şifre giriniz.'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                return value!.isEmpty
                    ? 'Lütfen bir e-posta adresi giriniz.'
                    : null;
              },
              controller: _emailTextController,
              decoration: buildInputDecoration(
                  label: 'E-posta', hintText: 'okur@email.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                return value!.isEmpty ? 'Lütfen şifre giriniz.' : null;
              },
              controller: _passwordTextController,
              obscureText: true,
              decoration: buildInputDecoration(label: 'Şifre', hintText: ''),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: Colors.amber,
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    // print(value.user!.email);
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreenPage(),
                          ));
                    });
                  });
                }
              },
              child: Text('Hesap oluştur'))
        ],
      ),
    );
  }
}
