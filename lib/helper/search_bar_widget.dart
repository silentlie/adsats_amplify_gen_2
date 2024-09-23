part of '../route/settings_route/settings_filter.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.onSubmitted,
    this.initialValue = "",
  });
  final ValueChanged<String> onSubmitted;
  final String initialValue;
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _textEditingController.text = widget.initialValue;
    return SearchBar(
      elevation: const WidgetStatePropertyAll(1),
      constraints: const BoxConstraints(
        minHeight: 32,
        maxWidth: 200,
      ),
      controller: _textEditingController,
      onSubmitted: (value) {
        widget.onSubmitted(value);
      },
      trailing: const [Icon(Icons.search)],
    );
  }
}
