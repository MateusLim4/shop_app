import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/exceptions/exception.dart';

import '../models/auth/auth.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final passwordController = TextEditingController();
  AuthMode authMode = AuthMode.login;
  final Map<String, String> _authData = {
    "email": "",
    "senha": "",
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Ocorreu um erro!",
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Fechar"))
        ],
      ),
    );
  }

  void _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try {
      if (_isLogin()) {
        await auth.signin(
          _authData["email"]!,
          _authData["password"]!,
        );
      } else {
        await auth.signup(
          _authData["email"]!,
          _authData["password"]!,
        );
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog("Ocorreu um erro inesperado.");
    }

    setState(() => _isLoading = false);
  }

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        authMode = AuthMode.signup;
      } else {
        authMode = AuthMode.login;
      }
    });
  }

  bool _isLogin() => authMode == AuthMode.login;
  bool _isSignup() => authMode == AuthMode.signup;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: _isLogin() ? 340 : 420,
        width: size.width * 0.75,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData["email"] = email ?? '',
                validator: (email) {
                  // ignore: no_leading_underscores_for_local_identifiers
                  final _email = email ?? "";
                  if (_email.trim().isEmpty || !_email.contains("@")) {
                    return "Informe um email válido";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Senha",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: passwordController,
                  onSaved: (password) => _authData["password"] = password ?? '',
                  validator: (password) {
                    // ignore: no_leading_underscores_for_local_identifiers
                    final _password = password ?? "";
                    if (_password.isEmpty || _password.length < 5) {
                      return "Informe uma senha válida";
                    } else {
                      return null;
                    }
                  }),
              if (_isSignup())
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Confirmar Senha",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: _isLogin()
                      ? null
                      : (password) {
                          // ignore: no_leading_underscores_for_local_identifiers
                          final _password = password ?? "";
                          if (_password != passwordController.text) {
                            return "Senhas informadas não conferem";
                          } else {
                            return null;
                          }
                        },
                ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                  ),
                  child: Text(
                    _isLogin() ? "Login" : "Cadastrar",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              const Spacer(),
              TextButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                      _isLogin() ? "Cadastre-se!" : "Já possui uma conta?"))
            ],
          ),
        ),
      ),
    );
  }
}
