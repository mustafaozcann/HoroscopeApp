import 'package:app_horoscope/data/horoscopes_data.dart';
import 'package:app_horoscope/models/horoscope.dart';
import 'package:flutter/material.dart';

class HoroscopeListPage extends StatelessWidget {
  late final List<Horoscope> _horoscopeList;

  HoroscopeListPage() {
    _horoscopeList = prepareData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          "Burçlar Listesi",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Times"),
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(

        itemCount: _horoscopeList.length,
        itemBuilder: (context, index) {
          Horoscope currentHoroscope = _horoscopeList[index];
          return Card(
            color: Colors.amberAccent,
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, "/horoscopeDetailPage",arguments: currentHoroscope),
              leading: CircleAvatar(
                radius: 32,
                child: Image.asset(currentHoroscope.horoscopeLittlePicture, fit: BoxFit.cover,),
              ),
              title: Text(currentHoroscope.horoscopeName, style: TextStyle(fontFamily: "Times", fontWeight: FontWeight.bold, fontSize: 20),),
              subtitle: Text(currentHoroscope.horoscopeDateScope),
              trailing: Icon(Icons.arrow_circle_right),
            ),
          );
        });
  }

  List<Horoscope> prepareData() {
    List<Horoscope> listHoroscope = [];

    for (int i = 0; i < HorosCopeData.BURC_ADLARI.length; i++) {
      var horoscopeName = HorosCopeData.BURC_ADLARI[i];
      var horoscopeDateScope = HorosCopeData.BURC_TARIHLERI[i];
      var horoscopeGeneralProperties = HorosCopeData.BURC_GENEL_OZELLIKLERI[i];
      var horoscopeLittlePicture = "lib/assets/images/${horoscopeName.toLowerCase()}${i + 1}.png";
      var horoscopeBigPicture =
          "lib/assets/images/${horoscopeName.toLowerCase()}_buyuk${i + 1}.png";

      Horoscope currentHoroscope = Horoscope(
          horoscopeName,
          horoscopeDateScope,
          horoscopeGeneralProperties,
          horoscopeLittlePicture,
          horoscopeBigPicture);
      listHoroscope.add(currentHoroscope);
    }

    return listHoroscope;
  }
}
