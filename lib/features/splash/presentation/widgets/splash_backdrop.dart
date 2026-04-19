import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class SplashBackdrop extends StatelessWidget {
  const SplashBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full Page Subtle Watermark
        Positioned.fill(
          child: Opacity(
            opacity: 0.035,
            child: CachedNetworkImage(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAXsNS1VsMFlOr0OXHc806GlNAwORa5Sp-d2f1_AH_9g_MsLhudj24-DzzMwjjh3Xh3GqxijssVv22hN6m9Q06_jkXE8Juu1nOU_6AwhYIVjsaqdUVir5nXjZu4lmW_iW8mUt79SQ3Lr1fEtZvvKkhV-N-w8BWb_PGlHIu7UxBA5QYMXkUxCZ_WDWzl3NVecAg0YvCceWYKdywAPAguRKwvrbjPYIQmRurNcS21Ptmjud-3UDB4btGbdxvvJPTRU17WsRzoyjBUXj1f',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Decorative Ambient Light
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.height * 1.5,
            decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColors.primary.withValues(alpha: 0.05), Colors.transparent], stops: const [0.0, 1.0])),
          ),
        ),

        // Asymmetric Accent Elements (Minimalist Corners)
        Positioned(
          top: 0,
          right: 0,
          child: Opacity(
            opacity: 0.1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(128)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAhDBopIlg8fqDMEaKswFdsukh-HtGRCw88PPgzJBSSECdsfTLpUVae7fStdwYxL6no6afHhxdL8XFixnIJjvb5GGnHO0O38qLH6ErCnZuFydlOIhNhRiE-tTstpG3CokDNbvc10261N2xQBTYDpfoKt-XQJoSU_PW8T02baTGD7Iu-TTWZOcK_W_XaFFtNMZAce0qt9CBpFWKNZa5oQZHA1TNAtNlkdg7lsHLrM6r-_MZ7ZC9DqGSroTZZE84Scev-o_-XWU-zir2A',
                width: 128,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Opacity(
            opacity: 0.1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(96)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAFIRper3awG5NucwxHDhWKnXvKcbmB9f5BLcat5_8KazD-obZm_3gvlbVg9iKMCWK0LzDBBJrm1LU1jnoAyB9wQaYt2D7XTHW-bpK7G1LAGm7TpgYTSsG88PxR0u3J3uYgx62OY_rxxtS2sUxam1CvgUJTo5Pl0JAh2k6yRDWixuwm7S4I19jhc7s2gqzi-Q1Zaf_F0hC6CkKqsclrksUpUX-Eo538mJfHeVviMHhRWawqykiOzKMtjDQNTSTcESQOhGzi_J8euduI',
                width: 96,
                height: 96,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
