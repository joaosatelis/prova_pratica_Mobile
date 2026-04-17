import 'dart:io';

abstract class RegistravelNaPokedex {
  void marcarComoVisto();
  void marcarComoCapturado();
  void favoritar();
  void desfavoritar();
}

class Pokemon implements RegistravelNaPokedex {
  int numero;
  String nome;
  String tipo;
  int _nivel;
  int _hpAtual;
  int _hpMaximo;
  int energia;
  bool capturado;
  bool visto;
  bool favorito;
  String? proximaEvolucao;
  int nivelEvolucao;

  Pokemon({
    required this.numero,
    required this.nome,
    required this.tipo,
    required int nivel,
    required int hpMaximo,
    this.energia = 100,
    this.capturado = false,
    this.visto = false,
    this.favorito = false,
    this.proximaEvolucao,
    this.nivelEvolucao = 0,
  })  : _nivel = nivel.clamp(1, 100),
        _hpMaximo = hpMaximo > 0 ? hpMaximo : 1,
        _hpAtual = hpMaximo > 0 ? hpMaximo : 1;

  int get nivel => _nivel;
  int get hpAtual => _hpAtual;
  int get hpMaximo => _hpMaximo;

  void subirNivel(int qtd) {
    if (qtd > 0) _nivel = (_nivel + qtd).clamp(1, 100);
  }

  void receberDano(int dano) {
    if (dano > 0) _hpAtual = (_hpAtual - dano).clamp(0, _hpMaximo);
  }

  void curar(int valor) {
    if (valor > 0) _hpAtual = (_hpAtual + valor).clamp(0, _hpMaximo);
  }

  void evoluir() {
    if (proximaEvolucao != null && _nivel >= nivelEvolucao) {
      print("=> $nome evoluiu para $proximaEvolucao!");
      nome = proximaEvolucao!;
      proximaEvolucao = null;
      _hpMaximo += 20;
      _hpAtual = _hpMaximo;
    }
  }

  int calcularAtaqueBase() => _nivel;

  void exibirFicha() {
    print("[$numero] $nome | Tipo: $tipo | Lvl: $_nivel | HP: $_hpAtual/$_hpMaximo | Cap: $capturado | Fav: $favorito");
  }

  @override void marcarComoVisto() => visto = true;
  @override void marcarComoCapturado() { capturado = true; visto = true; }
  @override void favoritar() { if (capturado) favorito = true; }
  @override void desfavoritar() => favorito = false;
}

class PokemonFogo extends Pokemon {
  PokemonFogo({required super.numero, required super.nome, required super.nivel, required super.hpMaximo, String? prox, int nivEv = 0})
      : super(tipo: "Fogo", proximaEvolucao: prox, nivelEvolucao: nivEv);
  
  @override int calcularAtaqueBase() => nivel * 3;
  @override void exibirFicha() { stdout.write("[FOGO] "); super.exibirFicha(); }
}

class PokemonAgua extends Pokemon {
  PokemonAgua({required super.numero, required super.nome, required super.nivel, required super.hpMaximo, String? prox, int nivEv = 0})
      : super(tipo: "Agua", proximaEvolucao: prox, nivelEvolucao: nivEv);
  
  @override int calcularAtaqueBase() => (nivel * 2) + 10;
  @override void exibirFicha() { stdout.write("[AGUA] "); super.exibirFicha(); }
}

class PokemonEletrico extends Pokemon {
  PokemonEletrico({required super.numero, required super.nome, required super.nivel, required super.hpMaximo, String? prox, int nivEv = 0})
      : super(tipo: "Eletrico", proximaEvolucao: prox, nivelEvolucao: nivEv);
  
  @override int calcularAtaqueBase() => (nivel * 2) + 15;
  @override void exibirFicha() { stdout.write("[ELET] "); super.exibirFicha(); }
}
