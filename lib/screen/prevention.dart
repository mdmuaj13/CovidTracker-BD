import 'package:flutter/material.dart';

class Prevention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.deepPurple,
                Color(0xFFb6198a),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bg.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                'Prevention',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Icon(Icons.clear_all)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Positioned(
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/3feet.png",
                                    width: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 150.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 150.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              symptompDetail("Wash Hand Frequently", "prev5"),
                              symptompDetail("Do not sneeze in the palm ", "prev1"),
                              symptompDetail("Sneeze into your forearm", "prev2"),
                              symptompDetail("Do not touch your face", "prev3"),
                              symptompDetail("Wear Mask", "prev4"),
                              symptompDetail("Stay Home", "prev6"),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                                  "Wash hand with soap or sanitasor frequently. \n \n" +
                                  "Wear Mask and gloves. \n\n" +
                                  "Keep 1 meter distance with other person \n\n" +
                                  "Do not sneeze in the palm of your hand. Sneeze into your forearm or elbow\n\n" +
                                  "Do not touch your face with hand \n",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Container symptompDetail(String title, String image) {
  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 10.0,
          color: Colors.grey[200],
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/$image.png"),
          SizedBox(
            height: 10.0,
          ),
          Text("$title"),
        ],
      ),
    ),
  );
}
