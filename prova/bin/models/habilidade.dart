import 'pokemon.dart';

abstract class Habilidade {
  String nome;
  int custoEnergia;

  Habilidade(this.nome, this.custoEnergia);

  void usar(Pokemon usuario, Pokemon alvo);
}

class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao() : super("Choque do Trovão", 15);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia >= custoEnergia) {
      int dano = usuario.calcularAtaqueBase() + 5;
      usuario.energia -= custoEnergia;
      alvo.receberDano(dano);
      print("${usuario.nome} usou $nome! Dano: $dano");
    } else {
      print("${usuario.nome} está sem energia para $nome!");
    }
  }
}

class JatoDAgua extends Habilidade {
  JatoDAgua() : super("Jato d'Água", 10);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia >= custoEnergia) {
      int dano = usuario.calcularAtaqueBase() + 3;
      usuario.energia -= custoEnergia;
      alvo.receberDano(dano);
      print("${usuario.nome} usou $nome! Dano: $dano");
    }
  }
}

class LancaChamas extends Habilidade {
  LancaChamas() : super("Lança-Chamas", 20);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia >= custoEnergia) {
      int dano = usuario.calcularAtaqueBase() + 7;
      usuario.energia -= custoEnergia;
      alvo.receberDano(dano);
      print("${usuario.nome} usou $nome! Dano: $dano");
    }
  }
}