import '../model/dish.dart';

// Bebidas e precos de exemplo para montar a tela.
abstract class BebidasData {
  static final List<Dish> listBebidas = [
    Dish(
        id: '1',
        name: 'Água mineral',
        description: 'Sem gás - 500 ml',
        price: 4,
        imagePath: 'assets/dishes/agua.jpg'),
    Dish(
        id: '2',
        name: 'Refrigerante',
        description: 'Cola - 350 ml',
        price: 6,
        imagePath: 'assets/dishes/refrigerante.jpg'),
    Dish(
        id: '3',
        name: 'Suco de laranja',
        description: 'Copo de 300 ml',
        price: 8,
        imagePath: 'assets/dishes/suco.jpg'),
    Dish(
        id: '4',
        name: 'Café',
        description: 'Xícara de 100 ml',
        price: 5,
        imagePath: 'assets/dishes/cafe.jpg'),
  ];
}
