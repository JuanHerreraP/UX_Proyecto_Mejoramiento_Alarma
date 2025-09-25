import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';



class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<DropdownItem<String>> items;
  final ValueChanged<String> callback;
  final MultiSelectController<String> controller;

  const CustomDropDown({super.key, required this.items, required this.hintText, required this.callback, required this.controller });

  @override
  Widget build(BuildContext context) {

    return MultiDropdown(
      singleSelect: true,
      items: items,
      controller: controller,
      enabled: true,
      chipDecoration: const ChipDecoration(
        wrap: true,
        runSpacing: 2,
        spacing: 10,
      ),
      fieldDecoration: FieldDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black87),
        showClearIcon: false,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Seleccione alguno porfavor';
        }
        return null;
      },
      onSelectionChange: (selectedItems) {
        if (selectedItems.isNotEmpty) {
          callback(selectedItems.first);
        }
      },
    );
  }
}

