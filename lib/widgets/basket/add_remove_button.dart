import 'package:flutter/material.dart';

enum AddRemove {
  add,
  remove,
}

class AddRemoveButton extends StatelessWidget {
  final AddRemove addRemove;
  final VoidCallback onTap;

  const AddRemoveButton({
    super.key,
    required this.addRemove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color(0xFF7DCCEC),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(
          addRemove == AddRemove.add ? Icons.add : Icons.remove,
          size: 13,
          color: Colors.white,
        ),
      ),
    );
  }
}
