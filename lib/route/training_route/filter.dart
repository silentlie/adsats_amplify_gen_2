import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/models/Subcategory.dart';
import 'package:flutter/material.dart';

class Filter {
  String search;
  bool? archived;
  Subcategory subcategory;
  DateTimeRange? createdAt;
  Filter({
    this.search = "",
    this.archived,
    required this.subcategory,
    this.createdAt,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": betweenDateRange(createdAt!)}
        : null;
    result["subcategoryId"] = {"eq": subcategory.id};
    return result;
  }
}
