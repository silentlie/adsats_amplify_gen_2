import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/models/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';

@riverpod
class SubcategoryFilter extends _$SubcategoryFilter {
  @override
  SubcategoryFilterState build(String categoryId) {
    return SubcategoryFilterState(categoryId: categoryId);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(SubcategoryFilterState newState) {
    state = newState;
  }
}
