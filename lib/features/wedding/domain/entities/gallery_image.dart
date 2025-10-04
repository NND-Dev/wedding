import 'package:equatable/equatable.dart';

class GalleryImage extends Equatable {
  final String id;
  final String imageUrl;
  final String category;
  final String? title;
  final String? description;

  const GalleryImage({
    required this.id,
    required this.imageUrl,
    required this.category,
    this.title,
    this.description,
  });

  @override
  List<Object?> get props => [id, imageUrl, category, title, description];
}
