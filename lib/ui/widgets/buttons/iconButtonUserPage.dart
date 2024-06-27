import 'package:flutter/material.dart';
import 'package:web/ui/widgets/textField/userPageTextFieled.dart';

class IconButtonWidget extends StatefulWidget {
  final Map<String, String>? user;
  final BuildContext context;
  final int index;
  final String title;
  final bool isEdit;
  final TextEditingController? userNameController;
  final TextEditingController? userTitleController;
  final List<Map<String, String>> users;
  final void Function() onModalClose;

  IconButtonWidget(
      {this.user,
      required this.context,
      this.index = 0,
      required this.title,
      required this.isEdit,
      this.userNameController,
      this.userTitleController,
      required this.users,
      required this.onModalClose});

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.users);
    return IconButton(
      icon: widget.isEdit
          ? const Icon(Icons.edit, color: Color.fromARGB(255, 196, 196, 0))
          : const Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
      onPressed: () async {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        if (widget.isEdit) {
          widget.userNameController!.text = widget.user!['name']!;
          widget.userTitleController!.text = widget.user!['subtitle']!;
        } else {
          widget.userNameController!.text = '';
          widget.userTitleController!.text = '';
        }
        await showModalBottomSheet(
          context: context,
          constraints: BoxConstraints(
            minWidth: width,
            maxHeight: height * 0.40,
          ),
          builder: (BuildContext context) {
            return SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Userpagetextfieled(
                          userName: widget.userNameController!,
                          title: 'Ad - Soyad',
                        ),
                        const SizedBox(height: 10),
                        Userpagetextfieled(
                          userName: widget.userTitleController!,
                          title: 'Alt Başlık',
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(width * 0.5, 50),
                              backgroundColor: Colors.deepOrange),
                          onPressed: () {
                            if (widget.userTitleController!.text!.isNotEmpty &&
                                widget.userNameController!.text!.isNotEmpty) {
                              if (!widget.isEdit) {
                                setState(() {
                                  widget.users.add({
                                    'name': widget.userNameController!.text,
                                    'subtitle':
                                        widget.userTitleController!.text,
                                  });
                                });
                              } else {
                                widget.users[widget.index] = {
                                  'name': widget.userNameController!.text,
                                  'subtitle': widget.userTitleController!.text,
                                };
                              }
                              Navigator.pop(context);
                              widget.onModalClose();
                            }
                          },
                          child: const Text(
                            'Kaydet',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
        widget.onModalClose();
      },
    );
  }
}
