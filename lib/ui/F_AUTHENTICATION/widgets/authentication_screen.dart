import 'package:mekmotorclient/routing/menu_app_controller.dart';
import 'package:mekmotorclient/routing/navigator_key.dart';
import 'package:mekmotorclient/ui/F_HOME/widgets/main_screen.dart';
import 'package:mekmotorclient/ui/core/ui/mekmotor_input_decoration.dart';
import 'package:mekmotorclient/ui/core/ui/show_snackbar.dart';
import 'package:mekmotorclient/utils/mekmotor_colors.dart';
import 'package:mekmotorclient/utils/mekmotor_logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool wantToSignUp = true;

  final TextEditingController _emailController = TextEditingController(
    text: "teste@teste.com.br",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "123456",
  );
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MekMotorColors.orange,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MekMotorColors.orangeTopGradient,
                  MekMotorColors.orangeBottomGradient,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/logo_background_transparent.png",
                        height: 128,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        "mekmotor",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: getMekMotorInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio";
                          } else if (value.length < 5) {
                            return "O e-mail é muito curto";
                          } else if (!value.contains("@")) {
                            return "O e-mail não é válido";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        decoration: getMekMotorInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazia";
                          } else if (value.length < 5) {
                            return "A senha é muito curta";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: !wantToSignUp,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getMekMotorInputDecoration(
                                "Confirme a senha",
                              ),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A confirmação de senha não pode ser vazia";
                                } else if (value.length < 5) {
                                  return "A confirmação de senha é muito curta";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: _nameController,
                              decoration: getMekMotorInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio";
                                } else if (value.length < 5) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        child: Text((wantToSignUp) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            wantToSignUp = !wantToSignUp;
                          });
                        },
                        child: Text(
                          (wantToSignUp)
                              ? "Ainda não tem uma conta? Cadastre-se!"
                              : "Já tem uma conta? Entre!",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void botaoPrincipalClicado() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    if (_formKey.currentState!.validate()) {
      if (wantToSignUp) {
        MekMotorLogger.info("Entrada validada");

        showSnackbar(
          context: super.context,
          texto: "Login efetuado com sucesso",
          isErro: false,
        );

        /** 
         TODO Integrar ao serviço de autenticação do mekmotor-server
        _autenticacaoServico.logarUsuario(email: email, senha: senha).then((
          String? erro,
        ) {
          if (erro != null) {
            mostrarSnackbar(context: navigatorKey.currentContext!, texto: erro);
          }
          else {
            mostrarSnackbar(
              context: navigatorKey.currentContext!,
              texto: "Login efetuado com sucesso",
              isErro: false,
            );
          }
        });
        */

        final value = context.read<MenuAppController>();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<MenuAppController>.value(
                  value: value,
                  builder: (context, child) {
                    return const MainScreen();
                  },
                ),
          ),
        );
      } else {
        MekMotorLogger.info("Cadastro validado");

        MekMotorLogger.info("${email}, ${password}, ${name}");

        /** 
         TODO Integrar ao serviço de autenticação do mekmotor-server
        _autenticacaoServico
            .cadastrarUsuario(email: email, senha: senha, nome: nome)
            .then((String? erro) {
              if (erro != null) {
                mostrarSnackbar(
                  context: navigatorKey.currentContext!,
                  texto: erro,
                );
              }
              /**  
              else {
                mostrarSnackbar(
                  context: navigatorKey.currentContext!,
                  texto: "Cadastro efetuado com sucesso",
                  isErro: false,
                );
              }
              */
            });
            */

        showSnackbar(
          context: navigatorKey.currentContext!,
          texto: "Cadastro efetuado com sucesso",
          isErro: false,
        );
      }
    } else {
      MekMotorLogger.info("Form inválido");
    }
  }
}
