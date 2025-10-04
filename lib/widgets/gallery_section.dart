import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../features/wedding/domain/entities/gallery_image.dart';

class GallerySection extends StatefulWidget {
  final List<GalleryImage> images;
  final EdgeInsets? padding;
  final String? title;

  const GallerySection({
    Key? key,
    required this.images,
    this.padding,
    this.title,
  }) : super(key: key);

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final crossAxisCount = isMobile ? 2 : (screenWidth < 900 ? 3 : 4);

    return Container(
      padding: widget.padding ?? EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          if (widget.title != null)
            Text(
              widget.title!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.pink.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: -0.3, end: 0),
          
          if (widget.title != null) const SizedBox(height: 24),
          
          // Gallery Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 8 : 16,
              mainAxisSpacing: isMobile ? 8 : 16,
              childAspectRatio: 1.0,
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return _GalleryThumbnail(
                image: widget.images[index],
                index: index,
                onTap: () => _openLightbox(context, index),
              );
            },
          ),
        ],
      ),
    );
  }

  void _openLightbox(BuildContext context, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _GalleryLightbox(
          images: widget.images,
          initialIndex: initialIndex,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}

class _GalleryThumbnail extends StatefulWidget {
  final GalleryImage image;
  final int index;
  final VoidCallback onTap;

  const _GalleryThumbnail({
    Key? key,
    required this.image,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_GalleryThumbnail> createState() => _GalleryThumbnailState();
}

class _GalleryThumbnailState extends State<_GalleryThumbnail> {
  bool _isLoading = true;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Hero(
        tag: 'gallery_image_${widget.image.id}',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade100.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Loading placeholder
                if (_isLoading)
                  Container(
                    color: Colors.pink.shade50,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.pink.shade300,
                        ),
                      ),
                    ),
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    duration: 1500.ms,
                    color: Colors.white.withOpacity(0.3),
                  ),

                // Error placeholder
                if (_hasError)
                  Container(
                    color: Colors.pink.shade50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image,
                          color: Colors.pink.shade200,
                          size: 48,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Không thể tải ảnh',
                          style: TextStyle(
                            color: Colors.pink.shade300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Actual image
                if (!_hasError)
                  Image.network(
                    widget.image.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        });
                        return child;
                      }
                      return const SizedBox.shrink();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          setState(() {
                            _hasError = true;
                            _isLoading = false;
                          });
                        }
                      });
                      return const SizedBox.shrink();
                    },
                  ),

                // Overlay gradient on hover (desktop)
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: widget.onTap,
                      splashColor: Colors.pink.withOpacity(0.3),
                      highlightColor: Colors.pink.withOpacity(0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .animate()
      .fadeIn(
        delay: (200 + widget.index * 50).ms,
        duration: 500.ms,
      )
      .scale(
        begin: const Offset(0.8, 0.8),
        end: const Offset(1.0, 1.0),
        delay: (200 + widget.index * 50).ms,
        duration: 500.ms,
      ),
    );
  }
}

class _GalleryLightbox extends StatefulWidget {
  final List<GalleryImage> images;
  final int initialIndex;

  const _GalleryLightbox({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<_GalleryLightbox> createState() => _GalleryLightboxState();
}

class _GalleryLightboxState extends State<_GalleryLightbox> {
  late PageController _pageController;
  late int _currentIndex;
  double _dragStartX = 0;
  double _dragDistance = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _previousImage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextImage() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          _dragStartX = details.globalPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            _dragDistance = details.globalPosition.dx - _dragStartX;
          });
        },
        onHorizontalDragEnd: (details) {
          if (_dragDistance.abs() > 50) {
            if (_dragDistance > 0) {
              _previousImage();
            } else {
              _nextImage();
            }
          }
          setState(() {
            _dragDistance = 0;
          });
        },
        child: Stack(
          children: [
            // Image PageView
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Hero(
                    tag: 'gallery_image_${widget.images[index].id}',
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.network(
                        widget.images[index].imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade900,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.broken_image,
                                  color: Colors.grey.shade600,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Không thể tải ảnh',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFFFC107), // Gold color
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

            // Close Button
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              right: 16,
              child: Material(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(24),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 300.ms)
              .scale(begin: const Offset(0.8, 0.8)),
            ),

            // Previous Button
            if (_currentIndex > 0)
              Positioned(
                left: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Material(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      onTap: _previousImage,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 300.ms)
              .slideX(begin: -0.2),

            // Next Button
            if (_currentIndex < widget.images.length - 1)
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Material(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      onTap: _nextImage,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 300.ms)
              .slideX(begin: 0.2),

            // Image Counter
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 32,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_currentIndex + 1} / ${widget.images.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 300.ms)
              .slideY(begin: 0.2),
            ),

            // Image Info (if available)
            if (widget.images[_currentIndex].title != null ||
                widget.images[_currentIndex].description != null)
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 80,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.images[_currentIndex].title != null)
                        Text(
                          widget.images[_currentIndex].title!,
                          style: const TextStyle(
                            color: Color(0xFFFFC107), // Gold color
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (widget.images[_currentIndex].title != null &&
                          widget.images[_currentIndex].description != null)
                        const SizedBox(height: 8),
                      if (widget.images[_currentIndex].description != null)
                        Text(
                          widget.images[_currentIndex].description!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 300.ms)
              .slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }
}
