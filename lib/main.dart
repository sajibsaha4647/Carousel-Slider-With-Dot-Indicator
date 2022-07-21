import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var imagelist = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];
 var colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  ];
  bool _isPlaying = false;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }


  @override
  Widget build(BuildContext context) {



    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text("carosal"),
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              child: CarouselSlider.builder(
                  unlimitedMode: true,
                  controller: _sliderController,
                  slideBuilder: (index) {
                    return Container(
                      alignment: Alignment.center,
                      color: colors[index],
                      child: Text(
                        imagelist[index],
                        style: TextStyle(fontSize: 200, color: Colors.white),
                      ),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: EdgeInsets.only(bottom: 32),
                    indicatorBorderColor: Colors.black,
                  ),
                  initialPage: 0,
                  enableAutoSlider: true,
                  itemCount: imagelist.length
              ),
            ),
            RaisedButton(
                child: Text("next"),
                onPressed: (){
                  _sliderController.nextPage();
            }),
            RaisedButton(
                child: Text("Previous"),
                onPressed: (){
                  _sliderController.previousPage();
            })
          ],


        ),
    ));
  }
}


