import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/bebidas_data.dart';
import '../../model/dish.dart';
import '../_core/widgets/app_colors.dart';
import '../_core/widgets/bag_provider.dart';

class BebidasScreen extends StatelessWidget {
  const BebidasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebidas'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Semantics(
              label: 'Sacola: ${bagProvider.dishesOnBag.length} itens',
              child: badges.Badge(
                showBadge: bagProvider.dishesOnBag.isNotEmpty,
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: AppColors.mainColor),
                badgeContent: Text('${bagProvider.dishesOnBag.length}',
                    style: const TextStyle(color: Colors.black)),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Mais pedidos',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Column(
              children: List.generate(BebidasData.listBebidas.length, (index) {
                Dish dish = BebidasData.listBebidas[index];
                return ListTile(
                  leading: Image.asset(dish.imagePath,
                      width: 48, height: 48, fit: BoxFit.cover),
                  title: Text(dish.name),
                  subtitle: Text(
                      '${dish.description}\nR\$ ${dish.price.toStringAsFixed(2).replaceAll('.', ',')}'),
                  isThreeLine: true,
                  trailing: IconButton(
                    tooltip: 'Adicionar ${dish.name}',
                    onPressed: () {
                      context.read<BagProvider>().addAllDishes([dish]);
                    },
                    icon: const Icon(Icons.add),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
