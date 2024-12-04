import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class PDFPage extends StatefulWidget {
  final String url;
  final String name;

  const PDFPage({super.key, required this.url, required this.name});

  @override
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  String? localPath;
  double downloadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${widget.name}.pdf');

    if (await file.exists()) {
      setState(() {
        localPath = file.path;
      });
    } else {
      await _downloadPDF(file);
    }
  }

  Future<void> _downloadPDF(File file) async {
    final response =
        await http.Client().send(http.Request('GET', Uri.parse(widget.url)));
    final contentLength = response.contentLength;
    List<int> bytes = [];
    response.stream.listen(
      (List<int> newBytes) {
        bytes.addAll(newBytes);
        setState(() {
          downloadProgress = bytes.length / contentLength!;
        });
      },
      onDone: () async {
        await file.writeAsBytes(bytes, flush: true);
        setState(() {
          localPath = file.path;
        });
      },
      onError: (e) {
        // Handle error
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath!,
              pageFling: false,
              fitEachPage: false,
              fitPolicy: FitPolicy.WIDTH,
              autoSpacing: false,
              backgroundColor: AppColors.altTextColor,
              pageSnap: false,
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(value: downloadProgress),
                  const SizedBox(height: 20),
                  Text('${(downloadProgress * 100).toStringAsFixed(0)}%'),
                ],
              ),
            ),
    );
  }
}
