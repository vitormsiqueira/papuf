import 'package:flutter/material.dart';
import 'package:papuf/widgets/jsonToSend.dart';
import '../color_hex.dart';
import 'connect_MQTT.dart';

class ControlTemperature extends StatefulWidget {
  final String selected;
  final int temp;
  final String topic;
  const ControlTemperature(this.selected, this.temp, this.topic);

  @override
  _ControlTemperatureState createState() => _ControlTemperatureState();
}

class _ControlTemperatureState extends State<ControlTemperature> {
  String selected;
  int temp;
  String topic;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      temp = widget.temp;
      topic = widget.topic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RawMaterialButton(
              onPressed: () {
                setState(() {
                  temp++;
                });
                //envia um json {"temp": "3", "state": "on"} com temperatura e estado
                publishM(createJsonTempState(temp.toString(), "on"), topic);
              },
              child: _textOthers(selected, '+', 45, FontWeight.w400),
              shape: CircleBorder(),
            ),
          Container(
            child: _textOthers(
                selected, temp.toString() + 'º', 45, FontWeight.w300),
          ),
           RawMaterialButton(
              onPressed: () {
                setState(() {
                  temp--;
                });
                publishM('RGB-L', topic);
              },
              child: _textOthers(selected, '-', 50, FontWeight.w400),
              shape: CircleBorder(),
           ),
        SizedBox(
          height: 15,
        )
        ],
      ),
    );
  }
}

_textOthers(String selected, String texto, int size, FontWeight myFontWeight) {
  return Center(
    child: Text(
      texto,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: selected == "On" ? Colors.white : hexToColor("#4163CD"),
        fontWeight: myFontWeight,
      ),
    ),
  );
}
