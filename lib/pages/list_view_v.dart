import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewV extends StatefulWidget {
  const ListViewV({super.key});

  @override
  State<ListViewV> createState() => _ListViewVState();
}

class _ListViewVState extends State<ListViewV> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.img2),
          title: const Text('Usuário 2'),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Olá Tudo bem?'),
              Text('08:53'),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) => {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: 'opcao1', child: Text('Opção 1')),
                const PopupMenuItem<String>(value: 'opcao2', child: Text('Opção 2')),
                const PopupMenuItem<String>(value: 'opcao3', child: Text('Opção 3')),
              ];
            },
          ),
        ),
        Image.asset(AppImages.img1),
        Image.asset(AppImages.img2),
        Image.asset(AppImages.img3),
        Image.asset(AppImages.img1),
        Image.asset(AppImages.img2),
        Image.asset(AppImages.img3),
        Image.asset(AppImages.img1),
        Image.asset(AppImages.img2),
        Image.asset(AppImages.img3),
      ],
    );
  }
}
