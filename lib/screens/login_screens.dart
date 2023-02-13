import 'package:bera_flutter_app/screens/home_screens.dart';
import 'package:flutter/material.dart';
import '../services/authServices.dart' as auth_service;

class LoginScrens extends StatefulWidget {
  const LoginScrens({super.key});

  @override
  State<LoginScrens> createState() => _LoginScrensState();
}

class _LoginScrensState extends State<LoginScrens> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const inputDecoration = TextStyle(color: Colors.deepOrange);
    var styleFrom = TextButton.styleFrom(
        backgroundColor: Colors.blueGrey, foregroundColor: Colors.white);
    return Scaffold(
        //backgroundColor: Colors.black,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.fill)),
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            height: double.infinity,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electronico',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: inputDecoration,
                    validator: (value) => validateEmail(value),
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.white)),
                    style: inputDecoration,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Contraseña requerida';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              )),
            )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 26.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () async {
                  var res = await auth_service.fetchAlbum();
                  print(res.body);
                },
                style: styleFrom,
                child: const Text('Registrarse')),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  Object form = {
                    'email': emailCtrl.text,
                    'password': passwordCtrl.text
                  };
                  var res = await auth_service.login(form);
                  print(res.body);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScrens()));
                },
                style: styleFrom,
                child: const Text('Iniciar sesión')),
          ]),
        ));
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "El correo es necesario";
  } else if (!regExp.hasMatch(value)) {
    return "Correo invalido";
  } else {
    return null;
  }
}
