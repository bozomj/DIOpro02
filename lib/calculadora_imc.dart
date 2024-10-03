import 'dart:io';
import 'package:calculadora_imc/pessoa.dart';

import 'Calculadora.dart';

calculadoraIMC() {
  bool continuar = false;

  print("Bem vindo à  Calculadora de IMC!");
  print("");

  do {
    Pessoa pessoa = Pessoa();
    Calculadora calculadora = Calculadora();

    pessoa.nome = calculadora.digitarNome();
    pessoa.peso = calculadora.digitarPeso();
    pessoa.altura = calculadora.digitarAltura();

    double imc = 0;

    try {
      String classificacao = "";
      imc = calculadora.calcularIMC(pessoa);
      switch (imc) {
        case < 18.5:
          classificacao = "Abaixo do peso";
          break;
        case >= 18.5 && < 24.9:
          classificacao = "Peso normal";
          break;
        case >= 25 && < 29.9:
          classificacao = "Sobrepeso";
          break;
        case >= 30 && < 34.9:
          classificacao = "Obesidade Grau 1";
          break;
        case >= 35 && < 39.9:
          classificacao = "Obesidade Grau 2";
          break;
        case >= 40:
          classificacao = "Obesidade Grau 3 (mórbida)";
          break;
      }

      print("");
      print("${pessoa.nome} seu IMC é: $imc");
      print("Classificação: $classificacao");
      print("");
    } catch (e) {
      print(e);
    }

    stdout.write("Deseja fazer um novo Calculo (S/N)? : ");

    String n = calculadora.simOuNao();
    print("");

    continuar = (n == "s") ? true : false;
  } while (continuar);

  print("Obrigado por usar a Calculadora de IMC!");
  print('Até a próxima!');
  print("");
}
