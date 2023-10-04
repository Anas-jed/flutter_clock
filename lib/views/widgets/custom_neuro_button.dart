import 'package:flutter/material.dart';

class CustomNeuroButton extends StatelessWidget {
  final Widget content;
  const CustomNeuroButton({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(

      ),
      child: content,
    );
  }
}