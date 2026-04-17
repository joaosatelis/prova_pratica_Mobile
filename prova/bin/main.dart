import 'models/pokemon.dart';
import 'models/pokedex.dart';
import 'models/habilidade.dart';

void main() {
  var pokeApp = Pokedex();

  // Cadastrando a galera (Questao 12)
  pokeApp.adicionar(PokemonFogo(numero: 4, nome: "Charmander", nivel: 15, hpMaximo: 50, prox: "Charmeleon", nivEv: 16));
  pokeApp.adicionar(PokemonAgua(numero: 7, nome: "Squirtle", nivel: 10, hpMaximo: 45));
  pokeApp.adicionar(PokemonEletrico(numero: 25, nome: "Pikachu", nivel: 20, hpMaximo: 40));
  pokeApp.adicionar(PokemonFogo(numero: 37, nome: "Vulpix", nivel: 12, hpMaximo: 38));
  pokeApp.adicionar(PokemonAgua(numero: 54, nome: "Psyduck", nivel: 18, hpMaximo: 52));
  pokeApp.adicionar(PokemonEletrico(numero: 135, nome: "Jolteon", nivel: 30, hpMaximo: 65));
  pokeApp.adicionar(PokemonFogo(numero: 58, nome: "Growlithe", nivel: 25, hpMaximo: 60));
  pokeApp.adicionar(PokemonAgua(numero: 129, nome: "Magikarp", nivel: 5, hpMaximo: 20));

  // Testando as capturas
  pokeApp.buscar(4)?.marcarComoCapturado();
  pokeApp.buscar(25)?.marcarComoCapturado();
  pokeApp.buscar(7)?.marcarComoVisto();
  pokeApp.buscar(4)?.favoritar();

  // Testando evolucao
  var c = pokeApp.buscar(4);
  if (c != null) {
    c.subirNivel(1);
    c.evoluir();
  }

  print("\n--- Simulando Batalha ---");
  var p1 = pokeApp.buscar(25)!;
  var p2 = pokeApp.buscar(7)!;
  ChoqueDoTrovao().usar(p1, p2);
  print("HP do ${p2.nome} agora: ${p2.hpAtual}");

  // Questao 10 - Funcoes anonimas
  print("\n--- Pokemons com vida baixa ---");
  pokeApp.todos.where((p) => p.hpAtual < 30).forEach((p) => print(p.nome));

  print("\n--- Stats da Pokedex ---");
  print("Total de pokes: ${pokeApp.total()}");
  print("Media de level: ${pokeApp.mediaLvl().toStringAsFixed(1)}");
  print("Capturados: ${pokeApp.porcentagemCaptura()}%");
  print("Tipos: ${pokeApp.contagemPorTipo()}");
}