// // import 'package:e_naam/core/appconstants.dart';
// // import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
// // import 'package:e_naam/widgets/custom_navigator.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:math' as math;

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({Key? key}) : super(key: key);

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen>
// //     with TickerProviderStateMixin {
// //   late AnimationController _logoController;
// //   late AnimationController _backgroundController;
// //   late AnimationController _textController;
// //   late AnimationController _circleController;

// //   late Animation<double> _logoScale;
// //   late Animation<double> _logoRotation;
// //   late Animation<double> _backgroundOpacity;
// //   late Animation<double> _textOpacity;
// //   late Animation<double> _circleAnimation;

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Initialize animation controllers
// //     _logoController = AnimationController(
// //       duration: const Duration(milliseconds: 2000),
// //       vsync: this,
// //     );

// //     _backgroundController = AnimationController(
// //       duration: const Duration(milliseconds: 1500),
// //       vsync: this,
// //     );

// //     _textController = AnimationController(
// //       duration: const Duration(milliseconds: 1000),
// //       vsync: this,
// //     );

// //     _circleController = AnimationController(
// //       duration: const Duration(milliseconds: 3000),
// //       vsync: this,
// //     );

// //     // Initialize animations
// //     _logoScale = Tween<double>(
// //       begin: 0.0,
// //       end: 1.0,
// //     ).animate(CurvedAnimation(
// //       parent: _logoController,
// //       curve: Curves.elasticOut,
// //     ));

// //     _logoRotation = Tween<double>(
// //       begin: 0.0,
// //       end: 2 * math.pi,
// //     ).animate(CurvedAnimation(
// //       parent: _logoController,
// //       curve: Curves.easeInOut,
// //     ));

// //     _backgroundOpacity = Tween<double>(
// //       begin: 0.0,
// //       end: 1.0,
// //     ).animate(CurvedAnimation(
// //       parent: _backgroundController,
// //       curve: Curves.easeIn,
// //     ));

// //     _textOpacity = Tween<double>(
// //       begin: 0.0,
// //       end: 1.0,
// //     ).animate(CurvedAnimation(
// //       parent: _textController,
// //       curve: Curves.easeIn,
// //     ));

// //     _circleAnimation = Tween<double>(
// //       begin: 0.0,
// //       end: 1.0,
// //     ).animate(CurvedAnimation(
// //       parent: _circleController,
// //       curve: Curves.easeInOut,
// //     ));

// //     // Start animations sequence
// //     _startAnimations();
// //   }

// //   void _startAnimations() async {
// //     await Future.delayed(const Duration(milliseconds: 300));
// //     _backgroundController.forward();

// //     await Future.delayed(const Duration(milliseconds: 500));
// //     _circleController.repeat();

// //     await Future.delayed(const Duration(milliseconds: 800));
// //     _logoController.forward();

// //     await Future.delayed(const Duration(milliseconds: 1500));
// //     _textController.forward();

// //     // Navigate to main screen after splash
// //     await Future.delayed(const Duration(milliseconds: 3000));
// //     if (mounted) {
// //       CustomNavigation.pushReplaceWithTransition(context, ScreenMainPage());
// //       // Replace this with your navigation logic
// //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _logoController.dispose();
// //     _backgroundController.dispose();
// //     _textController.dispose();
// //     _circleController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: AnimatedBuilder(
// //         animation: Listenable.merge([
// //           _logoController,
// //           _backgroundController,
// //           _textController,
// //           _circleController,
// //         ]),
// //         builder: (context, child) {
// //           return Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 begin: Alignment.topLeft,
// //                 end: Alignment.bottomRight,
// //                 colors: [
// //                   Colors.blue.shade900.withOpacity(_backgroundOpacity.value),
// //                   Colors.purple.shade900.withOpacity(_backgroundOpacity.value),
// //                   Colors.indigo.shade900.withOpacity(_backgroundOpacity.value),
// //                 ],
// //               ),
// //             ),
// //             child: Stack(
// //               children: [
// //                 // Animated background circles
// //                 CustomPaint(
// //                   painter: CirclesPainter(_circleAnimation.value),
// //                   size: Size.infinite,
// //                 ),

// //                 // Main content
// //                 Center(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       // Logo with animation
// //                       Transform.scale(
// //                         scale: _logoScale.value,
// //                         child: Transform.rotate(
// //                           angle: _logoRotation.value * 0.1,
// //                           child: Container(
// //                             width: 120,
// //                             height: 120,
// //                             decoration: BoxDecoration(
// //                               color: Colors.white,
// //                               borderRadius: BorderRadius.circular(30),
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black.withOpacity(0.3),
// //                                   blurRadius: 20,
// //                                   offset: const Offset(0, 10),
// //                                 ),
// //                               ],
// //                             ),
// //                             child: ClipRRect(
// //                               borderRadius: BorderRadius.circular(30),
// //                               child: Image.asset(
// //                                 Appconstants.logo, // Replace with your logo path
// //                                 fit: BoxFit.cover,
// //                                 errorBuilder: (context, error, stackTrace) {
// //                                   // Fallback widget if image not found
// //                                   return const Icon(
// //                                     Icons.flutter_dash,
// //                                     size: 60,
// //                                     color: Colors.blue,
// //                                   );
// //                                 },
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),

// //                       const SizedBox(height: 40),

// //                       // App name
// //                       Opacity(
// //                         opacity: _textOpacity.value,
// //                         child: const Text(
// //                           'Your App Name',
// //                           style: TextStyle(
// //                             fontSize: 32,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.white,
// //                             letterSpacing: 2,
// //                           ),
// //                         ),
// //                       ),

// //                       const SizedBox(height: 16),

// //                       // Tagline
// //                       Opacity(
// //                         opacity: _textOpacity.value,
// //                         child: const Text(
// //                           'Welcome to the Future',
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             color: Colors.white70,
// //                             letterSpacing: 1,
// //                           ),
// //                         ),
// //                       ),

// //                       const SizedBox(height: 60),

// //                       // Loading indicator
// //                       Opacity(
// //                         opacity: _textOpacity.value,
// //                         child: SizedBox(
// //                           width: 200,
// //                           child: LinearProgressIndicator(
// //                             backgroundColor: Colors.white.withOpacity(0.3),
// //                             valueColor: AlwaysStoppedAnimation<Color>(
// //                               Colors.white,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 // Bottom branding
// //                 Positioned(
// //                   bottom: 50,
// //                   left: 0,
// //                   right: 0,
// //                   child: Opacity(
// //                     opacity: _textOpacity.value,
// //                     child: const Text(
// //                       'Powered by Flutter',
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         color: Colors.white60,
// //                         fontSize: 14,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class CirclesPainter extends CustomPainter {
// //   final double animationValue;

// //   CirclesPainter(this.animationValue);

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final paint = Paint()
// //       ..style = PaintingStyle.fill
// //       ..color = Colors.white.withOpacity(0.1);

// //     final center = Offset(size.width / 2, size.height / 2);

// //     // Draw animated circles
// //     for (int i = 0; i < 3; i++) {
// //       final radius = (100 + i * 50) * animationValue;
// //       final opacity = (1.0 - animationValue) * 0.3;

// //       paint.color = Colors.white.withOpacity(opacity);
// //       canvas.drawCircle(center, radius, paint);
// //     }

// //     // Draw floating particles
// //     final particlePaint = Paint()..style = PaintingStyle.fill;

// //     for (int i = 0; i < 20; i++) {
// //       final angle = (i * 18.0 + animationValue * 360) * math.pi / 180;
// //       final distance = 200 + math.sin(animationValue * 2 * math.pi + i) * 50;

// //       final x = center.dx + math.cos(angle) * distance;
// //       final y = center.dy + math.sin(angle) * distance;

// //       final particleOpacity =
// //           (math.sin(animationValue * 4 * math.pi + i) + 1) / 4;
// //       particlePaint.color = Colors.white.withOpacity(particleOpacity);

// //       canvas.drawCircle(Offset(x, y), 3, particlePaint);
// //     }
// //   }

// //   @override
// //   bool shouldRepaint(CustomPainter oldDelegate) => true;
// // }
// ///////////////////////////
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late AnimationController _progressController;

//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _progressAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controllers
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );

//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );

//     _progressController = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     );

//     // Initialize animations
//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeIn,
//     ));

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _slideController,
//       curve: Curves.easeOutBack,
//     ));

//     _progressAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _progressController,
//       curve: Curves.easeInOut,
//     ));

//     // Start animations sequence
//     _startAnimations();
//   }

//   void _startAnimations() async {
//     await Future.delayed(const Duration(milliseconds: 300));
//     _fadeController.forward();

//     await Future.delayed(const Duration(milliseconds: 500));
//     _slideController.forward();

//     await Future.delayed(const Duration(milliseconds: 800));
//     _progressController.forward();

//     // Navigate to main screen after splash
//     await Future.delayed(const Duration(milliseconds: 3500));
//     if (mounted) {
//       // Replace this with your navigation logic
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//     }
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     _progressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.blue.shade800,
//               Colors.blue.shade900,
//               Colors.indigo.shade900,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: AnimatedBuilder(
//             animation: Listenable.merge([
//               _fadeController,
//               _slideController,
//               _progressController,
//             ]),
//             builder: (context, child) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Spacer(flex: 2),

//                   // Logo with fade and slide animation
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: SlideTransition(
//                       position: _slideAnimation,
//                       child: Container(
//                         width: 200,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.2),
//                               blurRadius: 15,
//                               offset: const Offset(0, 8),
//                             ),
//                           ],
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.asset(
//                             'assets/logo.png', // Replace with your logo path
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) {
//                               // Fallback widget if image not found
//                               return const Center(
//                                 child: Text(
//                                   'Your Logo',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 40),

//                   // App name with fade animation
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: const Text(
//                       'Your App Name',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 12),

//                   // Tagline with fade animation
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: const Text(
//                       'Simple. Fast. Reliable.',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white70,
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   ),

//                   const Spacer(flex: 2),

//                   // Loading progress with animation
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: [
//                         FadeTransition(
//                           opacity: _fadeAnimation,
//                           child: const Text(
//                             'Loading...',
//                             style: TextStyle(
//                               color: Colors.white60,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Container(
//                           height: 4,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(2),
//                           ),
//                           child: FractionallySizedBox(
//                             alignment: Alignment.centerLeft,
//                             widthFactor: _progressAnimation.value,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(2),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 60),

//                   // Bottom text
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: const Text(
//                       'Version 1.0.0',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
////////////////////////////////////
import 'package:e_naam/core/appconstants.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/core/responsive_utils.dart';
import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
import 'package:e_naam/presentation/screens/screen_loginpage/screen_loginpage.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:e_naam/widgets/custom_sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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
