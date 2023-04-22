import 'package:carousel_slider/carousel_slider.dart';
import 'package:fe_info_siswa/models/siswa_model.dart';
import 'package:fe_info_siswa/share/theme.dart';
import 'package:flutter/material.dart';

class SiswaPage extends StatefulWidget {
  final SiswaModel siswa;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SiswaPage(this.siswa);

  @override
  State<SiswaPage> createState() => _SiswaPageState();
}

class _SiswaPageState extends State<SiswaPage> {

  List images = [
    'assets/gsepatu1.png',
    'assets/gsepatu2.png',
    'assets/gsepatu3.png',
    ];
  
  List familiarShoes = [
    'assets/gsepatu1.png',
    'assets/gsepatu2.png',
    'assets/gsepatu3.png',
    'assets/gsepatu1.png',
    'assets/gsepatu2.png',
    'assets/gsepatu3.png',
    'assets/gsepatu1.png',
    'assets/gsepatu2.png',
    'assets/gsepatu3.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget indicator(int index){
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffC4C4C4)
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl){
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl)
          ),
          borderRadius: BorderRadius.circular(6)
        ),
      );
    }

    Widget header(){

      int index = -1;

      return Column(
        children: [

          Container(
            margin: EdgeInsets.only(top: 20,left: defaultMargin,right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.chevron_left)
                ),
                Icon(Icons.shopping_bag,color: backgroundColor1,)
              ],
            ),
          ),

          CarouselSlider(
            items: images.map(
              (image) => Image.asset(
                image,
                width: MediaQuery.of(context).size.width,
                height: 310,
                fit: BoxFit.cover,
              )
            ).toList(), 
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason){
                setState(() {
                  currentIndex = index;
                });
              }
            )
          ),

          const SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            } ).toList(),
          )

        ],
      );
    }

    Widget content(){

      int index = -1;

      return Container(
        margin: const EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24)
          ),
          color: backgroundColor1
        ),
        child: Column(
          children: [

            //? Note : Header Content
            Container(
              margin: EdgeInsets.only(top: defaultMargin,left: defaultMargin,right: defaultMargin),
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.siswa.nama}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold
                          ),
                        ),
                        Text(
                          'Hiking',
                          style: secondTextStyle.copyWith(
                            fontSize: 12
                          ),
                        )
                      ],
                    ),
                  ),

                  Image.asset('assets/Love_Button_blck.png',width: 46,)

                ],
              ),
            ),

            //? Note. Price Content
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 20,left: defaultMargin,right: defaultMargin),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'abc',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'abc',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold
                    ),
                  )
                ],
              ),
            ),

            //? Note. Description Content
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin, right: defaultMargin,left: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Text(
                    widget.siswa.alamatsiswa!,
                    style: subTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            //? Note. Familiar Content
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes
                      .map((image) {
                        index ++;
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0
                          ),
                          child: familiarShoesCard(image)
                        );
                      }).toList(),
                    ),
                  )
                  //
                ],
              ),
            ),

            //? Note. Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [

                  Container(
                    height: 54,
                    width: 54,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/Button_Chat.png'
                        )
                      )
                    ),
                  ),

                  const SizedBox(width: 16,),

                  // Expanded(

                  //   child: Container(
                  //     height: 54,
                  //     child: TextButton(
                  //       onPressed: () {}, 
                  //       style: TextButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12)
                  //         ),
                  //         backgroundColor: primaryColor
                  //       ),
                  //       child: Text(
                  //         'Add to Cart',
                  //         style: primaryTextStyle.copyWith(
                  //           fontSize: 16,
                  //           fontWeight: bold
                  //         ),
                  //       )
                  //     ),
                  //   ),
                    
                  // )

                ],
              ),
            )

          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          header(),
          content()
        ],
      )
    );
  }
}