import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFlightCrewRecordView extends ConsumerWidget {
  const EditFlightCrewRecordView({super.key, required this.record});

  final FlightCrewRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog.adaptive();
  }
}
