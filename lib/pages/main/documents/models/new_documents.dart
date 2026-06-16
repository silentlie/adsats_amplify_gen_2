import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/models/reminder.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_documents.freezed.dart';

enum NewDocumentsStage {
  details,
  reminders,
}

@freezed
sealed class NewDocumentsState with _$NewDocumentsState {
  const NewDocumentsState._();

  const factory NewDocumentsState({
    Staff? uploader,
    Subcategory? subcategory,
    @Default([]) List<Aircraft> aircraft,
    @Default(false) bool archived,
    TemporalDateTime? issuedAt,
    TemporalDateTime? expiredAt,
    @Default(NewDocumentsStage.details) NewDocumentsStage stage,
    @Default(ReminderFormState()) ReminderFormState reminderState,
  }) = _NewDocumentsState;

  bool get canUpload => uploader != null && subcategory != null;

  bool get isExpiryAvailable => expiredAt != null;

  ReminderFormResult? get reminderResult => reminderState.toResult();

  NewDocumentsState withExpiredAt(TemporalDateTime? value) {
    return copyWith(
      expiredAt: value,
      reminderState: reminderState.copyWith(expiredAt: value),
    );
  }
}
