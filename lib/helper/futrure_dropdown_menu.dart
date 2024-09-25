import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class FutrureDropdownMenu<T extends Model> extends StatelessWidget {
  const FutrureDropdownMenu({
    super.key,
    required this.modelType,
    required this.toList,
    this.enabled = true,
    this.text = "",
    required this.onSelected,
    this.initialSelection,
    this.padding = const EdgeInsets.all(8.0),
  });
  final ModelType modelType;
  final List<DropdownMenuEntry<T>> Function(List<T> allData) toList;
  final bool enabled;
  final String text;
  final ValueChanged<T?> onSelected;
  final T? initialSelection;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list(modelType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final allData = snapshot.data!.cast<T>();
          return DropdownMenu(
            dropdownMenuEntries: toList(allData),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
            enableSearch: enabled,
            hintText: text,
            menuHeight: 200,
            label: Text(text),
            onSelected: onSelected,
            initialSelection: initialSelection ?? allData.firstOrNull,
            expandedInsets: EdgeInsets.zero,
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
