import 'package:flutter/material.dart';

class DeliveryTrackingCard {
  int trackingNumber;
  String dataShipped;
  String location;
  String status;
  Color mainColor;
  Color secondaryColor;
  DeliveryTrackingCard(
    this.trackingNumber,
    this.dataShipped,
    this.location,
    this.status,
    this.mainColor,
    this.secondaryColor,
  );
  static getDeliveryTrackingCardContents() {
    return [
      DeliveryTrackingCard(
        213123,
        '13 Jul.2024',
        'Hebron',
        'In Delivery',
        Color(0xff090909),
        Colors.white,
      ),
      DeliveryTrackingCard(
        213123,
        '13 Jul.2024',
        'Hebron',
        'Complete',
        Color(0xfffffffa),
        Colors.black,
      ),
      DeliveryTrackingCard(
        213123,
        '13 Jul.2024',
        'Hebron',
        'Complete',
        Color(0xfffffffa),
        Colors.black,
      ),
    ];
  }
}
