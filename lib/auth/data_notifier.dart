import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class DataNotifier with ChangeNotifier {
  List<Document> documents = [];
  List<Notice> inbox = [];
  List<Notice> sent = [];
  List<Staff> staff = [];
  List<Aircraft> aircraft = [];
  List<Role> roles = [];
  List<Category> categories = [];
  List<Subcategory> subcategories = [];
}
