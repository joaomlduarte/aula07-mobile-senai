import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/_core/widgets/app_theme.dart';
import 'ui/_core/widgets/bag_provider.dart';
import 'ui/bebidas/bebidas_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BagProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery',
        theme: AppTheme.appTheme,
        home: const BebidasScreen(),
      ),
    ),
  );
}
