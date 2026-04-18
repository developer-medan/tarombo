import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class SplashLogoWidget extends StatefulWidget {
  const SplashLogoWidget({super.key});

  @override
  State<SplashLogoWidget> createState() => _SplashLogoWidgetState();
}

class _SplashLogoWidgetState extends State<SplashLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: 0.05,
      end: 0.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Equivalent to w-48 h-48 md:w-64 md:h-64
    final isDesktop = MediaQuery.of(context).size.width > 600;
    final size = isDesktop ? 256.0 : 192.0;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.25,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(
                          alpha: _glowAnimation.value,
                        ),
                        blurRadius: 60,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Traditional Batak House Icon
          CachedNetworkImage(
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAJ54uUiRldl86BjoNTLi1oBsR7uijaOQolzlplHBvXEeDmgihKeWmyBo7lDmvq7PR5q9W-DJRWquCl8YtmlR9a4YhE2AHCsL3V2_roY2DxSEB1Vw-E7gaSJBZI4vLZepIw-3pjG0nL9mpj50ii-o_HSRSkVvg2bNaASrQa00fO2MtUmykgtFZljonTYRj5tOcrBeh2H6pCDZbzrDWg0qTEZOV0-TOHfu7GdwtQ5Q7j68nNvtfFDK4GL_4zHLlqxl1MrUrcTj0swtl1',
            fit: BoxFit.contain,
            placeholder: (context, url) => const SizedBox(),
            errorWidget:
                (context, url, error) =>
                    Icon(Icons.error, color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
