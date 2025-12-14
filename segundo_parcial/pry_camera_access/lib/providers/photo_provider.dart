import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoProvider extends ChangeNotifier{
  final List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  void addPhoto(Photo photo){
    _photos.add(photo);
    notifyListeners();
  }


}