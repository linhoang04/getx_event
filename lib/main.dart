import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hello World',
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: Text('Login'))
          ]),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final LoginController getController = LoginController();
  final _formName = GlobalKey<FormState>();
  final _formPass = GlobalKey<FormState>();
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            makeName(
              lable: 'Name',
            ),
            makePass(
              lable: "Password",
              // obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formName.currentState!.validate() &&
                      _formPass.currentState!.validate()) {
                    if (getController.check(
                        nameController.text, passController.text)) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Login thành công'),
                            );
                          });
                    }
                    ;
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  Widget makeName({
    lable,
    obscureText = false,
  }) {
    // final LoginController getController = LoginController();
    return Column(
      children: [
        Text(lable),
        SizedBox(
          height: 5,
        ),
        Form(
            key: _formName,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a name';
                    } else
                      return null;
                  },
                  controller: nameController,
                  obscureText: obscureText,
                  decoration: InputDecoration(),
                ),
              ],
            ))
      ],
    );
  }

  Widget makePass({lable}) {
    //
    return Column(
      children: [
        Text(lable),
        SizedBox(
          height: 5,
        ),
        Form(
          key: _formPass,
          child: TextFormField(
            validator: (value) {
              if (value!.length < 6) {
                return 'Please select a pass, > 6';
              } else
                return null;
            },
            controller: passController,
            obscureText: hidden,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidden = !hidden;
                });
              },
              icon: Icon(hidden ? Icons.visibility_off : Icons.visibility),
            )),
          ),
        ),
      ],
    );
  }
}
