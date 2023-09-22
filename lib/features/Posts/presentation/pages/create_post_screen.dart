import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:yawar_test/Core/Config/Extensions/media_query_ex.dart';
import 'package:yawar_test/Core/utils/constants.dart';
import 'package:yawar_test/features/Posts/presentation/cubit/upload_cubit.dart';

import '../widgets/action_button.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: BlocConsumer<UploadCubit, UploadState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (errorMsg) => Constants.showAwesomeErrorSnack(
                    context: context, msg: errorMsg),
                success: (successMsg) {
                  _controller.clear();
                  Constants.showAwesomeSuccessSnack(
                      context: context, msg: successMsg);
                },
              );
            },
            builder: (context, state) {
              var cubit = context.read<UploadCubit>();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ActionButton(
                          heroIcons: HeroIcons.xCircle,
                          heroIconStyle: HeroIconStyle.outline,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "إضافة منشور",
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        const Spacer(),
                        AppButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            cubit.postData['content'] = _controller.text;

                            context.read<UploadCubit>().addPost();
                          },
                          child: state == UploadState.loading()
                              ? Constants.onLoading()
                              : Text(
                                  "نشر",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodySmall,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextfield(
                      controller: _controller,
                      hintText: 'أخبر أصدقائك ما الجديد ....',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if (cubit.postimage != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          cubit.postimage!,
                          height: 200,
                          width: context.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButton(
                          onTap: () async {
                            cubit.pickImageFromGallery();
                          },
                          heroIcons: HeroIcons.photo,
                          heroIconStyle: HeroIconStyle.outline,
                          label: cubit.postimage != null
                              ? "تغيير الصورة"
                              : "إضافة صورة",
                        ),
                        if (cubit.postimage != null)
                          ActionButton(
                            onTap: () async {
                              cubit.postimage = null;
                            },
                            heroIcons: HeroIcons.trash,
                            heroIconStyle: HeroIconStyle.outline,
                            color: Colors.red,
                            label: "إزالة الصورة",
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    buildProgress(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildProgress() => BlocBuilder<UploadCubit, UploadState>(
        builder: (context, state) {
          var cubit = context.read<UploadCubit>();
          return StreamBuilder<TaskSnapshot>(
            stream: cubit.uploadTask?.snapshotEvents,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                TaskSnapshot data = snapshot.data!;
                double progressVal =
                    (data.bytesTransferred / data.totalBytes) * 100;
                return SizedBox(
                  height: 50,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Colors.green,
                        value: progressVal,
                      ),
                      Center(
                        child: Text(
                          "$progressVal %",
                          style:
                              Theme.of(context).primaryTextTheme.headlineMedium,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          );
        },
      );
}
