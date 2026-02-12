import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/dialogs/are_you_sure_to_delete_dialog.dart';
import 'package:hamqrg/common/widgets/image/image_card.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({required this.imageUrls, this.onDeleteImage, super.key});

  final List<String> imageUrls;
  final void Function(String imageUrl)? onDeleteImage;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        items: imageUrls.map((url) {
          return Stack(
            children: [
              ImageCard(imageUrl: url),
              if (onDeleteImage != null) // Conditionally render the delete button
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        final shouldDelete = await showAreYouSureToDeleteDialog(context);
                        if (shouldDelete) {
                          onDeleteImage!(url);
                        }
                      },
                    ),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
