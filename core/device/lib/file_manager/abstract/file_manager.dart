import 'package:device/globals/_globals.dart';
import 'package:image_picker/image_picker.dart';

abstract class FileManager {
  static FileManager get instance => getIt<FileManager>();

  static void register(FileManager manager) =>
      getIt.registerSingleton<FileManager>(manager);

  Future<XFile?> pickPhotoFromCamera();

  Future<XFile?> pickVideoFromCamera();

  Future<XFile?> pickPhotoFromGallery();

  Future<XFile?> pickVideoFromGallery();
}
