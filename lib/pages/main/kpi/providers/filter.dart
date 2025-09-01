import 'package:adsats_amplify_gen_2/pages/main/kpi/models/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';

@Riverpod()
class StaffKPIFilter extends _$StaffKPIFilter {
  @override
  StaffKPIFilterState build() {
    return StaffKPIFilterState(archived: false);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(StaffKPIFilterState newState) {
    state = newState;
  }
}
