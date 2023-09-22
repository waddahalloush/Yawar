import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yawar_test/Core/utils/constants.dart';
import 'package:yawar_test/features/Posts/presentation/cubit/posts_cubit.dart';
import 'package:yawar_test/features/Posts/presentation/pages/create_post_screen.dart';
import 'package:yawar_test/features/Posts/presentation/widgets/post_item_shimmer.dart';

import '../widgets/post_item.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // debugPrint("=======Max=========${maxScroll.toString()}================");
    // debugPrint(
    //     "=======Current=========${currentScroll.toString()}================");
    if (maxScroll==currentScroll) {
       context
            .read<PostsCubit>()
            .getAllPosts(context.read<PostsCubit>().currentPageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreatePostScreen(),
            ));
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 145, 192, 249)),
      appBar: AppBar(
          elevation: 4,
          title: Text(
            "شركة معالي الخير",
            style: Theme.of(context).primaryTextTheme.displayLarge,
          )),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state.status == PostStatus.error) {
            Constants.showAwesomeErrorSnack(
                context: context, msg: state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state.status == PostStatus.success) {
            if (state.posts.posts.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<PostsCubit>()
                      .getAllPosts(state.posts.currentPage);
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.posts.posts.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index < state.posts.posts.length
                        ? PostItem(
                            post: state.posts.posts[index],
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                                child: CircularProgressIndicator.adaptive()),
                          );
                  },
                ),
              );
            } else {
              return Constants.emptyListView(
                  img: "assets/images/empty.png", text: "لا يوجد بوستات");
            }
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostsCubit>().getAllPosts(state.posts.currentPage);
              },
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) =>
                    PostItemShimmer(),
              ),
            );
          }
        },
      ),
    );
  }
}
