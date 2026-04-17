import 'models/pokemon.dart';
import 'models/pokedex.dart';
import 'models/habilidade.dart';

void simularTurno(Pokemon atacante, Pokemon defensor, Habilidade hab) {
  hab.usar(atacante, defensor);
  print("-> HP restante do ${defensor.nome}: ${defensor.hpAtual}\n");
}

void main() {
  var dex = Pokedex();

  // populando a pokedex
  dex.adicionarPokemon(PokemonFogo(numero: 4, nome: "Charmander", nivel: 15, hpMaximo: 50, prox: "Charmeleon", nivEv: 16));
  dex.adicionarPokemon(PokemonAgua(numero: 7, nome: "Squirtle", nivel: 10, hpMaximo: 45));
  dex.adicionarPokemon(PokemonEletrico(numero: 25, nome: "Pikachu", nivel: 20, hpMaximo: 40));
  dex.adicionarPokemon(PokemonFogo(numero: 37, nome: "Vulpix", nivel: 12, hpMaximo: 38));
  dex.adicionarPokemon(PokemonAgua(numero: 54, nome: "Psyduck", nivel: 18, hpMaximo: 52));
  dex.adicionarPokemon(PokemonEletrico(numero: 135, nome: "Jolteon", nivel: 30, hpMaximo: 65));
  dex.adicionarPokemon(PokemonFogo(numero: 58, nome: "Growlithe", nivel: 25, hpMaximo: 60));
  dex.adicionarPokemon(PokemonAgua(numero: 129, nome: "Magikarp", nivel: 5, hpMaximo: 20));

  print("--- POKEDEX ---");
  dex.listarTodos();

  // marcadores
  dex.buscarPorNumero(4)?.marcarComoCapturado();
  dex.buscarPorNumero(4)?.favoritar(); 
  dex.buscarPorNumero(25)?.marcarComoCapturado();
  dex.buscarPorNumero(25)?.favoritar();
  dex.buscarPorNumero(7)?.marcarComoVisto();

  print("\n--- EVOLUCAO ---");
  var p1 = dex.buscarPorNumero(4);
  if (p1 != null) {
    p1.subirNivel(1); 
    p1.evoluir();     
  }

  print("\n--- TESTANDO FILTROS ---");
  print("Fogo:");
  for (var p in dex.listarPorTipo("Fogo")) { print("- ${p.nome}"); }
  
  print("\nAcima do lvl 15:");
  for (var p in dex.listarAcimaDoNivel(15)) { print("- ${p.nome} (Lvl: ${p.nivel})"); }

  print("\n--- BATALHAS ---");
  var atk1 = dex.buscarPorNumero(25)!; 
  var def1 = dex.buscarPorNumero(7)!;  
  simularTurno(atk1, def1, ChoqueDoTrovao());

  var atk2 = dex.buscarPorNumero(58)!; 
  var def2 = dex.buscarPorNumero(54)!; 
  simularTurno(atk2, def2, LancaChamas());

  print("--- CONSULTAS (LAMBDAS) ---");
  print("HP < 30:");
  for (var p in dex.todos.where((p) => p.hpAtual < 30)) { print("- ${p.nome}"); }

  print("\nAlfabetica:");
  var alfabetica = List.from(dex.todos)..sort((a, b) => a.nome.compareTo(b.nome));
  for (var p in alfabetica) { print("- ${p.nome}"); }

  print("\nNivel decrescente:");
  var porNivel = List.from(dex.todos)..sort((a, b) => b.nivel.compareTo(a.nivel));
  for (var p in porNivel) { print("- ${p.nome}"); }

  print("\nFavoritos:");
  for (var p in dex.todos.where((p) => p.favorito)) { print("- ${p.nome}"); }

  print("\n--- STATUS FINAL ---");
  print("Total: ${dex.totalPokemons()}");
  print("Media Lvl: ${dex.mediaDeNivel().toStringAsFixed(1)}");
  print("Capturados: ${dex.percentualCapturados()}%");
  print("Por tipo: ${dex.quantidadePorTipo()}");
}
