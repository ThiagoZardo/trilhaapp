import 'dart:math';

class GenerateRandomNumberService {
  static int generateRandomNumber(int numberLimited) {
    Random numberGenerate = Random();
    return numberGenerate.nextInt(numberLimited);
  }
}
