import 'package:flutter/material.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key, required this.state, required this.address});

  final String state;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.red])
                    .createShader(bounds),
                child: Text(
                  "$state to Account Address : $address",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
