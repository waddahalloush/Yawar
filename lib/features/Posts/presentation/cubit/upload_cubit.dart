// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yawar_test/Core/Helpers/map_failure_to_msg.dart';

import '../../../../Core/error/failures.dart';
import '../../domain/usecases/add_post_usecase.dart';

part 'upload_cubit.freezed.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final AddPostUsecase addPostUsecase;
  File? postimage;
  UploadTask? uploadTask;
  Map<String, dynamic> postData = {};
  UploadCubit({
    required this.addPostUsecase,
  }) : super(UploadState.initial());

  Future<void> addPost() async {
    emit(UploadState.loading());
    Either<Failure, String> data = await addPostUsecase(postData);
    emit(data.fold((l) => UploadState.error(errorMsg: mapFailureToMessage(l)),
        (r) => UploadState.success(successMsg: r)));
  }

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 50, // <- Reduce Image quality
          maxHeight: 250, // <- reduce the image size
          maxWidth: 250);
      if (image == null) return;
      var img = File(image.path);
      postimage = img;
      emit(UploadState.success(successMsg: "تم إلتقاط الصورة"));
      uploadImage(img: img);
    } on PlatformException catch (e) {
      emit(UploadState.error(errorMsg: e.message.toString()));
    }
  }

  Future uploadImage({required File img}) async {
    try {
      final path = "Images/${img.path}";
      final ref = FirebaseStorage.instance.ref().child(path);
       uploadTask = ref.putFile(img);
      final snapshot = await uploadTask!.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      postData['src_url'] = downloadUrl;
      emit(UploadState.success(successMsg: "تم تحميل الصورة"));
    } catch (e) {
      emit(UploadState.error(errorMsg: e.toString()));
    }
  }
}
