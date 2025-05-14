import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionsCard extends StatefulWidget {
  const SubscriptionsCard({super.key});

  @override
  State<SubscriptionsCard> createState() => _PlanState();
}

class _PlanState extends State<SubscriptionsCard> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  Widget header() {
    return Column(
      children: [
        Text(
          'Try FREE for 4 weeks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'We uncover the facts around the',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'clock, all over the globe.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked1 = true;
                isChecked2 = false;
              });
            },
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color:
                      isChecked1 == true
                          ? Color(0xff5b6acd)
                          : Color(0xffebeaf9),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 5.0,
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 2,
                      child: Checkbox(
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                            if (isChecked1 == true) {
                              isChecked2 = false;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monthly',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '4 weeks for free',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Then 3 every month for the first year',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked1 = false;
                isChecked2 = true;
              });
            },
            child: Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color:
                      isChecked2 == true
                          ? Color(0xff5b6acd)
                          : Color(0xffebeaf9),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 2,
                      child: Checkbox(
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                            if (isChecked2 == true) {
                              isChecked1 = false;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xff3243db),
                          ),
                          child: Text(
                            'BEST VALUE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Yearly',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '4 weeks for free',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Then 30 for the first year',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget continueButton() {
    return Column(
      children: [
        Container(
          width: 300.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Continue ',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget continuePayPal() {
    return Column(
      children: [
        Container(
          width: 300.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: Color(0xfff5f6f9)),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Continue with PayPal ',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.white,
            ),
            width: 600.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                header(),
                SizedBox(height: 20.0),
                buy(),
                SizedBox(height: 40.0),
                continueButton(),
                SizedBox(height: 10.0),
                continuePayPal(),
                TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(
                      'https://github.com/MohammadBahar-17',
                    );
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Text(
                    'View more offers',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
