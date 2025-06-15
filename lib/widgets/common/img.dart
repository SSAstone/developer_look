import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final double? height;
  final double? width;
  final String src;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;


  const Img({
    super.key,
    this.height,
    this.width,
    required this.src,
    this.fit,
    this.color,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return src.startsWith('asset')
        ? SizedBox(
          height: height,
          width: width,
          child: ClipRRect(
              borderRadius: borderRadius!,
              child: Image.asset(
                src,
                color: color,
                fit: fit,
                width: width,
                height: height,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Image failed to load'),
              ),
            ),
        )
        : SizedBox(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: borderRadius!,
            child: Image.network(
                src,
                color: color,
                fit: fit ?? BoxFit.cover,
                width: width ?? double.infinity,
                height: height ?? double.infinity,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        SizedBox(height: 8),
                        Text(
                          'Image failed to load',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ),
        );
  }
}
