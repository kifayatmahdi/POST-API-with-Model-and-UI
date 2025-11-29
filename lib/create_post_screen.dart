import 'package:flutter/material.dart';
import 'api_service.dart';
import 'post_model.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  CreatePostScreenState createState() => CreatePostScreenState();
}

class CreatePostScreenState extends State<CreatePostScreen> {
  final ApiService api = ApiService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  bool isLoading = false;

  Future<void> submitPost() async {
    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() => isLoading = true);

    final pst = PostModel(title: title, body: body, userId: 1);

    final success = await api.createPost(pst);

    setState(() => isLoading = false);

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Post Created Successfully!")));
      titleController.clear();
      bodyController.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to create post")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post (POST API)")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 20),

            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: "Body"),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: submitPost, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
