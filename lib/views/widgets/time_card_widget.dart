import 'package:flutter/material.dart';

class TimeCardWidget extends StatelessWidget {
  final String digits, millisec;
  const TimeCardWidget(
      {super.key, required this.digits, required this.millisec});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.75,
      width: MediaQuery.of(context).size.width * 0.75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // color: Colors.black,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * 0.5,
          ),
          color: Colors.grey.shade50,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.0,
                blurRadius: 10,
                offset: const Offset(3.0, 3.0)),
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 0.0,
                blurRadius: 10 / 2.0,
                offset: const Offset(3.0, 3.0)),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 10,
                offset: Offset(-3.0, -3.0)),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 10,
                offset: Offset(-3.0, -3.0)),
          ]),
      child: Text(
        digits,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 70,
            color: Colors.black54,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w100),
      ),
    );
    // return Container(
    // alignment: Alignment.center,
    // decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(6.0),
    //     color: Colors.grey.shade50,
    //     shape: BoxShape.rectangle,
    //     boxShadow: [
    //       BoxShadow(
    //           color: Colors.grey.shade300,
    //           spreadRadius: 0.0,
    //           blurRadius: 10,
    //           offset: Offset(3.0, 3.0)),
    //       BoxShadow(
    //           color: Colors.grey.shade400,
    //           spreadRadius: 0.0,
    //           blurRadius: 10 / 2.0,
    //           offset: Offset(3.0, 3.0)),
    //       BoxShadow(
    //           color: Colors.white,
    //           spreadRadius: 2.0,
    //           blurRadius: 10,
    //           offset: Offset(-3.0, -3.0)),
    //       BoxShadow(
    //           color: Colors.white,
    //           spreadRadius: 2.0,
    //           blurRadius: 10 / 2,
    //           offset: Offset(-3.0, -3.0)),
    //     ]),
    //   child: Text(
    //     digits,
    //     // textAlign: TextAlign.center,
    //     style: const TextStyle(
    //         fontSize: 80,
    //         color: Colors.black54,
    //         fontFamily: 'Montserrat',
    //         fontWeight: FontWeight.w100),
    //   ),
    // );
  }
}
