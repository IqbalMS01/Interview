import 'package:app/provider/InterviewProvider.dart';
import 'package:app/util/Util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  TextEditingController awal = new TextEditingController();
  TextEditingController akhir = new TextEditingController();
  List<int> list;

  @override
  void initState() {
    super.initState();
    list = Provider.of<InterviewProvider>(context, listen: false).listNumber;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: SizeConfig.paddingTop,
            left: SizeConfig.blockSizeHorizontal * 8,
            right: SizeConfig.blockSizeHorizontal * 8,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: awal,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka Awal',
                  labelStyle: new TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                  ),
                ),
              ),
              TextFormField(
                controller: akhir,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka Akhir',
                  labelStyle: new TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 4,
              ),
              RaisedButton(
                onPressed: () {
                  try {
                    hitung(int.parse(awal.text), int.parse(akhir.text));
                  } catch (e) {
                    showToast('input tidak sesuai');
                  }
                },
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Submit",
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 4,
              ),
              Consumer<InterviewProvider>(
                builder: (context, value, child) {
                  if (value.listNumber.isNotEmpty) {
                    return Text(
                        'List bilangan prima yang terakhir disimpan: \n ${value.listNumber}');
                  } else {
                    return Text(
                        'List bilangan prima yang terakhir disimpan masih kosong');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  hitung(awal, akhir) {
    int bil;
    if (awal < akhir) {
      List<int> newList = List();
      for (int i = awal; i <= akhir; i++) {
        bil = 0;
        for (int j = 1; j <= i; j++) {
          if (i % j == 0) {
            bil = bil + 1;
          }
        }
        if (bil == 2) {
          newList.add(i);
        }
      }
      Provider.of<InterviewProvider>(context, listen: false).setList(newList);
    } else {
      showToast('angka awal harus lebih kecil');
    }
  }

  showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
