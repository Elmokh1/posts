import 'package:flutter/material.dart';
import '../api/api_manger.dart';
import '../api/post_model.dart';



class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: ApiManger(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 1,color: Colors.red,),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
