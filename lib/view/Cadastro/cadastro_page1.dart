import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Nos conte um pouco sobre você!'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Digite seu nome',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '1/5',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () => Navigate.cadastroPage2(context),
                child: const Icon(
                  CupertinoIcons.arrow_right_square_fill,
                ))
          ],
        ),
      ),
    );
  }
}