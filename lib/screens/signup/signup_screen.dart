import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:provider/provider.dart';

import '../../api/api.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _twoPassController = TextEditingController();

  User user = User.clear();

  @override
  Widget build(BuildContext context) {
    return Consumer<Login>(
      builder: (_, login, __) {
        return Scaffold(
          key: login.scaffoldKeyCadastar,
          backgroundColor: colorBlue,
          appBar: AppBar(
            backgroundColor: colorBlue,
            title: Text(
              "Criar Conta",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.4,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: Form(
                key: formKey,
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Container(
                      height: double.maxFinite,
                      color: colorBlue,
                      child: Center(
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 16),
                                      FormField(
                                        validator: (oferta) {
                                          if (login.imagem.path.isEmpty)
                                            return '?? necess??rio adicionar uma foto';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto: 'Foto de Perfil',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                color: Colors.white,
                                                elevation: 1,
                                                child: Container(
                                                  height: 200,
                                                  alignment: Alignment.center,
                                                  child: Stack(
                                                    children: [
                                                      if (login.imagem.path
                                                          .isNotEmpty)
                                                        Center(
                                                          child: Image.file(
                                                            login.imagem,
                                                            height: 220,
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment: login.imagem
                                                                .path.isNotEmpty
                                                            ? Alignment.topRight
                                                            : Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: IconButton(
                                                            onPressed:
                                                                () async {
                                                              await login
                                                                  .pegarImagemGaleria(
                                                                      context);
                                                            },
                                                            tooltip:
                                                                "Adicionar imagem",
                                                            icon: Icon(
                                                              Icons
                                                                  .camera_alt_rounded,
                                                              color: colorBlack,
                                                              size: 35,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      FormField(
                                        validator: (email) {
                                          if (user.nome.isEmpty)
                                            return 'Campo obrigat??rio';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto:
                                                    'Digite seu Nome Completo',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: FormGeral(
                                                  hintText: 'Nome',
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  onSaved: (text) {
                                                    user.nome = text!;
                                                  },
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      FormField(
                                        validator: (email) {
                                          if (user.cpf.isEmpty)
                                            return 'Campo obrigat??rio';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto: 'Digite seu CPF',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: FormGeral(
                                                  hintText: 'CPF',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onSaved: (text) {
                                                    user.cpf = text!;
                                                  },
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    CpfOuCnpjFormatter(),
                                                  ],
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      FormField(
                                        validator: (email) {
                                          if (user.grau.isEmpty)
                                            return 'Campo obrigat??rio';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto:
                                                    'Digite seu Grau de Escolariedade',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: FormGeral(
                                                  hintText:
                                                      'Grau de Escolaridade',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onSaved: (text) {
                                                    user.grau = text!;
                                                  },
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      FormField(
                                        validator: (email) {
                                          if (_emailController.text.isEmpty)
                                            return 'Campo obrigat??rio';
                                          else if (!emailValid(
                                              _emailController.text))
                                            return 'E-mail inv??lido';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto: 'Digite seu E-mail',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: FormGeral(
                                                  hintText: 'E-mail',
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  controller: _emailController,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      FormField(
                                        validator: (pass) {
                                          if (_passController.text.isEmpty)
                                            return 'Campo obrigat??rio';
                                          else if (_passController.text.length <
                                              8) return 'Senha muito curta';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto: 'Digite sua Senha',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: FormGeral(
                                                  hintText:
                                                      "Pelo menos 8 caracteres",
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  controller: _passController,
                                                  obscureText: true,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      FormField(
                                        validator: (pass) {
                                          if (_twoPassController.text.isEmpty)
                                            return 'Campo obrigat??rio';
                                          else if (_twoPassController
                                                  .text.length <
                                              8) return 'Senha muito curta';
                                          return null;
                                        },
                                        builder: (state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextoTituloForm(
                                                texto: 'Confirme sua Senha',
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: FormGeral(
                                                  hintText: "Senha",
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  controller:
                                                      _twoPassController,
                                                  obscureText: true,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (state.hasError)
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              if (state.hasError)
                                                Text(
                                                  state.errorText as String,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 36),
                                      RaisedButton(
                                        onPressed: login.loading
                                            ? null
                                            : () {
                                                formKey.currentState!.save();

                                                if (formKey.currentState!
                                                    .validate()) {
                                                  if (compararSenhas(
                                                      senha:
                                                          _passController.text,
                                                      segundaSenha:
                                                          _twoPassController
                                                              .text)) {
                                                    //Fun????o para cadastrar o usu??rio
                                                    login.postCadastrarUser(
                                                        email: _emailController
                                                            .text,
                                                        senha: _passController
                                                            .text,
                                                        user: user,
                                                        onSuccess: (mensagem) {
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  HomeScreen(),
                                                            ),
                                                          );
                                                        },
                                                        onFail: (mensagem) {
                                                          //Erro ao cadastrar o usu??rio
                                                          login
                                                              .retornarMensagemCadastrar(
                                                            voltarTela: false,
                                                            context: context,
                                                            color: Colors
                                                                .redAccent,
                                                            mensagem: mensagem,
                                                          );
                                                        });
                                                  } else {
                                                    login
                                                        .retornarMensagemCadastrar(
                                                      voltarTela: false,
                                                      context: context,
                                                      color: Colors.redAccent,
                                                      mensagem:
                                                          "As senhas n??o s??o iguais",
                                                    );
                                                  }
                                                }
                                              },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        elevation: 3,
                                        color: Colors.green,
                                        padding: EdgeInsets.all(8),
                                        child: login.loading
                                            ? Center(
                                                child: SizedBox(
                                                  width: 32,
                                                  height: 32,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: colorBlack,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 36,
                                                child: Center(
                                                  child: Text(
                                                    "Cadastrar",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "J?? possui uma conta?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Fa??a Login",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: colorBlack,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
