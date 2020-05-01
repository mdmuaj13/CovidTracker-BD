import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String bgImage;

  final String topText;
  final String bottomText;
  const MyHeader({
    Key key,
    this.image,
    this.bgImage,
    this.topText,
    this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopBarClipper(),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff7F00FF),
              Color(0xffc471ed),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("$bgImage"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/menu.svg"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'info');
                  },
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(
                      "$image",
                      width: 230, 
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      left: 200.0,
                      child: Text(
                        "$topText \n $bottomText",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
