import 'package:flutter/material.dart';
import 'package:smart_app/constants.dart';

class CardModel {
  String name;
  String type;
  String balance;
  String valid;
  String moreIcon;
  String cardBackground;
  Color bgColor;
  Color firstColor;
  Color secondColor;

  CardModel(this.name, this.type, this.balance, this.valid, this.moreIcon,
      this.cardBackground, this.bgColor, this.firstColor, this.secondColor);
}

List<CardModel> cards = cardData
    .map(
      (item) => CardModel(
          item['name']?.toString() ?? '',
          item['type']?.toString() ?? '',
          item['balance']?.toString() ?? '',
          item['valid']?.toString() ?? '',
          item['moreIcon']?.toString() ?? '',
          item['cardBackground']?.toString() ?? '',
          item['bgColor'] != null ? const Color(0xFF03A5e1) : Color(0xFF03A5e1),
          item['firstColor'] != null
              ? const Color(0xFFF5F5F5)
              : Color(0xFFF5F5F5),
          item['secondColor'] != null
              ? const Color(0xFFF5F5F5)
              : Color(0xFFF5F5F5)),
    )
    .toList();

var cardData = [
  {
    "name": "Mohan",
    "type": "assets/images/mastercard_logo.png",
    "balance": "6.352.251",
    "valid": "06/24",
    "moreIcon": 'assets/icons/more_icon_grey.svg',
    "cardBackground": 'assets/icons/mastercard_bg.svg',
    "bgColor": kMasterCardColor,
    "firstColor": kGreyColor,
    "secondColor": kBlackColor
  },
  {
    "name": "Mohan",
    "type": "assets/images/jenius_logo.png",
    "balance": "20.528.337",
    "valid": "02/23",
    "moreIcon": 'assets/icons/more_icon_white.svg',
    "cardBackground": 'assets/svg/jenius_bg.svg',
    "bgColor": kJeniusCardColor,
    "firstColor": kWhiteColor,
    "secondColor": kWhiteColor
  },
  {
    "name": "Mohan",
    "type": "assets/images/mastercard_logo.png",
    "balance": "6.352.251",
    "valid": "06/24",
    "moreIcon": 'assets/icons/more_icon_grey.svg',
    "cardBackground": 'assets/svg/mastercard_bg.svg',
    "bgColor": kMasterCardColor,
    "firstColor": kGreyColor,
    "secondColor": kBlackColor
  },
  {
    "name": "Mohan",
    "type": "assets/images/jenius_logo.png",
    "balance": "20.528.337",
    "valid": "02/23",
    "moreIcon": 'assets/icons/more_icon_white.svg',
    "cardBackground": 'assets/svg/jenius_bg.svg',
    "bgColor": kJeniusCardColor,
    "firstColor": kWhiteColor,
    "secondColor": kWhiteColor
  }
];
