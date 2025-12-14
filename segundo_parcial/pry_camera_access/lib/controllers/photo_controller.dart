import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/photo.dart';
import '../providers/photo_provider.dart';

class PhotoController {
  //guarda las fotos
  final PhotoProvider provider;
  final ImagePicker picker = ImagePicker();

  //constructor
  PhotoController({required this.provider});

  //metodo para tomar la foto
  Future<void> takePhoto(BuildContext context) async {
    //Usar el image picker para tomar la foto
    //abrir la camara, tomar el recurso y guardarlo en una variable
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    //si la foto no es null se guarda
    if (photo != null) {
      provider.addPhoto(
        Photo(
          path: photo.path,
          name: "Foto ${provider.photos.length + 1}",
          description: "Foto tomada ...",
        ),
      );

      //notificacion-snackbar solo si se guardó la foto
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text("Photo saved successfully!"),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }
}
