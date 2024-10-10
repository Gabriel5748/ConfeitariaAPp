import 'package:app_restaurante/model/chip_class.dart';
import 'package:app_restaurante/model/providers.dart';
import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/sweet_class.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  late final List<Doces> listaDoces;
  String errorMessage = '';

  void toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  void enterApp() {
    if (formKey.currentState!.validate()) {
      Navigate.homePage(context);
    }
  }

  @override
  void initState() {
    Doces.getDados();
    DocesCategoria.getDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Consumer<UserData>(
            builder: ((context, user, child) {
              emailController.text = user.email;
              passwordController.text = user.password;
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/bolinho.png',
                      width: 200,
                      height: 200,
                    ),
                    const Text(
                        'Os melhores doces estão aqui, esperando por você'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (user.email != value) {
                            return 'Email e/ou senha inválido';
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Icon(CupertinoIcons.envelope),
                          ),
                          prefixIconColor: Colors.black,
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (user.password != value) {
                            return 'Email e/ou senha inválido';
                          }
                        },
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Icon(CupertinoIcons.padlock),
                          ),
                          prefixIconColor: Colors.black,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.eye_slash)),
                          suffixIconColor: Colors.black,
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: const Text('Remember me'),
                            value: isChecked,
                            onChanged: (value) => toggleCheckBox(),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot password ?',
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => enterApp(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Dont have an account ?'),
                        TextButton(
                            onPressed: () => Navigate.cadastroPage(context),
                            child: const Text('Sign up'))
                      ],
                    ),
                    const Divider()
                  ]);
            }),
          ),
        ),
      ),
    );
  }
}
