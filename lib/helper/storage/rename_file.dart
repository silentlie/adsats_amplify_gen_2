import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

Future<T> renameFile<T>({
  required AmplifyS3API storage,
  required String sourcePath,
  required String destinationPath,
  required Future<T> Function() save,
}) async {
  if (sourcePath == destinationPath) return save();

  await storage.copyFile(sourcePath, destinationPath);
  final T saved;
  try {
    saved = await save();
  } catch (_) {
    try {
      await storage.deleteFile(destinationPath);
    } catch (cleanupError) {
      safePrint('Failed to remove the unsaved file copy: $cleanupError');
    }
    rethrow;
  }

  // Metadata now points to the new file, so cleanup must not undo the save.
  try {
    await storage.deleteFile(sourcePath);
  } catch (cleanupError) {
    safePrint(
        'File renamed, but the old copy could not be removed: $cleanupError');
  }
  return saved;
}
