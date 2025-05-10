import 'package:flutter/material.dart';
import 'package:ui_samples/shipmentTrackingApp/delivery_tracking_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currnetIndex = 0;
  List<Widget> body = [];
  List<String> tabsContent = ['All', 'Complete', 'In Delivery', 'Pending'];
  String selectedTab = 'All';

  PreferredSizeWidget appBAR() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Shipping Record',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  List<DeliveryTrackingCard> cardContents = [];
  void _getCardContents() {
    cardContents = DeliveryTrackingCard.getDeliveryTrackingCardContents();
  }

  @override
  void initState() {
    super.initState();
    _getCardContents();
  }

  Widget tabs() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabsContent.length,
        itemBuilder: (context, index) {
          bool isSelected = tabsContent[index] == selectedTab;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ChoiceChip(
              label: Text(tabsContent[index]),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: Colors.orange,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onSelected: (selected) {
                setState(() {
                  selectedTab = tabsContent[index];
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget deliveryTracking() {
    return Expanded(
      child: ListView.builder(
        itemCount: cardContents.length,
        itemBuilder: (context, index) {
          final Color statusColor =
              cardContents[index].status == 'In Delivery'
                  ? Color(0xfff98602)
                  : Color(0xFF409c51);

          return Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: cardContents[index].mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        child: Icon(
                          Icons.inventory_2_outlined,
                          color: Colors.grey,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        children: [
                          Text(
                            'ID NUMBER',
                            style: TextStyle(
                              color: cardContents[index].secondaryColor,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            cardContents[index].dataShipped,
                            style: TextStyle(
                              color: cardContents[index].secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 80.0),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.white12,
                        ),
                        child: Center(
                          child: Text(
                            cardContents[index].status,
                            style: TextStyle(color: statusColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tracking number',
                        style: TextStyle(
                          fontSize: 10,
                          color: cardContents[index].secondaryColor,
                        ),
                      ),
                      Text(
                        'Data Shipped',
                        style: TextStyle(
                          fontSize: 10,
                          color: cardContents[index].secondaryColor,
                        ),
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 10,
                          color: cardContents[index].secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardContents[index].trackingNumber.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: cardContents[index].secondaryColor,
                        ),
                      ),
                      Text(
                        cardContents[index].dataShipped,
                        style: TextStyle(
                          fontSize: 10,
                          color: cardContents[index].secondaryColor,
                        ),
                      ),
                      Text(
                        cardContents[index].location,
                        style: TextStyle(
                          fontSize: 10,
                          color: cardContents[index].secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.near_me,
                                color: Colors.amber,
                                size: 16,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Track',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 20, width: 1, color: Colors.white24),
                        Expanded(
                          child: Center(
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                color: cardContents[index].secondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBAR(),
      body:
          _currnetIndex == 0
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tabs(),
                    const SizedBox(height: 15.0),
                    deliveryTracking(),
                  ],
                ),
              )
              : Center(child: body[_currnetIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currnetIndex,
        onTap: (index) {
          setState(() {
            _currnetIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Orders"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: "Shipping",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
