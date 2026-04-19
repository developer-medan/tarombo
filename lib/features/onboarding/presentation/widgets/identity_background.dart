import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdentityBackground extends StatelessWidget {
  const IdentityBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.1,
        child: SvgPicture.string(
          '''<svg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'><path d='M30 0c16.568 0 30 13.432 30 30S46.568 60 30 60 0 46.568 0 30 13.432 0 30 0zm0 4c-14.36 0-26 11.64-26 26s11.64 26 26 26 26-11.64 26-26S44.36 4 30 4zm0 6c11.046 0 20 8.954 20 20s-8.954 20-20 20-20-8.954-20-20 8.954-20 20-20zm0 4c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16z' fill='#570000' fill-opacity='0.03' fill-rule='evenodd'/></svg>''',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
