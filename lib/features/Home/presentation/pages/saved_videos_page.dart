import 'dart:io';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:courses_platform/features/Home/presentation/widgets/course-details-page/apinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SavedVideosPage extends StatefulWidget {
  const SavedVideosPage({super.key});

  @override
  State<SavedVideosPage> createState() => _SavedVideosPageState();
}

class _SavedVideosPageState extends State<SavedVideosPage> {
  List<FileSystemEntity> files = [];

  @override
  void initState() {
    super.initState();
    loadFiles();
  }

  Future<void> loadFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    final savedFiles = directory.listSync(); // Get files in directory
    setState(() {
      files = savedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloaded Files"),
      ),
      body: files.isEmpty
          ? Center(child: Text("No files downloaded yet"))
          : ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                return ListTile(
                  leading: Icon(Icons.file_present),
                  title: Text(file.path.split('/').last), // Show file name
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await file.delete();
                      loadFiles(); // Refresh the file list
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ApinioVideoPlayer(
                            url: file.path,
                            dataSourceType: DataSourceType.file,
                            fileName: file.path.split('/').last)));
                  },
                );
              },
            ),
    );
  }
}
