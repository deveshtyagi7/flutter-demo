import 'package:flutter/material.dart';

class MainBodyWidget extends StatelessWidget {
  final Widget child;

  const MainBodyWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
// decoration: BoxDecoration(
//             // color: Colors.red,
//             gradient: LinearGradient(
//               colors: [
//                 Colors.white,
//                 Colors.white,
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     image: DecorationImage(
        //         fit: BoxFit.cover,
        //         colorFilter: ColorFilter.mode(
        //             Colors.black.withOpaci2y(0.4), BlendMode.srcOver),
        //         image: AssetImage("assets/images/map/Group 23557.png")),
        //   ),
        // ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.white],
            ).createShader(bounds);
          },
          child: Positioned.fill(
            child: Image(
                // colorBlendMode: BlendMode.dstOver,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/map/Group 23557.png")),
          ),
        ),
        child
      ],
    );
  }
}
