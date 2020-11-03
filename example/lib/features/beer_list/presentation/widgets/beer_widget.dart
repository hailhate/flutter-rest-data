import 'dart:ui';

import 'package:example/common/widgets/blur_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/beer.dart';

class BeerWidget extends StatelessWidget {
  final Beer beer;
  final VoidCallback onTap;

  const BeerWidget({Key key, this.beer, this.onTap}) : super(key: key);

  static Color colorFor(String string) =>
      colors[string.hashCode % colors.length];

  static const colors = <Color>[
    Color.fromRGBO(255, 180, 54, 1.0),
    Color.fromRGBO(115, 198, 217, 1.0),
    Color.fromRGBO(238, 130, 113, 1.0),
    Color.fromRGBO(210, 212, 213, 1.0),
    Color.fromRGBO(200, 93, 162, 1.0),
    Color(0xFF5C9866),
  ];

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 0, bottom: 0.0, top: 0.0),
        padding: const EdgeInsets.only(left: 0, bottom: 0.0, top: 0.0),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Color.fromRGBO(18, 61, 101, 0.11),
        //       blurRadius: 8,
        //       offset: Offset(0, -2),
        //     ),
        //   ],
        // ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 0.0, top: 0.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  beer.name ?? 'Unknown',
                                  style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                if (beer.tagLine != null)
                                  Text(
                                    beer.tagLine,
                                    style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                _buildDescriptionWidget(context),
                                // _buildPairingWidget(context),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                _buildAlcoholWidget(context),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 96,
                            child: BottleWidget(imageUrl: beer.imageURL),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildPairingWidget(BuildContext context) => Container(
        // padding: const EdgeInsets.symmetric(
        //   vertical: 8.0,
        //   horizontal: 8.0,
        // ),
        // margin: const EdgeInsets.only(right: 8.0),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: const BorderRadius.all(
        //     Radius.circular(8.0),
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good tastes with:',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            if (beer.foodPairing != null)
              ...beer.foodPairing
                  .map(
                    (dynamic pairing) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 8.0,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              '$pairing',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()
          ],
        ),
      );

  Widget _buildDescriptionWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          beer.description,
          textAlign: TextAlign.justify,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget _buildAlcoholWidget(BuildContext context) => Container(
        // width: 56.0,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color:
          //         Color.fromRGBO(18, 61, 101, 0.11),
          //     blurRadius: 8,
          //     offset: Offset(0, -2),
          //   ),
          // ],
          // color: Color.fromRGBO(251, 109, 85, 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alcohol',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              '${beer.alcoholByVolume} %',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(251, 109, 85, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      );
}
