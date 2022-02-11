import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

class ShowmoneyshareUI extends StatefulWidget {
  double? money;
  int? person;
  double? tip;
  double? moneyshare;

  ShowmoneyshareUI({
    Key? key,
    this.money,
    this.person,
    this.tip,
    this.moneyshare,
  }) : super(key: key);

  @override
  _ShowmoneyshareUIState createState() => _ShowmoneyshareUIState();
}

class _ShowmoneyshareUIState extends State<ShowmoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D9F7),
      appBar: AppBar(
        title: Text(
          'ผลการแชร์เงิน',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5A026A),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('จำนวนเงินที่จะหาร'),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.money.toString(),
                style: TextStyle(
                  color: Color(0xFF5A026A),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('จำนวนคนที่จะหาร'),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  color: Color(0xFF5A026A),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'คน',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('จำนวนเงินทิป'),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.tip.toString(),
                style: TextStyle(
                  color: Color(0xFF5A026A),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('สรุปว่าหารกันคนละ'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80.0,
                height: 100.0,
                alignment: Alignment.center,
                color: Colors.yellow,
                child: Text(
                  widget.moneyshare.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'บาท',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
