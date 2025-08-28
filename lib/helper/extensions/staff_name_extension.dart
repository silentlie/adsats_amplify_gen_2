import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension StaffNameExtension on Staff {
  String get fullName => '$firstName $lastName';
}
