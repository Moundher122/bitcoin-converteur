// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final mycon = TextEditingController();
  String? new3;

  @override
  Widget build(BuildContext context) {
    String _text = context.watch<money>().price.toString();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Bitcoin Price',
            style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'images/image.png',
              height: 40,
              width: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: mycon,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.expand_circle_down_outlined),
                        onSelected: (value) {
                          setState(() {
                            new3 = value;
                          });
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            value: 'USD',
                            child: Text('USD'),
                          ),
                          PopupMenuItem(
                            value: 'EUR',
                            child: Text('EUR'),
                          ),
                          PopupMenuItem(
                            value: 'GBP',
                            child: Text('GBP'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mycon.text.isEmpty ? 'Enter a value' : (double.parse(mycon.text) * context.watch<money>().price).toString(),
                      ),
                    Text(new3 ?? 'Please select a currency'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (new3 != null) {
            context.read<money>().updateprice(new3!);
          } else {
            setState(() {
              _text = 'Please select a currency';
            });
          }
        },
        child: Icon(Icons.swap_horiz_rounded),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
