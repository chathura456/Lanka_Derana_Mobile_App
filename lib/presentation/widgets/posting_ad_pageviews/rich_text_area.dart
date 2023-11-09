import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class RichTextArea extends StatefulWidget {
  const RichTextArea({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RichTextAreaState();
  }
}

class _RichTextAreaState extends State<RichTextArea> {
  final QuillController _quilController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        QuillToolbar.basic(controller: _quilController),
        Container(
          padding: const EdgeInsets.all(8),
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1)
          ),
          child: QuillEditor.basic(
            controller: _quilController,
            readOnly: false,
          ),
        ),
      ],
    );
  }
}
