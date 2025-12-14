import 'dart:io';

import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  const PhotoItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //widget que permite mostrar una imagen desde un archivo
      leading: Image.file(
        //Ruta donde se guarda la foto que hayamos tomado con la cámara
        File(photo.path),
        width: 55,
        //para recortar la imagen en cuadro pequeño
        fit: BoxFit.cover,
      ),
      title: Text(photo.name),
      subtitle: Text(photo.description),
    );
  }
}
