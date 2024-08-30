import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

String? listToString<T>(List<T> input) {
  if (input.isEmpty) return null; // Handle empty lists

  // Check the type of list and process accordingly
  if (T == Staff) {
    return (input as List<Staff>).map((e) => e.name).toList().join(', ');
  } else if (T == Role) {
    return (input as List<Role>).map((e) => e.name).toList().join(', ');
  } else if (T == Aircraft) {
    return (input as List<Aircraft>).map((e) => e.name).toList().join(', ');
  } else if (T == Subcategory) {
    return (input as List<Subcategory>).map((e) => e.name).toList().join(', ');
  } else if (T == Category) {
    return (input as List<Category>).map((e) => e.name).toList().join(', ');
  }
  return null;
}

String? mapToString<K, V>(Map<K, V> input) {
  if (input.isEmpty) return null; // Handle empty maps

  if (K == Subcategory) {
    return List<Subcategory>.from(input.keys)
        .map((e) => e.name)
        .toList()
        .join(', ');
  }
  return null;
}
