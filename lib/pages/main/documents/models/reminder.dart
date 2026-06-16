import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';

@freezed
sealed class ReminderFormState with _$ReminderFormState {
  const ReminderFormState._();

  const factory ReminderFormState({
    TemporalDateTime? expiredAt,
    @Default(false) bool ninetyDaysBefore,
    @Default(false) bool sixtyDaysBefore,
    @Default(false) bool thirtyDaysBefore,
    TemporalDateTime? reminderDate,
    @Default([]) List<Staff> selectedStaff,
    @Default(false) bool isSubmitting,
    String? dateValidationError,
  }) = _ReminderFormState;

  static const dateRequiredMessage = 'Please select at least one reminder date';

  bool isOffsetDateAvailable(int daysBefore, {DateTime? now}) {
    final expiry = expiredAt?.getDateTimeInUtc();
    if (expiry == null) return false;

    final candidate = expiry.subtract(Duration(days: daysBefore));
    return !candidate.isBefore(now ?? DateTime.now());
  }

  List<TemporalDateTime> buildReminderDates({DateTime? now}) {
    final dates = <TemporalDateTime>[];
    final expiry = expiredAt?.getDateTimeInUtc();
    final currentTime = now ?? DateTime.now();

    if (expiry != null) {
      if (ninetyDaysBefore) {
        final candidate = expiry.subtract(const Duration(days: 90));
        if (!candidate.isBefore(currentTime)) {
          dates.add(TemporalDateTime(candidate));
        }
      }
      if (sixtyDaysBefore) {
        final candidate = expiry.subtract(const Duration(days: 60));
        if (!candidate.isBefore(currentTime)) {
          dates.add(TemporalDateTime(candidate));
        }
      }
      if (thirtyDaysBefore) {
        final candidate = expiry.subtract(const Duration(days: 30));
        if (!candidate.isBefore(currentTime)) {
          dates.add(TemporalDateTime(candidate));
        }
      }
    }

    if (reminderDate != null) {
      dates.add(reminderDate!);
    }

    final unique = <String, TemporalDateTime>{};
    for (final date in dates) {
      unique[date.getDateTimeInUtc().toIso8601String()] = date;
    }
    return unique.values.toList(growable: false);
  }

  ReminderFormResult? toResult({DateTime? now}) {
    final dates = buildReminderDates(now: now);
    if (dates.isEmpty) return null;

    return ReminderFormResult(
      dates: dates,
      staff: selectedStaff,
    );
  }

  ReminderFormState validate({DateTime? now}) {
    final hasDates = buildReminderDates(now: now).isNotEmpty;
    return copyWith(
      dateValidationError: hasDates ? null : dateRequiredMessage,
    );
  }
}

@freezed
sealed class ReminderFormResult with _$ReminderFormResult {
  const factory ReminderFormResult({
    required List<TemporalDateTime> dates,
    @Default([]) List<Staff> staff,
  }) = _ReminderFormResult;
}
