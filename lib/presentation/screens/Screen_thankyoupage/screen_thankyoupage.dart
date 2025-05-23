import 'package:e_naam/core/colors.dart';
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ThankYouPage extends StatefulWidget {
  final String? productName;

  final String? amount;

  const ThankYouPage({
    super.key,
    this.productName,
    this.amount,
  });

  @override
  ThankYouPageState createState() => ThankYouPageState();
}

class ThankYouPageState extends State<ThankYouPage>
    with TickerProviderStateMixin {
  late AnimationController _checkmarkController;
  late AnimationController _contentController;
  late AnimationController _confettiController;
  late Animation<double> _checkmarkAnimation;
  late Animation<double> _contentAnimation;
  late Animation<double> _confettiAnimation;

  @override
  void initState() {
    super.initState();

    _checkmarkController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _contentController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _checkmarkAnimation = CurvedAnimation(
      parent: _checkmarkController,
      curve: Curves.elasticOut,
    );

    _contentAnimation = CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeOutBack,
    );

    _confettiAnimation = CurvedAnimation(
      parent: _confettiController,
      curve: Curves.easeOut,
    );

    // Start animations with delays
    Future.delayed(const Duration(milliseconds: 300), () {
      _checkmarkController.forward();
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      _contentController.forward();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      _confettiController.forward();
    });
  }

  @override
  void dispose() {
    _checkmarkController.dispose();
    _contentController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Appcolors.kprimarycolor,
              Color.fromARGB(255, 44, 44, 80),
              Color.fromARGB(255, 201, 201, 204)
            ],
          ),
        ),
        child: Stack(
          children: [
            // Confetti Animation
            AnimatedBuilder(
              animation: _confettiAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: ConfettiPainter(_confettiAnimation.value),
                  size: Size.infinite,
                );
              },
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Checkmark Animation
                  AnimatedBuilder(
                    animation: _checkmarkAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _checkmarkAnimation.value,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 60,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  // Thank You Content
                  AnimatedBuilder(
                    animation: _contentAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 50 * (1 - _contentAnimation.value)),
                        child: Opacity(
                          opacity: _contentAnimation.value.clamp(0.0, 1.0),
                          child: Column(
                            children: [
                              const Text(
                                'Thank You!',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              ResponsiveSizedBox.height10,

                              const Text(
                                'Your Redeem was successful',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                              ResponsiveSizedBox.height20,
                              TextStyles.medium(
                                  text:
                                      'your 2999 points holded upto devliver the product',
                                  color: Appcolors.ksecondrycolor),
                              ResponsiveSizedBox.height30,

                              // Purchase Details Card
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    if (widget.productName != null) ...[
                                      _buildDetailRow(
                                        'Product',
                                        widget.productName!,
                                        Icons.shopping_bag,
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                    if (widget.amount != null) ...[
                                      _buildDetailRow(
                                        'Points',
                                        widget.amount!,
                                        Icons.pin_outlined,
                                      ),
                                    ],
                                  ],
                                ),
                              ),

                              ResponsiveSizedBox.height30,
                              ElevatedButton(
                                  onPressed: () {
                                    navigateToMainPage(context, 0);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 12),
                                  ),
                                  child: TextStyles.medium(
                                      text: 'Back', weight: FontWeight.bold))
                            ],
                          ),
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
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF667eea).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 85, 78, 118),
            size: 20,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Custom Painter for Confetti Animation
class ConfettiPainter extends CustomPainter {
  final double animationValue;
  final List<ConfettiParticle> particles = [];

  ConfettiPainter(this.animationValue) {
    // Generate confetti particles
    for (int i = 0; i < 50; i++) {
      particles.add(ConfettiParticle());
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (final particle in particles) {
      final progress = (animationValue + particle.delay) % 1.0;
      if (progress < 0) continue;

      final x = particle.startX * size.width +
          particle.horizontalSpeed * progress * size.width;
      final y = particle.startY * size.height +
          particle.fallSpeed * progress * size.height;

      if (y > size.height) continue;

      paint.color = particle.color.withOpacity((1 - progress).clamp(0.0, 1.0));

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(particle.rotation * progress * math.pi * 4);

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset.zero, width: particle.size, height: particle.size),
          Radius.circular(particle.size / 4),
        ),
        paint,
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ConfettiParticle {
  final double startX;
  final double startY;
  final double fallSpeed;
  final double horizontalSpeed;
  final double rotation;
  final double size;
  final Color color;
  final double delay;

  ConfettiParticle()
      : startX = math.Random().nextDouble(),
        startY = -0.1,
        fallSpeed = 0.5 + math.Random().nextDouble() * 0.5,
        horizontalSpeed = (math.Random().nextDouble() - 0.5) * 0.3,
        rotation = math.Random().nextDouble(),
        size = 4 + math.Random().nextDouble() * 8,
        color = [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.purple,
          Colors.orange,
          Colors.pink,
        ][math.Random().nextInt(7)],
        delay = -math.Random().nextDouble() * 0.5;
}
