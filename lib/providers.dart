import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yawar_test/features/Posts/presentation/cubit/posts_cubit.dart';
import 'package:yawar_test/features/Posts/presentation/cubit/upload_cubit.dart';

import 'injection_container.dart' as di;

MultiBlocProvider mProvider({required Widget child}) =>
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => di.sl<PostsCubit>()..getAllPosts(1),
      ),
      BlocProvider(
        create: (context) => di.sl<UploadCubit>(),
      ),
      // BlocProvider(
      //   create: (context) => di.sl<MessageCubit>(),
      // ),
    ], child: child);
