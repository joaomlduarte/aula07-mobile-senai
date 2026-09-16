import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinho.dart';
import 'login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Carrinho(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'S&M Hotel',
        home: Login(),
      ),
    ),
  );
}
