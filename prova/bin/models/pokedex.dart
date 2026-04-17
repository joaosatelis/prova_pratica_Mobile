import 'pokemon.dart';

class Pokedex {
  final List<Pokemon> lista = [];

  List<Pokemon> get todos => lista;

  void adicionarPokemon(Pokemon p) {
    if (!lista.any((pk) => pk.numero == p.numero)) {
      lista.add(p);
    }
  }

  bool removerPokemonPorNumero(int n) {
    int antes = lista.length;
    lista.removeWhere((p) => p.numero == n);
    return lista.length < antes;
  }

  Pokemon? buscarPorNumero(int n) {
    for (var p in lista) {
      if (p.numero == n) return p;
    }
    return null;
  }

  void listarTodos() {
    for (var p in lista) { 
      p.exibirFicha(); 
    }
  }

  List<Pokemon> listarCapturados() => lista.where((p) => p.capturado).toList();
  List<Pokemon> listarPorTipo(String tipo) => lista.where((p) => p.tipo.toLowerCase() == tipo.toLowerCase()).toList();
  List<Pokemon> listarAcimaDoNivel(int nivelMinimo) => lista.where((p) => p.nivel > nivelMinimo).toList();
  List<Pokemon> listarQuePodemEvoluir() => lista.where((p) => p.proximaEvolucao != null && p.nivel >= p.nivelEvolucao).toList();

  int totalPokemons() => lista.length;

  Map<String, int> quantidadePorTipo() {
    Map<String, int> mapa = {};
    for (var p in lista) {
      mapa[p.tipo] = (mapa[p.tipo] ?? 0) + 1;
    }
    return mapa;
  }

  double mediaDeNivel() => lista.isEmpty ? 0 : lista.map((p) => p.nivel).reduce((a, b) => a + b) / lista.length;
  double percentualCapturados() => lista.isEmpty ? 0 : (listarCapturados().length / lista.length) * 100;
}
