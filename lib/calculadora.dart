import 'dart:io';

import 'pessoa.dart';

class Calculadora {
  calcularIMC(Pessoa pessoa) {
    double imc = 0;

    ((pessoa.peso ?? 0) <= 0)
        ? throw Exception(
            "Erro: peso inválido, não pode ser menor ou igual a zero")
        : null;
    ((pessoa.altura ?? 0) <= 0)
        ? throw Exception(
            "Erro: altura inválida, não pode ser menor ou igual a zero")
        : null;

    if (pessoa.peso != null && pessoa.altura != null) {
      imc = pessoa.peso! / (pessoa.altura! * pessoa.altura!);
    } else {
      throw Exception("Erro ao calcular o IMC.");
    }
    return imc.roundToDouble();
  }

  String digitarNome() {
    bool continuar = true;
    String nome = "";
    do {
      stdout.write("Digite seu nome: ");
      nome = stdin.readLineSync()!.trim();

      if (nome == "") {
        print("Você não digitou um nome.");
        stdout.write("Deseja prosseguir como anonimo (S/N)? : ");

        String resposta = simOuNao();

        if (resposta == "s") {
          nome = "Anonimo";
          continuar = false;
        }
      } else if (nome.length < 3) {
        print('O nome deve ter no minimo 3 letras');
      } else {
        continuar = false;
      }
    } while (continuar);
    return nome;
  }

  String simOuNao() {
    bool continuar = true;
    String resposta = "";
    do {
      resposta = stdin.readLineSync()!.trim().toLowerCase();

      if (resposta == "") {
        stdout.write("Você não digitou uma resposta digite (S/N)? : ");
      } else if ((resposta != "s" && resposta != "n")) {
        stdout.write("Digite apenas (S/N) : ");
      } else {
        continuar = false;
      }
    } while (continuar);

    return resposta;
  }

  double digitarPeso() {
    bool continuar = true;
    double? peso;

    do {
      stdout.write("Digite seu peso: ");
      peso = double.tryParse(stdin.readLineSync()!);

      if (peso == null) {
        print("Você não digitou um peso válido.");
      } else {
        continuar = false;
      }
    } while (continuar);

    return peso!;
  }

  double digitarAltura() {
    bool continuar = true;
    double? altura;

    do {
      stdout.write("Digite sua altura: ");
      String textAltura = stdin.readLineSync()!;
      textAltura = textAltura.replaceAll(',', '.');
      altura = double.tryParse(textAltura);

      if (altura == null) {
        print("Você não digitou uma altura válida.");
      } else {
        continuar = false;
      }
    } while (continuar);
    if ((altura ?? 0) > 3.00) {
      altura = altura! / 100;
    }
    return altura!;
  }
}
