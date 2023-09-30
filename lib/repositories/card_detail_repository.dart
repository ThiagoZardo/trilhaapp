import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {

  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
      1,
      "Meu Card",
      "https://static.wixstatic.com/media/7a378f_5140deabd7d040378d740069cb692b87~mv2.png/v1/crop/x_0,y_10,w_1334,h_493/fill/w_568,h_208,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo%20DIO.png",
      "Pellentesque congue, mauris lacinia mollis viverra, justo ligula sagittis velit, sit amet consectetur enim metus quis erat. Nullam dui odio, laoreet vitae urna vel, imperdiet blandit purus. Curabitur malesuada velit et ante luctus imperdiet. Donec dictum ex consequat, vehicula ligula sit amet, eleifend ipsum"
    );
  }
}