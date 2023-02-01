import 'package:flutter/material.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final passwordController = TextEditingController();
  AuthMode authMode = AuthMode.login;
  Map<String, String> _authData = {
    "email": "",
    "senha": "",
  };
  _submit() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 320,
        width: size.width * 0.75,
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData["email"] = email ?? '',
                validator: (email) {
                  final _email = email ?? "";
                  if (_email.trim().isNotEmpty || !_email.contains("@")) {
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
                    final _password = password ?? "";
                    if (_password.isEmpty || _password.length < 5) {
                      return "Informe uma senha válida";
                    } else {
                      return null;
                    }
                  }),
              if (authMode == AuthMode.signup)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Confirmar Senha",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: (password) {
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
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                child: Text(authMode == AuthMode.login ? "Login" : "Cadastrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}