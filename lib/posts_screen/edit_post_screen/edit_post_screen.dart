import 'package:flutter/material.dart';
import 'package:tp_flutter_firebase/posts_screen/widgets/label_button.dart';

class AddPostScreen extends StatelessWidget {
  static const routeName = '/add-post-screen';

  const AddPostScreen({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 17, 18),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LabelButton(
                label: "Annuler",
                onTap: () => _back(context),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Title..",
                hintStyle:  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                border: InputBorder.none,
              ),
              style:  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Description...",
                hintStyle:  TextStyle(
                  fontSize: 20,
                  color:  Color.fromARGB(255, 164, 164, 164),
                ),
                border: InputBorder.none,
              ),
              style:  TextStyle(
                fontSize: 20,
                color:  Color.fromARGB(255, 164, 164, 164),
              ),
            ),
            const Spacer(),
            ElevatedButton(onPressed: () => _save(context), child: const Text("Add post"),)
          ],
        ),
      ),
    );
  }

  void _back(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _save(BuildContext context) {
    Navigator.of(context).pop();
  }
}
