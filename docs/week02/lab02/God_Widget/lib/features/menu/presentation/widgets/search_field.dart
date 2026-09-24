import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {

  final TextEditingController controller;
  final String query;
  final void Function(String) onChanged;
  final void Function() onClear;

  const SearchField({
    super.key,
    required this.controller,
    required this.query,
    required this.onChanged,
    required this.onClear,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Cari menu...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: query.isEmpty
              ? null
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    onClear();
                  }
                ),
          border: OutlineInputBorder(),
        ),
        onChanged: (String value) {
          onChanged(value);
        },
      ),
    );
  }
}