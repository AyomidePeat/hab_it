import 'package:flutter/material.dart';

import '../utils/textstyle.dart';
import '../widgets/custom_container.dart';

class FrequencyScreen extends StatefulWidget {
  const FrequencyScreen({super.key});

  @override
  State<FrequencyScreen> createState() => _FrequencyScreenState();
}

class _FrequencyScreenState extends State<FrequencyScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
              Text('Frequency', style: headline3(context)),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          CustomContainer(
            height: size.height * 0.23,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'None',
                    style: TextStyle(),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Daily'),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Weekly'),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Monthly'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
