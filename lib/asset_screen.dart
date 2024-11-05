// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3_flutter/vos/asset_vo.dart';

class AssetScreen extends StatefulWidget {
  AssetScreen({super.key, required this.state, required this.address});

  final String state;
  final String address;

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  AssetVo? selectedCrypto;

  AssetVo? selectedForex;

  AssetVo? selectedStock;

  final List<AssetVo> crypto = [
    AssetVo(url: "assets/images/ethereum.png", name: "ETH", amount: 1.2),
    AssetVo(url: "assets/images/btc.png", name: "BTC", amount: 0.5),
  ];

  final List<AssetVo> forex = [
    AssetVo(url: "assets/images/usd.png", name: "USD", amount: 1200),
    AssetVo(url: "assets/images/eur.png", name: "EUR", amount: 3000),
  ];

  final List<AssetVo> stocks = [
    AssetVo(url: "assets/images/stk.png", name: "NYSE", amount: 3500),
    AssetVo(url: "assets/images/stk.png", name: "LSE", amount: 7000),
  ];

  bool isCyptTap = false;
  bool isForexTap = false;
  bool isStockTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        toolbarHeight: 60,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.red])
                    .createShader(bounds),
                child: Text(
                  "${widget.state} to : ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.address.substring(0, 10)}....",
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: widget.address))
                          .then(
                        (value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Copied to clipboard"),
                          ));
                        },
                      );
                    },
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                      size: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/wallet.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.purple, Colors.blue, Colors.red])
                  .createShader(bounds),
              child: Text(
                "Select Assets",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCyptTap = !isCyptTap;
                      isForexTap = false;
                      isStockTap = false;
                    });
                  },
                  child: Container(
                    width: 73,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                      child: selectedCrypto == null
                          ? const Text(
                              "Crypto",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      selectedCrypto!.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  selectedCrypto!.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isForexTap = !isForexTap;
                      isCyptTap = false;
                      isStockTap = false;
                    });
                  },
                  child: Container(
                    width: 73,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                      child: selectedForex == null
                          ? const Text(
                              "Forex",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      selectedForex!.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  selectedForex!.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isStockTap = !isStockTap;
                      isForexTap = false;
                      isCyptTap = false;
                    });
                  },
                  child: Container(
                    width: 73,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                      child: selectedStock == null
                          ? const Text(
                              "Stock",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      selectedStock!.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  selectedStock!.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isCyptTap
                    ? SizedBox(
                        width: 73,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCyptTap = !isCyptTap;
                                  selectedCrypto = crypto[index];
                                  selectedForex = null;
                                  selectedStock = null;
                                });
                              },
                              child: item(crypto[index])),
                          itemCount: crypto.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                        ),
                      )
                    : const SizedBox(),
                isForexTap
                    ? SizedBox(
                        width: 73,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  isForexTap = !isForexTap;
                                  selectedForex = forex[index];
                                  selectedCrypto = null;
                                  selectedStock = null;
                                });
                              },
                              child: item(forex[index])),
                          itemCount: forex.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                        ),
                      )
                    : const SizedBox(),
                isStockTap
                    ? SizedBox(
                        width: 73,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  isStockTap = !isStockTap;
                                  selectedStock = stocks[index];
                                  selectedForex = null;
                                  selectedCrypto = null;
                                });
                              },
                              child: item(stocks[index])),
                          itemCount: stocks.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            selectedCrypto == null &&
                    selectedForex == null &&
                    selectedStock == null
                ? const SizedBox()
                : Center(
                    child: Container(
                      width: 150,
                      height: 55,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 31, 31, 31),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.blue,
                                Colors.red
                              ]).createShader(bounds),
                          child: Text(
                            selectedCrypto != null
                                ? selectedCrypto!.amount.toString()
                                : selectedForex != null
                                    ? selectedForex!.amount.toString()
                                    : selectedStock!.amount.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
            const Divider(
              color: Color.fromARGB(255, 56, 56, 56),
              thickness: 1,
              height: 25,
              indent: 25,
              endIndent: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.purple, Colors.blue, Colors.red])
                      .createShader(bounds),
                  child: Text(
                    "History",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            transTile("- 0.02 ETH", "+ 200 NYSE"),
            const SizedBox(
              height: 10,
            ),
            transTile("- 1000 USD", "+ 0.03 BTC")
          ],
        ),
      ),
    );
  }

  Widget item(AssetVo asset) {
    return Container(
      width: 73,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                asset.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            asset.name,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget transTile(String burn, String gain) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 31, 31, 31),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.upload_rounded,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swapped",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Confirmed",
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                burn,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Text(
                gain,
                style: const TextStyle(fontSize: 11),
              )
            ],
          )
        ],
      ),
    );
  }
}
