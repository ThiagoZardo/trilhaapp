import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    width: double.infinity,
                    child: const Text("Dados cadastrais"),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastraisPage(
                                  texto: "Meus Dados",
                                )));
                  },
                ),
                const SizedBox(height: 10),
                const Divider(),
                InkWell(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações"),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                const Divider(),
                InkWell(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso"),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                const Divider(),
                InkWell(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    width: double.infinity,
                    child: const Text("Privacidade"),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pagePosition = value;
                  });
                },
                children: const [
                  Pagina1(),
                  Pagina2(),
                  Pagina3(),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) => {pageController.jumpToPage(value)},
                currentIndex: pagePosition,
                items: const [
                  BottomNavigationBarItem(
                      label: "Page 1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Page 2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Page 3", icon: Icon(Icons.person)),
                ])
          ],
        ),
      ),
    );
  }
}
