import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.grey),
        onPressed: () {},
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
