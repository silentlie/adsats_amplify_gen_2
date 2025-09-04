import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';

class AmplifyS3API {
  Future<StorageGetUrlResult> getFileUrl(String s3Path) async {
    return await Amplify.Storage.getUrl(
      path: StoragePath.fromString(s3Path),
    ).result;
  }

  Future<StorageUploadFileResult> uploadFile({
    required PlatformFile file,
    required String s3Path,
    Function(StorageTransferProgress progress)? onProgress,
  }) async {
    return await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(
        file.readStream!,
        size: file.size,
      ),
      path: StoragePath.fromString(s3Path),
      onProgress: onProgress,
    ).result;
  }

  Future<StorageCopyResult> copyFile(
    String sourceS3Path,
    String destinationS3Path,
  ) async {
    return await Amplify.Storage.copy(
      source: StoragePath.fromString(sourceS3Path),
      destination: StoragePath.fromString(destinationS3Path),
    ).result;
  }

  /// Moves the file to a 'delete' folder and sets a 30-day expiration instead of deleting immediately.
  Future<void> deleteFile(String s3Path) async {
    final deleteFolder = 'delete/';
    final fileName = s3Path.split('/').last;
    final destinationS3Path = '$deleteFolder$fileName';

    // Move file to delete folder
    await Amplify.Storage.copy(
      source: StoragePath.fromString(s3Path),
      destination: StoragePath.fromString(destinationS3Path),
    ).result;
    
    await Amplify.Storage.remove(
      path: StoragePath.fromString(s3Path),
    ).result;
  }
}
