import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _nameEC.dispose();
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
      body: SingleChildScrollView(
          child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark),
                ),
                Text(
                  'Preencha os campos abaixo para criar o  seu cadastro.',
                  style: context.textTheme.bodyText1
                      ?.copyWith(color: context.theme.primaryColorDark),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormField(
                  label: 'Nome',
                  controller: _nameEC,
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormField(
                  label: 'E-Mail',
                  controller: _emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('E-mail Obrigatório'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormField(
                  label: 'Senha',
                  controller: _passwordEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Password Obrigatório'),
                    Validatorless.min(
                        6, 'Senha deve conter pelo menos 6 caracteres'),
                  ]),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                VakinhaTextFormField(
                  label: 'Confirma Senha',
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirma senha Obrigatório'),
                    Validatorless.compare(_passwordEC,
                        'Senha diferente da digitada anteriormente')
                  ]),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: VakinhaButton(
                    width: double.infinity,
                    label: 'Cadastrar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        controller.register(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
