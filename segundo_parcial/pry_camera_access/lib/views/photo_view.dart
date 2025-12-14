import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/photo_controller.dart';
import '../providers/photo_provider.dart';
import '../widgets/photo_item.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    //provider
    final provider = Provider.of<PhotoProvider>(context);
    final controller = PhotoController(provider: provider);


    return Scaffold(
      appBar: AppBar(title: Text('Photo Gallery'),),
      body: ListView.builder(
        itemCount: provider.photos.length,
        itemBuilder: (_, index) {
          return PhotoItem(photo: provider.photos[index]);
        },
      ),

      //camera
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.takePhoto(context),
        child: Icon(Icons.camera_alt_sharp),
      ),
    );
  }
}