import 'package:flutter/material.dart';

import 'helpers/colors.dart';
import 'helpers/strings.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.primary,
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 20, top: 20 ),
          child: Text('Passer', style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: 'assets/images/a1.jpg',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
              makePage(
                reverse: true,
                  image: 'assets/images/a2.jpg',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),
              makePage(
                  image: 'assets/images/a3.jpg',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}){
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse ?
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Image.asset(image),),
              SizedBox(height: 30,),

            ],
          ) : SizedBox(),
          Text(title, style: TextStyle(color: ColorApp.primary, fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(content, style: TextStyle(color: ColorApp.gray, fontSize: 20, fontWeight: FontWeight.w400),),
          reverse ?
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Image.asset(image),),
              SizedBox(height: 30,),

            ],
          ) : SizedBox(),
        ],
      ),
    );

  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 8,
      width: isActive ? 30 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ColorApp.secondary,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for (int i=0; i<3; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}
