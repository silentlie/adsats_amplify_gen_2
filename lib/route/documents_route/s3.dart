part of 'documents_widget.dart';

Future<void> getFileUrl(Document document) async {
  try {
    String pathStr = "${document.name}_${document.id}";

    final result = await Amplify.Storage.getUrl(
      path: StoragePath.fromString(pathStr),
      options: const StorageGetUrlOptions(
        pluginOptions: S3GetUrlPluginOptions(
          validateObjectExistence: true,
          expiresIn: Duration(days: 1),
        ),
      ),
    ).result;
    // debugPrint('url: ${result.url}');
    launchUrl(result.url);
  } on StorageException catch (e) {
    debugPrint(e.message);
    rethrow;
  }
}

Future<void> uploadFiles(
  FilePickerResult filePickerResult,
  Staff staff,
  Subcategory subcategory,
  List<Aircraft> aircraft,
) async {
  await Future.wait(
    filePickerResult.files.map(
      (file) => uploadFile(
        file,
        staff,
        subcategory,
        aircraft,
      ),
    ),
  );
}

Future<void> uploadFile(
  PlatformFile file,
  Staff staff,
  Subcategory subcategory,
  List<Aircraft> aircraft,
) async {
  try {
    final document = Document(
      name: file.name,
      archived: false,
      staff: staff,
      subcategory: subcategory,
    );

    // Create the document and get its ID
    final response = await Amplify.API
        .mutate(request: ModelMutations.create(document))
        .response;

    String id = response.data!.id;
    debugPrint("document.id: $id");

    // Concurrently upload the file and create AircraftDocument entries
    final fileUploadFuture = Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(file.readStream!, size: file.size),
      path: StoragePath.fromString("${file.name}_$id"),
      onProgress: (progress) {
        // Optional debug print for progress
        debugPrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;

    final aircraftDocumentFutures = aircraft.map((aircraft) async {
      final aircraftResponse = await Amplify.API
          .mutate(
            request: ModelMutations.create(
              AircraftDocument(document: document, aircraft: aircraft),
            ),
          )
          .response;

      debugPrint("AircraftDocument ID: ${aircraftResponse.data!.id}");
    }).toList();

    // Wait for all futures to complete
    final results = await Future.wait([
      fileUploadFuture,
      ...aircraftDocumentFutures,
    ]);

    // The file upload result is the first in the results list
    debugPrint(
        'Successfully uploaded file: ${results.first!.uploadedItem.path}');
  } on StorageException catch (e) {
    debugPrint('Storage Exception: ${e.message} ,${e.recoverySuggestion}');
  } on ApiException catch (e) {
    debugPrint('API Exception: POST request failed: $e');
  } catch (e) {
    debugPrint('General Error: $e');
  }
}
