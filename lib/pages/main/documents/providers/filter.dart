import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/models/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';

@Riverpod()
class DocumentFilter extends _$DocumentFilter {
  @override
  DocumentFilterState build(Subcategory subcategory) {
    return DocumentFilterState(subcategory: subcategory);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(DocumentFilterState newState) {
    state = newState;
  }
}
