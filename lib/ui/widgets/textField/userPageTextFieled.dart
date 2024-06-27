import 'package:flutter/material.dart';

class Userpagetextfieled extends StatefulWidget {
  const Userpagetextfieled(
      {super.key, required TextEditingController userName, required this.title})
      : _userName = userName;

  final TextEditingController _userName;
  final String title;

  @override
  State<Userpagetextfieled> createState() => _UserpagetextfieledState();
}

class _UserpagetextfieledState extends State<Userpagetextfieled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget._userName,
        decoration: InputDecoration(
          labelText: widget.title,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
        ));
  }
}
