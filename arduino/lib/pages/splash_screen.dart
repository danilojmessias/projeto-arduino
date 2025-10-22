import 'package:flutter/material.dart';
import 'package:arduino/pages/home_screen.dart';
import 'package:arduino/services/device_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Start both the minimum wait time and API call simultaneously
    final minimumWaitFuture = Future.delayed(const Duration(seconds: 5));
    final apiCallFuture = _preloadDevices();

    // Wait for both to complete
    await Future.wait([minimumWaitFuture, apiCallFuture]);

    // Navigate to home screen
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> _preloadDevices() async {
    try {
      // Pre-load devices to cache them
      await DeviceService.getDevices();
    } catch (e) {
      // If API fails, we still continue to home screen
      // The home screen will handle the error state
      debugPrint('Failed to preload devices: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/logo.jpeg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.white,
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            // App name
            Text(
              'Voltrix Tech',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 8),
            // Subtitle
            Text(
              'Arduino Device Manager',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            // Loading indicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
              strokeWidth: 3,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
