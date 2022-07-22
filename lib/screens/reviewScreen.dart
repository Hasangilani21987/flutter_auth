import 'package:flutter/material.dart';
import '../components/reviewHeader.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ReviewHeader(),
          ],
        ),
      ),
    );
  }
}
