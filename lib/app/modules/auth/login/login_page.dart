import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      VakinhaTextFormField(
                        label: 'E-Mail',
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Email Obrigatório'),
                          Validatorless.email('Email Inválido')
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      VakinhaTextFormField(
                        label: 'Senha',
                        controller: _passwordEC,
                        obscureText: true,
                         validator: Validatorless.multiple([
                          Validatorless.required('Senha Obrigatório'),
                          Validatorless.min(6, 'Senha deve conter 6 caracteres')
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: VakinhaButton(
                          width: double.infinity,
                          label: 'Entrar',
                          onPressed: () {
                            final formValid = _formKey.currentState?.validate() ?? false;

                            if(formValid){
                              controller.login(email: _emailEC.text, password: _passwordEC.text);
                            }

                          },
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui uma conta?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/auth/register');
                            },
                            child: Text(
                              'Cadastre-se',
                              style: VakinhaUi.textBold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
