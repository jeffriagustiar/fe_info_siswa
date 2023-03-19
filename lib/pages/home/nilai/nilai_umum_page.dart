import 'package:fe_info_siswa/share/theme.dart';
import 'package:fe_info_siswa/widgets/appBar_buttom.dart';
import 'package:flutter/material.dart';

class NilaiUmumPage extends StatefulWidget {
  const NilaiUmumPage({super.key});

  @override
  State<NilaiUmumPage> createState() => _NilaiUmumPageState();
}

class _NilaiUmumPageState extends State<NilaiUmumPage> {

  List<String> tahunAjaran = ['2021/2022','2022/2023'];
  String? _tahunAjaran='2021/2022';
  List<String> semester = ['1','2'];
  String? _semester='1';

  Widget comboBox(){
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      width: double.infinity,
      // height: 100,
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tahun Ajaran",
            style: blackTextStyle,
          ),
          ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                style: TextStyle(
                  color: blackColor
                ),
                borderRadius: BorderRadius.circular(15),
                focusColor: blackColor,
                underline: Container(
                  height: 2,
                  color: backgroundColor6,
                ),
                value: _tahunAjaran,
                onChanged: (newValue) {
                    setState(() {
                      _tahunAjaran = newValue;
                    });
                  },
                items: tahunAjaran.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location,),
                      value: location,
                    );
                  }).toList()
              )
            ),
          Text(
            "Semester",
            style: blackTextStyle,
          ),
          
          ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                style: TextStyle(
                  color: blackColor
                ),
                borderRadius: BorderRadius.circular(15),
                focusColor: blackColor,
                underline: Container(
                  height: 2,
                  color: backgroundColor6,
                ),
                value: _semester,
                onChanged: (newValue) {
                    setState(() {
                      _semester = newValue;
                    });
                  },
                items: semester.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location,),
                      value: location,
                    );
                  }).toList()
              )
            ),
        ],
      ),
    );
  }

  Widget cell(String nama){
    return Container(
      height: 20,
      child: Text(
        nama,
        style: blackTextStyle.copyWith(
          fontSize: 12
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget content(){
    return Container(
      margin: EdgeInsets.only(top: 15,left: 10, right: 10),
      padding: EdgeInsetsDirectional.all(10),
      width: double.infinity,
      // height: 100,
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          // 0: IntrinsicColumnWidth(),
          // 1: FlexColumnWidth(),
          // 2: FixedColumnWidth(64),
          0: FixedColumnWidth(200),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            children: [
              Container(
                width: 70,
                child: Text(
                  "Mata Pelajaran",
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TableCell(
                child: Container(
                  width: 32,
                  child: Text(
                    "Angka",
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold
                    ),
                  textAlign: TextAlign.center,
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  width: 32,
                  child: Text(
                    "Huruf",
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold
                    ),
                  textAlign: TextAlign.center,
                  ),
                )
              ),
              TableCell(
                child: Container(
                  width: 32,
                  child: Text(
                    "action",
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold
                    ),
                  textAlign: TextAlign.center,
                  ),
                )
              ),
            ],
          ),
          TableRow(
            children: [
              cell("Bahasa Indonesia"),
              cell("100"),
              cell("A"),
              cell("-"),
            ],
          ),
          TableRow(
            children: [
              cell("Bahasa Inggris"),
              cell("100"),
              cell("A"),
              cell("-"),
            ],
          ),
        ],
      ),
    );
  }

  Widget cell2(double lebar, String nama){
    return Container(
      width: lebar, 
      child: Text(
        nama,
        style: blackTextStyle.copyWith(
          fontSize: 12
        ),
      )
    );
  }

  Widget content2(){
    return Container(
      margin: EdgeInsets.only(top: 15,left: 10, right: 10),
      padding: EdgeInsetsDirectional.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(width: 180, child: Text("Mata Pelajaran",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              Container(width: 40, child: Text("Angka",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              Container(width: 40, child: Text("Huruf",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),
              Container(width: 40, child: Text("Action",style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),)),

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: 1,
            color: blackColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              cell2(180, "Bahasa Indonesia"),
              cell2(40, "100"),
              cell2(40, "A"),
              cell2(40, "icon"),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              cell2(180, "Bahasa Inggris"),
              cell2(40, "100"),
              cell2(40, "A"),
              cell2(40, "icon"),

            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          AppBarButtom(nama: 'Pelajaran Umum'),
          comboBox(),
          content(),
          content2()
        ],
      ),
    );
  }
}