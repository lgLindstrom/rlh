import 'package:flutter/material.dart';
import 'package:rlh_flutter/core/config/theme/theme_settings_widget.dart';
import 'package:rlh_flutter/core/widgets/app_button.dart';
import 'package:rlh_flutter/core/widgets/app_text_field.dart';
import 'package:rlh_flutter/repository/authentication_service_impl.dart';
import '../register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get auth service

  // text controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare data
    String email = emailTextController.text;
    String password = passwordTextController.text;
    AuthenticationServiceImpl auth = AuthenticationServiceImpl();
    await auth.signInWithEmailPassword(email, password);
    // attempt login..
    try {} catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar with hamburger button'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "User Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  "user@example.com",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "U",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              //const ThemeSettingsWidget(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const Icon(
                Icons.lock_open,
                size: 120,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Text("T E X T   B A S E D   S O C I A L   A P P"),
              ),

              // email textfield
              AppTextField(
                controller: emailTextController,
                hintText: "Email",
                obscureText: false,
              ),

              // password textfield
              AppTextField(
                controller: passwordTextController,
                hintText: "password",
                obscureText: true,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("forgot password ?"),
                ],
              ),

              const SizedBox(height: 50),

              // login button
              AppButton(
                onTap: login,
                message: "LOGIN",
              ),

              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage())),
                        child: const Text("Continue as Guest"),
                      ),
                      const Text('or'),
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage())),
                        child: const Text("SIGN UP"),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
