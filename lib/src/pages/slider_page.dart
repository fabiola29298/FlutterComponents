import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget { 

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 20.0;
  bool _bloquearCheck = false;
  //bool _bloquearSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Slider'),
      ) ,
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child:Column(
          children: <Widget>[

            _crearSlider(),
            _crearCheckbox(),
            _crearSwith(),
            Expanded(
              child: _crearImage()
            ),
          ],
        ),
      ),
      );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamano de la imagen',
      //divisions: 20,

      value: _valorSlider,
      max: 400.0,
      min: 10.0,
      // evaluar si el bloquearCheck, si es true poner null y sino habilidar
      onChanged: (_bloquearCheck)? null: (valor){
        
        setState(() {
          _valorSlider = valor;
        });
        
        
      },
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage('https://www.klatsch-tratsch.de/wp-content/uploads/2018/03/brendon-urie-panic-at-the-disco.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    /*return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
    */
    return CheckboxListTile(
      title: Text('Bloquear slider'),

      value: _bloquearCheck,
      onChanged: (valor){
        
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwith() {
    return SwitchListTile(
      title: Text('Bloquear slider'),

      value: _bloquearCheck,
      onChanged: (valor){
        
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }



}