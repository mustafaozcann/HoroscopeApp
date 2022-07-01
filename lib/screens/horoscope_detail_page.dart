import 'package:app_horoscope/models/horoscope.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetail extends StatefulWidget {
  late Horoscope selectedHoroscope;
  HoroscopeDetail({required this.selectedHoroscope, Key? key})
      : super(key: key);

  @override
  State<HoroscopeDetail> createState() => _HoroscopeDetail();
}

class _HoroscopeDetail extends State<HoroscopeDetail> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  Color _appbarColor = Colors.transparent; //default color
  late PaletteGenerator _paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => initializePalette(),);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: _appbarColor,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.selectedHoroscope.horoscopeName +
                  " Burcu ve Özellikleri"),
              background: Container(
                  child: Image.asset(
                widget.selectedHoroscope.horoscopeBigPicture,
                fit: BoxFit.cover,
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  widget.selectedHoroscope.horoscopeGeneralProperties,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Times"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initializePalette() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
        AssetImage(widget.selectedHoroscope.horoscopeBigPicture));
    setState(() {
      _appbarColor = _paletteGenerator.dominantColor!.color;
    });
  }
}
