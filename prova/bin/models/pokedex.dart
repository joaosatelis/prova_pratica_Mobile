import 'pokemon.dart';

class Pokedex {
  final List<Pokemon> lista = [];

  List<Pokemon> get todos => lista;

  void adicionar(Pokemon p) {
    if (!lista.any((pk) => pk.numero == p.numero)) {
      lista.add(p);
    }
  }

  bool remover(int n) {
    int antes = lista.length;
    lista.removeWhere((p) => p.numero == n);
    return lista.length < antes;
  }

  Pokemon? buscar(int n) {
    for (var p in lista) {
      if (p.numero == n) return p;
    }
    return null;
  }

  void mostrarPokedex() {
    print("\n--- Meus Pokemons ---");
    for (var p in lista) { p.exibirFicha(); }
  }

  // Filtros da Questao 5
  List<Pokemon> pegarCapturados() => lista.where((p) => p.capturado).toList();
  List<Pokemon> filtrarTipo(String t) => lista.where((p) => p.tipo.toLowerCase() == t.toLowerCase()).toList();
  List<Pokemon> filtrarNivel(int n) => lista.where((p) => p.nivel > n).toList();
  List<Pokemon> podemEvoluir() => lista.where((p) => p.proximaEvolucao != null && p.nivel >= p.nivelEvolucao).toList();

  // Estatisticas da Questao 11
  int total() => lista.length;

  Map<String, int> contagemPorTipo() {
    Map<String, int> mapa = {};
    for (var p in lista) {
      mapa[p.tipo] = (mapa[p.tipo] ?? 0) + 1;
    }
    return mapa;
  }

  double mediaLvl() => lista.isEmpty ? 0 : lista.map((p) => p.nivel).reduce((a, b) => a + b) / lista.length;
  double porcentagemCaptura() => lista.isEmpty ? 0 : (pegarCapturados().length / lista.length) * 100;
}