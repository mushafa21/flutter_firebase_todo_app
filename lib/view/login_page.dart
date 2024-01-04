import 'package:base_todolist/config/locator.dart';
import 'package:base_todolist/config/shared_preference.dart';
import 'package:base_todolist/model/todo.dart';
import 'package:base_todolist/ui/dimen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  final CacheStore _cacheStore = locator.get();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void toRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterPage();
    }));
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final navigator = Navigator.of(context);
      final email = _emailController.text;
      final password = _passwordController.text;
      if (email.isEmpty || password.isEmpty) {
        throw ("Please fill all the fields");
      } else {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        navigator.pushReplacement(MaterialPageRoute(builder: (context) {
          _cacheStore.setLogin(true);
          _cacheStore.setEmail(email);
          return HomePage();
        }));
      }
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: spacing4,
            ),
             Text(
              'Sign in to continue',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: spacing4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spacing3, horizontal: spacing3),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: spacing3, horizontal: spacing3),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: spacing3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'Create new account?',
                  style: Theme.of(context).textTheme.titleMedium),
                TextButton(
                  onPressed: toRegister,
                  child: const Text(
                    'Sign Up',
                  ),
                ),
              ],
            ),
            const SizedBox(height: spacing3),
            ElevatedButton(
              //size
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: spacing4),
              ),
              onPressed: login,
              child: const Text(
                'Login',
              ),
            ),
            const SizedBox(height: spacing3),
          ],
        ),
      ),
    );
  }
}
