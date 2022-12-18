import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {

    BuildContext context;

    BackButtonWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.grey),
      onPressed: () {
        Navigator.pop(this.context);
      },
    );
  }
}
