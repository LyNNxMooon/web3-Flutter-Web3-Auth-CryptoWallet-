import 'package:flutter/material.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          analyticWidget(context, "Ethereum", "assets/images/ethereum.png"),
          const SizedBox(
            height: 15,
          ),
          analyticWidget(context, "Ethereum", "assets/images/ethereum.png"),
          const SizedBox(
            height: 15,
          ),
          analyticWidget(context, "Ethereum", "assets/images/ethereum.png")
        ],
      ),
    );
  }

  Widget analyticWidget(BuildContext context, String coinName, String logo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  logo,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                coinName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.black),
          width: double.infinity,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/chart.jpg",
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
