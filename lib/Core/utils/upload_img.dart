

import 'dart:io';

import 'package:dio/dio.dart';

Future<MultipartFile> prepareToUploadImage(File file) {
  
  String fileName = file.path.split('/').last;
  return MultipartFile.fromFile(file.path,
      filename: fileName);
}
