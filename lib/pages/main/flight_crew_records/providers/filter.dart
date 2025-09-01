import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/models/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';

@Riverpod(dependencies: [])
class FlightCrewRecordFilter extends _$FlightCrewRecordFilter {
  @override
  FlightCrewRecordFilterState build(
    Staff staff,
    FlightCrewRecordCategory category,
  ) {
    return FlightCrewRecordFilterState(staff: staff, category: category);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(FlightCrewRecordFilterState newState) {
    state = newState;
  }
}
