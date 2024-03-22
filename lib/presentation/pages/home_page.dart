import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/presentation/bloc/posts_bloc.dart';

import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';

import '../../utils/toasts.dart';
import 'add_post_page.dart';
import 'post_details_page.dart';
import 'edit_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: kScaffoldBackgroundColor,
          centerTitle: false,
          title: const ProfileCircleSmallWidgetView(),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<PostsBloc>().add(OnRefreshAllPosts());
                },
                icon: const Icon(
                  CupertinoIcons.refresh,
                  color: Colors.white,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginMedium4),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: Gap(kMarginXLarge)),

              /// TITLE
              const SliverToBoxAdapter(
                child: Text(
                  "API Translation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextHeading2X,
                      fontWeight: FontWeight.w700),
                ),
              ),

              /// GAP
              const SliverToBoxAdapter(child: Gap(kMarginXLarge)),

              /// SEARCH VIEW
              const SliverToBoxAdapter(child: SearchView()),

              /// GAP
              const SliverToBoxAdapter(child: Gap(kMarginXLarge)),

              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TABS VIEW
                    const Expanded(
                      child: ApiTabBarView(),
                    ),

                    /// ADD BUTTON
                    AddButton(
                      onTapAdd: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddPostPage(),
                            ));
                      },
                    ),
                  ],
                ),
              ),

              /// USER CARDS
              const UserCardListView()
            ],
          ),
        ));
  }
}

class UserCardListView extends StatelessWidget {
  const UserCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      listener: (context, state) {
        final ShowToastMessage showToastMessage = ShowToastMessage();
        if (state is DeletePostSuccessState) {
          showToastMessage.showSuccessToast("Post deleted successfully");
        } else if (state is EditPostSuccessState) {
          showToastMessage.showSuccessToast("Post edited successfully");
        } else if (state is AddPostSuccessState) {
          showToastMessage.showSuccessToast("Successfully added a new post");
        }
      },
      builder: (context, state) {
        if (state is GetPostsLoadingState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GetPostsSuccessState) {

          final List<PostVO> postList = state.postVOList;

          return SliverList(
            delegate: SliverChildBuilderDelegate(childCount: postList.length,
                (context, index) {
              final PostVO post = postList[index];
              return Hero(
                tag: post.id.toString(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailsPage(
                            postVO: post,
                          ),
                        ));
                  },
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(
                            kMarginXLarge,
                          ),
                          gradient: kUserCardGradient),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMarginMedium4, vertical: kMarginMedium4),
                      margin: const EdgeInsets.only(bottom: kMarginMedium2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              /// AVATAR
                              const CircleAvatar(
                                maxRadius: 30,
                                backgroundColor: Colors.black,
                                child: Text(
                                  "EX",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25),
                                ),
                              ),

                              const Gap(kMarginSmall),

                              /// NAME
                              Text(
                                post.id.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: kTextRegular2X),
                              ),

                              /// API
                              SizedBox(
                                width: 100,
                                child: Text(
                                  post.title.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: kTextRegular),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// DELETE API BUTTON
                              DeleteButton(
                                onTapDelete: () {
                                  showDeleteDialog(context, post.id ?? 0);
                                },
                              ),
                              const SizedBox(height: kMarginXXLarge),

                              /// EDIT API BUTTON
                              EditButton(
                                onTapEdit: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditPostPage(
                                          postVO: post,
                                        ),
                                      ));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        } else if (state is GetPostsFailureState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text("Error Fetching Data ${state.errorMessage}"),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }

  /// DELETE POP UP
  void showDeleteDialog(BuildContext context, int postId) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.9),
          // shadowColor: Colors.black.withOpacity(0.9),
          surfaceTintColor: Colors.black.withOpacity(0.9),
          elevation: 2,
          titlePadding: const EdgeInsets.symmetric(vertical: kMarginXLarge),
          title: const Text(
            "Delete API",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<PostsBloc>().add(OnDeletePostEvent(id: postId));
                context.read<PostsBloc>().add(GetAllPostsEvent());
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kMarginMedium3),
                  ),
                  minimumSize: const Size(200, 50),
                  backgroundColor: kTextConfirmButtonColor),
              child: const Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: kTextRegular2X,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

/// ADD BUTTON
class AddButton extends StatelessWidget {
  final void Function() onTapAdd;
  const AddButton({
    super.key,
    required this.onTapAdd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAdd,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kMarginMedium2),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium2,
          vertical: kMarginSmall,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// ADD BUTTON
class DeleteButton extends StatelessWidget {
  final void Function() onTapDelete;
  const DeleteButton({
    super.key,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDelete,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kMarginMedium2),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium2,
          vertical: kMarginSmall,
        ),
        child: const Icon(
          CupertinoIcons.delete,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}

/// ADD BUTTON
class EditButton extends StatelessWidget {
  final void Function() onTapEdit;
  const EditButton({
    super.key,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapEdit,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kMarginMedium2),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium2,
          vertical: kMarginSmall,
        ),
        child: const Icon(
          CupertinoIcons.pencil_ellipsis_rectangle,
          color: Colors.black,
        ),
      ),
    );
  }
}

/// API TABS
class ApiTabBarView extends StatefulWidget {
  const ApiTabBarView({
    super.key,
  });

  @override
  State<ApiTabBarView> createState() => _ApiTabBarViewState();
}

class _ApiTabBarViewState extends State<ApiTabBarView> {
  int selectedTabIndex = 0;

  final List<String> tabSampleNames = ["All", "API_1", "API_2", "API_3"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: tabSampleNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                selectedTabIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: kMarginXLarge2),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  /// TAB NAME
                  Text(
                    tabSampleNames[index],
                    style: TextStyle(
                        color: selectedTabIndex == index
                            ? kPrimaryColor
                            : kTextSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: kTextRegular2X),
                  ),

                  /// SPACER
                  const Gap(kMarginMedium3),

                  /// TAB INDICATOR
                  Container(
                    height: kMarginMedium,
                    width: kMarginMedium,
                    decoration: BoxDecoration(
                        color: selectedTabIndex == index
                            ? kPrimaryColor
                            : kTextSecondaryColor,
                        shape: BoxShape.circle),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// SEARCH VIEW
class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kMarginMedium4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kMarginMedium4),
          ),
          prefixIcon: const Icon(CupertinoIcons.search),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: kMarginLarge, vertical: kMarginMedium3),
          fillColor: kTextFieldFillColor,
          filled: true,
          hintText: "Find your api",
          hintStyle: const TextStyle(color: kTextSecondaryColor)),
    );
  }
}

/// SMALL PROFILE WIDGET
class ProfileCircleSmallWidgetView extends StatelessWidget {
  const ProfileCircleSmallWidgetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      maxRadius: kMarginLarge,
      backgroundColor: Colors.black,
      child: Text(
        "EX",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: kTextHeading1X),
      ),
    );
  }
}
