import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: () {
                                Navigator.pop(context);
                              }, icon: const Icon(Icons.close)),
                              Image.network(
                                cardDetail.url,
                                height: 100,
                              ),
                            ],
                          ),
                          Text(cardDetail.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                          Expanded(
                            child: Text(
                              cardDetail.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 26),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
        ),
      ),
    );
  }
}