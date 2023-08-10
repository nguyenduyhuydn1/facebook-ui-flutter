import 'package:facebook_ui/config/constants/constant.dart';
import 'package:facebook_ui/config/constants/data.dart';
import 'package:facebook_ui/features/models/models.dart';
import 'package:facebook_ui/features/presentation/views/views.dart';
import 'package:facebook_ui/features/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(icon: Icons.search, size: 30, onPressed: () {}),
              CircleButton(icon: Icons.message, size: 30, onPressed: () {}),
            ],
          ),
          const SliverToBoxAdapter(child: PostView(currentUser: currentUser)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(child: RoomsView(users: onlineUsers)),
          ),
          SliverToBoxAdapter(
            child: StoriesView(user: currentUser, stories: stories),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: posts.length,
              (context, index) {
                final post = posts[index];
                return ShowPostView(post: post);
              },
            )),
          )
        ],
      ),
    );
  }
}

class ShowPostView extends StatelessWidget {
  final Post post;
  const ShowPostView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderPost(post: post),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(post.caption),
                ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Image.network(post.imageUrl!),
                )
              : const SizedBox(height: 10)
        ],
      ),
    );
  }
}

class _HeaderPost extends StatelessWidget {
  const _HeaderPost({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomCircleAvatar(image: post.user.imageUrl),
      const SizedBox(width: 10),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.user.name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(children: [
            Text(post.timeAgo),
            const SizedBox(width: 10),
            Icon(Icons.public, color: Colors.grey[200], size: 12),
          ])
        ],
      )),
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
    ]);
  }
}
