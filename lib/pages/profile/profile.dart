import 'package:flutter/material.dart';
import 'package:papuf/widgets/text_appbar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light, // status bar brightness
        title: textAppBar("Profile"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _body(),
    );
  }
}

_body() {
  return Container(
    color: Colors.white,
  );
}
