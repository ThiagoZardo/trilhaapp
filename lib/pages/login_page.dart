import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String email = '';
  String senha = '';
  bool isObscureText = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: Image.network(
                          "https://static.wixstatic.com/media/7a378f_5140deabd7d040378d740069cb692b87~mv2.png/v1/crop/x_0,y_10,w_1334,h_493/fill/w_568,h_208,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo%20DIO.png",
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Já tem cadastro?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Faça seu login e make the change_",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      onChanged: (value) => {
                        email = value,
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      onChanged: (value) => {
                        senha = value,
                      },
                      obscureText: isObscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: -5),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          hintText: "Senha",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.deepPurple,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (email == 'thiago' && senha == '123') {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Usuário ou senha inválida')),
                              );
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepPurple)),
                          child: const Text("ENTRAR",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: isRememberMe,
                            onChanged: (bool? valor) {
                              if (valor != null) {
                                setState(() {
                                  isRememberMe = valor;
                                });
                              }
                            },
                            activeColor: Colors.white,
                          ),
                          const Text(
                            "Lembre-se de mim",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
