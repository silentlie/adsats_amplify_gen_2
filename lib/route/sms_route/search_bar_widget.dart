part of 'notices_filter.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget(
      {super.key, required this.filter, required this.fetchRawData});
  final NoticesFilter filter;
  final Function fetchRawData;
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _textEditingController.text = widget.filter.search;
    return SearchBar(
      elevation: const WidgetStatePropertyAll(1),
      constraints: const BoxConstraints(
        minHeight: 32,
        maxWidth: 200,
      ),
      controller: _textEditingController,
      onSubmitted: (value) {
        widget.filter.search = value;
        widget.fetchRawData();
      },
      trailing: const [Icon(Icons.search)],
    );
  }
}