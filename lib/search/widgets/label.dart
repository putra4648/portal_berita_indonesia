import 'package:flutter/material.dart';

class BuildLabel extends StatelessWidget {
  const BuildLabel({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Temukan',
            style: textTheme.headline3
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'Berita favoritmu di sini',
            style: textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
