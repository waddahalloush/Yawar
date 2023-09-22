part of 'upload_cubit.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.initial() = _Initial;
  const factory UploadState.loading() = _loading;
  const factory UploadState.success({required String successMsg}) = _success;
  const factory UploadState.error({required String errorMsg}) = _error;
  
}
