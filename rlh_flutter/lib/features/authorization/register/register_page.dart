import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/core/widgets/app_waiting.dart';
import 'package:rlh_flutter/business/entityes/validation.dart';
import 'package:rlh_flutter/features/authorization/login/login_page.dart';
import 'package:rlh_flutter/features/authorization/register/register_page_controller.dart';
import 'package:rlh_flutter/features/authorization/register/register_page_state.dart';
import 'package:rlh_flutter/business/services/ui_update.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterPageController controller =
      GetIt.instance.get<RegisterPageController>();

  String? same(String? s1, String? s2) {
    String s10 = s1 ?? '';
    String s20 = s2 ?? '';

    if (s10 != s20) {
      return 'passwd_no_equal';
    }
    return null;
  }

  // register button pressed
  void register(BuildContext context) async {
    if (_registerKey.currentState!.validate()) {
      // Register user Use Case
      var result = await controller.registerUser(
          name: _nameTextController.text.trim(),
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim());

      // Result can be of two kinds.
      // -success => go to email verification page.
      // -failure => display error and let user correct input.
      if (result is UiUpdateSuccess) {
        return;
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(bar(result.message));
        }
      }
    }
  }

  void verifyCode(context) async {
    var result = await controller.verifyEmail(_emailTextController.text.trim(),
        _verifyCodeController.text.trim(), _passwordTextController.text.trim());

    if (result is UiUpdateSuccess) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: SafeArea(
        child: StreamBuilder<RegisterPageState>(
            stream: controller.state,
            initialData: RegisterPageState.register,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const AppWaiting();
              } else {
                if (snapshot.data == RegisterPageState.register) {
                  return registerForm(context);
                } else {
                  return verificationForm(context);
                }
              }
            }),
      ),
    );
  }

  Form registerForm(BuildContext context) {
    return Form(
      key: _registerKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          // name textfield
          TextFormField(
            controller: _nameTextController,
            validator: (name) => Validation.name(name!),
            decoration: const InputDecoration(labelText: "Name"),
            autovalidateMode: AutovalidateMode.onUnfocus,
          ),
          SizedBox(height: 10),
          // email textfield
          TextFormField(
            controller: _emailTextController,
            validator: (email) => Validation.email(email!),
            decoration: const InputDecoration(labelText: "Email"),
            autovalidateMode: AutovalidateMode.onUnfocus,
          ),
          SizedBox(height: 10),
          // password textfield
          TextFormField(
            controller: _passwordTextController,
            validator: (password) => Validation.email(password!),
            decoration: const InputDecoration(labelText: "Password"),
            autovalidateMode: AutovalidateMode.onUnfocus,
            obscureText: true,
          ),
          SizedBox(height: 10),
          // confirm password textfield
          TextFormField(
            controller: _confirmPasswordTextController,
            validator: (password) =>
                same(password, _passwordTextController.text),
            decoration: const InputDecoration(labelText: "Confirm Password"),
            autovalidateMode: AutovalidateMode.onUnfocus,
            obscureText: true,
          ),

          const SizedBox(height: 25),

          // sign up button
          MaterialButton(
            onPressed: () => register(context),
            child: const Text("SIGN UP"),
          ),
        ],
      ),
    );
  }

  Form verificationForm(BuildContext context) {
    return Form(
        key: _verificationKey,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              TextFormField(
                controller: _verifyCodeController,
                decoration: const InputDecoration(labelText: "Enter code"),
              ),
              MaterialButton(
                onPressed: () => verifyCode(context),
                child: const Text('Verify'),
              ),
            ]));
  }

  SnackBar bar(String message) {
    return SnackBar(
        content: Text(message),
        backgroundColor: Colors.black12,
        action: SnackBarAction(label: 'Dismiss', onPressed: () {}));
  }

  // Local variables
  final _verificationKey = GlobalKey<FormState>();
  final _registerKey = GlobalKey<FormState>();
  // text controllers
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final _verifyCodeController = TextEditingController();
}
