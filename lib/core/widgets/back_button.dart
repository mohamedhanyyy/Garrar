import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {

  final BuildContext context;

  const BackButtonWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.grey),
        onPressed: () {},
      ),
      onTap: () {
        Navigator.pop(this.context);
      },
    );
  }
}
