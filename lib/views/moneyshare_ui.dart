import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;

  TextEditingController noney_ctr1 = TextEditingController();
  TextEditingController person_ctr1 = TextEditingController();
  TextEditingController tip_ctr1 = TextEditingController();

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2D9F7),
      appBar: AppBar(
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5A026A),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: noney_ctr1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFC9C9C9),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Color(0xFF5A026A),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  top: 15.0,
                ),
                child: TextField(
                  controller: person_ctr1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Color(0xFFC9C9C9),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF5A026A),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (checked) {
                      setState(() {
                        check_tip = checked;
                        if (checked == false) {
                          tip_ctr1.text = '';
                        }
                      });
                    },
                    value: check_tip,
                    activeColor: Color(0xFF5A026A),
                    side: BorderSide(
                      color: Color(0xFF5A026A),
                    ),
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                ),
                child: TextField(
                  controller: tip_ctr1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFC9C9C9),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Color(0xFF5A026A),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5A026A),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  double? moneyshare = 0;
                  // ignore: prefer_is_empty
                  if (noney_ctr1.text.length == 0) {
                    showWarningDialog(context, 'ป้อนเงินด้วยจ้า.....');
                    return;
                  } else if (person_ctr1.text.length == 0) {
                    showWarningDialog(context, 'ป้อนคนด้วยจ้า.....');
                    return;
                  } else if (check_tip == false) {
                    double? money = double.parse(noney_ctr1.text);
                    int? person = int.parse(person_ctr1.text);
                    moneyshare = money / person;
                  } else 
                    if (tip_ctr1.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนทิปด้วย....');
                      return;
                    } else {
                      double? money = double.parse(noney_ctr1.text);
                      int? person = int.parse(person_ctr1.text);
                      double? tip = double.parse(tip_ctr1.text);
                      moneyshare = (money + tip) / person;
                    }
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowmoneyshareUI(
                        money: double.parse(noney_ctr1.text),
                        person: int.parse(person_ctr1.text),
                        tip: double.parse(
                            tip_ctr1.text.isEmpty ? '0' : tip_ctr1.text),
                        moneyshare: moneyshare,
                      ),
                    ),
                  );
                },
                child: Text(
                  'คำนวณ',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0xFF5A026A),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    noney_ctr1.text = '';
                    person_ctr1.text = '';
                    tip_ctr1.text = '';
                    check_tip = false;
                  });
                },
                label: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.sync,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Colors.red,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Created by ITTHIRIT SAU',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
