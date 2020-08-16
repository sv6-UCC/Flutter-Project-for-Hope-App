import 'package:flutter/material.dart';
import '../bloc/navigation_bloc.dart';

class GalleryPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Gallery Goes here",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
