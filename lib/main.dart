// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_flutter/asset_screen.dart';
import 'package:web3_flutter/meta_mask.dart';
import 'package:web3_flutter/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDrop = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MetaMaskProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late final String text;

                    if (provider.isConnected && provider.isInOperatingChain) {
                      text = "Connected";
                    } else if (provider.isConnected &&
                        !provider.isInOperatingChain) {
                      text =
                          "Wrong chain. PLease connect to ${MetaMaskProvider.operatingChain}";
                    } else if (provider.isEnabled) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                  colors: [
                                    Colors.purple,
                                    Colors.blue,
                                    Colors.red
                                  ]).createShader(bounds),
                              child: const Text(
                                "Nexux",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) =>
                                  const LinearGradient(colors: [
                                Colors.white,
                                Colors.grey,
                                Color.fromARGB(255, 96, 96, 96),
                                Colors.white,
                              ]).createShader(bounds),
                              child: Text(
                                "Login In by: ",
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 18),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              width: 240,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Connecting your wallet",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDrop = !isDrop;
                                        });
                                      },
                                      child: isDrop
                                          ? const Icon(Icons.arrow_drop_up)
                                          : const Icon(Icons.arrow_drop_down))
                                ],
                              ),
                            ),
                            isDrop
                                ? SizedBox(
                                    width: 240,
                                    child: ListView(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        CupertinoButton(
                                            onPressed: () => context
                                                .read<MetaMaskProvider>()
                                                .connect(),
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 200,
                                                  height: 20,
                                                  child: Image.network(
                                                      fit: BoxFit.cover,
                                                      "https://pbs.twimg.com/media/Eu1Sfs7XYAAzaJ4.jpg"),
                                                )
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        CupertinoButton(
                                            onPressed: () => context
                                                .read<MetaMaskProvider>()
                                                .connect(),
                                            color: Colors.white,
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                    width: 200,
                                                    height: 20,
                                                    child: Center(
                                                      child: Text(
                                                        "Trust Wallet",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ))
                                              ],
                                            )),
                                      ],
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      );
                    } else {
                      text = "PLease use Web3 supported browser.";
                    }

                    return NavigatorPage(
                      state: text,
                      address: provider.currentAddress,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
