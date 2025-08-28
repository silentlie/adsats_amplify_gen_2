import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';

class AmplifyS3API {
  Future<StorageGetUrlResult> getFileUrl(String s3Path) async {
    return await Amplify.Storage.getUrl(
      path: StoragePath.fromString(s3Path),
    ).result;
  }

  Future<StorageUploadFileResult> uploadFile(
    PlatformFile file,
    String s3Path,
    Function(StorageTransferProgress progress)? onProgress,
  ) async {
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

  Future<StorageRemoveResult> deleteFile(String s3Path) async {
    return await Amplify.Storage.remove(
      path: StoragePath.fromString(s3Path),
    ).result;
  }
}
