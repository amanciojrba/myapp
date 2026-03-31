import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Verificar se o número é perfeito', () {
    int numero = 6; // Você pode mudar esse número depois
    int soma = 0;

    for (int i = 1; i < numero; i++) {
      if (numero % i == 0) {
        soma += i;
      }
    }

    if (soma == numero) {
      print('O número $numero é perfeito!');
    } else {
      print('O número $numero não é perfeito.');
    }
  });
}
