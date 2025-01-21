import 'package:custom_image_widget_sample/widgets/app_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('AppImage Sample'),
                floating: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppImage.cornerMd(
                      path:
                          'https://images.unsplash.com/photo-1623340067677-d14f6bd3108d?q=80&w=2557&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      type: ImageType.url,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    _gapH(),
                    AppImage.circular(
                      path:
                          'https://images.unsplash.com/photo-1657088746570-0218626e8f55?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      type: ImageType.url,
                      size: 100,
                    ),
                    _gapH(),
                    AppImage.cornerMd(
                      path: '',
                      type: ImageType.url,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    _gapH(),
                    AppImage.cornerMd(
                      path: 'assets/images/image01.jpg',
                      type: ImageType.asset,
                    ),
                    _gapH(),
                    AppImage.cornerLg(
                      path:
                          'https://images.unsplash.com/photo-1650930629267-293fd465fefb?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      type: ImageType.url,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gapH() {
    return const SizedBox(height: 16.0);
  }
}
