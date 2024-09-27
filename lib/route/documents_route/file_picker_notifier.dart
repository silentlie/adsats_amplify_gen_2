import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerNotifier extends ChangeNotifier {
  List<PlatformFile> selectedFiles = [];

  void addFiles(List<PlatformFile> files) {
    selectedFiles.addAll(files);
    notifyListeners();
  }

  void removeFile(PlatformFile file) {
    selectedFiles.remove(file);
    notifyListeners();
  }

  void clearFiles() {
    selectedFiles.clear();
    notifyListeners();
  }
}
