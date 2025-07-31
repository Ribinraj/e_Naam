import 'package:e_naam/core/appconstants.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
import 'package:e_naam/presentation/screens/screen_loginpage/screen_loginpage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _progressController;
  late AnimationController _shimmerController;
  late AnimationController _pulseController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _shimmerAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));

    _shimmerAnimation = Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Start animations sequence
    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _fadeController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _slideController.forward();
    _shimmerController.repeat(reverse: true);

    await Future.delayed(const Duration(milliseconds: 800));
    _progressController.forward();
    _pulseController.repeat(reverse: true);

    checkUserlogin(context);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _progressController.dispose();
    _shimmerController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 4, 14, 62),
              const Color.fromARGB(156, 27, 45, 83),
              const Color.fromARGB(255, 19, 21, 63),
              const Color.fromARGB(249, 1, 2, 37),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Animated background elements
            CustomPaint(
              painter: BackgroundPainter(_shimmerAnimation.value),
              size: Size.infinite,
            ),

            SafeArea(
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  _fadeController,
                  _slideController,
                  _progressController,
                  _pulseController,
                ]),
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),

                      // Logo with advanced animations
                      SlideTransition(
                        position: _slideAnimation,
                        child: Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Stack(
                            children: [
                              // Shimmer effect
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AnimatedBuilder(
                                  animation: _shimmerController,
                                  builder: (context, child) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.transparent,
                                            Colors.white.withOpacity(0.3),
                                            Colors.transparent,
                                          ],
                                          stops: [
                                            (_shimmerAnimation.value - 1)
                                                .clamp(0.0, 1.0),
                                            _shimmerAnimation.value
                                                .clamp(0.0, 1.0),
                                            (_shimmerAnimation.value + 1)
                                                .clamp(0.0, 1.0),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Logo content
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/logo white.png',
                                      height: ResponsiveUtils.hp(10),
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                          child: Text(
                                            'YOUR LOGO',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF667eea),
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ResponsiveSizedBox.height50,

                      // Tagline with typewriter effect
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: const Text(
                            "One platform. Infinite rewards",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              letterSpacing: 0.8,
                              height: 1.4,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(flex: 2),

                      // Enhanced loading section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Text(
                                    'Loading amazing experience...',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Enhanced progress bar
                            Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Stack(
                                children: [
                                  // Progress fill
                                  FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor: _progressAnimation.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white70
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(3),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Shimmer effect on progress bar
                                  AnimatedBuilder(
                                    animation: _shimmerController,
                                    builder: (context, child) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.transparent,
                                              Colors.white.withOpacity(0.4),
                                              Colors.transparent,
                                            ],
                                            stops: [
                                              (_shimmerAnimation.value - 0.3)
                                                  .clamp(0.0, 1.0),
                                              _shimmerAnimation.value
                                                  .clamp(0.0, 1.0),
                                              (_shimmerAnimation.value + 0.3)
                                                  .clamp(0.0, 1.0),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 80),

                      // Bottom section with version
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: const Text(
                                'Version 4.0.0',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkUserlogin(context) async {
    final String usertoken = await getUserToken();
    if (usertoken.isEmpty) {
      await Future.delayed(const Duration(seconds: 3));
      CustomNavigation.pushReplaceWithTransition(context, ScreenLoginpage());
    } else {
      CustomNavigation.pushReplaceWithTransition(context, ScreenMainPage());
    }
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw floating geometric shapes
    for (int i = 0; i < 15; i++) {
      final angle = (i * 24.0 + animationValue * 30) * math.pi / 180;
      final distance = 100 + i * 30;

      final x = size.width * 0.2 + math.cos(angle) * distance;
      final y = size.height * 0.3 + math.sin(angle) * distance;

      final opacity = (math.sin(animationValue + i) + 1) / 8;
      paint.color = Colors.white.withOpacity(opacity);

      // Draw different shapes
      if (i % 3 == 0) {
        canvas.drawCircle(Offset(x, y), 4, paint);
      } else if (i % 3 == 1) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset(x, y), width: 8, height: 8),
            const Radius.circular(2),
          ),
          paint,
        );
      } else {
        final path = Path();
        path.moveTo(x, y - 4);
        path.lineTo(x + 4, y + 4);
        path.lineTo(x - 4, y + 4);
        path.close();
        canvas.drawPath(path, paint);
      }
    }

    // Draw subtle gradient overlay
    final gradientPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.3, -0.5),
        radius: 1.5,
        colors: [
          Colors.white.withOpacity(0.1),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
