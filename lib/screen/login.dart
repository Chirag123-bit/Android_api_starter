import 'package:batch28_api_starter/model/UserModel.dart';
import 'package:batch28_api_starter/repository/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');

  _loginUser(User user) async {
    bool isLogin = await UserRepository().loginUser(user);
    if (isLogin) {
      // ignore: use_build_context_synchronously
      MotionToast.success(
        description: const Text("Login Success"),
      ).show(context);
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, "/dashboard");
    } else {
      // ignore: use_build_context_synchronously
      MotionToast.error(
        description: const Text("Login Failed"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SizedBox(
                    //   height: 150,
                    //   child: SvgPicture.asset(
                    //     "assets/svg/student-hat-2.svg",
                    //     color: Colors.blue,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            User user = User(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            );
                            _loginUser(user);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Register User',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
