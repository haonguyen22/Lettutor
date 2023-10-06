import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CourseTopicDetailArgument {
  final String pdfUrl;
  final String title;

  const CourseTopicDetailArgument({
    required this.pdfUrl,
    required this.title,
  });
}

class CourseTopicDetailScreen extends StatefulWidget {
  final CourseTopicDetailArgument data;

  const CourseTopicDetailScreen({
    super.key,
    required this.data,
  });

  @override
  State<CourseTopicDetailScreen> createState() =>
      _CourseTopicDetailScreenState();
}

class _CourseTopicDetailScreenState extends State<CourseTopicDetailScreen> {
  late PdfViewerController _controller;
  @override
  void initState() {
    _controller = PdfViewerController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.data.title;
    final pdfUrl = widget.data.pdfUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: context.textColor),
        ),
        backgroundColor: context.primaryColor.withOpacity(0.4),
        actions: [
          ListenableBuilder(
            listenable: _controller,
            builder: (context, child) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.previousPage();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Text('${_controller.pageNumber}/${_controller.pageCount}'),
                TextButton(
                  onPressed: () => _controller.nextPage(),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.network(
              pdfUrl,
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
