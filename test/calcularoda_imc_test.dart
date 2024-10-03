import 'package:calculadora_imc/calculadora.dart';
import 'package:calculadora_imc/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('Calculadora IMC', () {
    test('Calcular IMC', () {
      Pessoa pessoa = Pessoa(altura: 1.75, peso: 70, nome: "Anonimo");
      expect(Calculadora().calcularIMC(pessoa),
          (pessoa.peso! / (pessoa.altura! * pessoa.altura!)).roundToDouble());
    });
  });
}
