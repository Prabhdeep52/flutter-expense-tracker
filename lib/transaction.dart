import 'package:flutter/material.dart';


class Transaction {
  final String id;
  final String nameOfItem;
  final double amount;
  final DateTime date;


  Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.nameOfItem,
  }) ;

}