import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
 
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre='', _email='', _fecha='';
  String _opcionesSeleccionada = 'volar';
  List<String> _poderes = ['volar', 'Rayos x', 'super fuerza', 'nadar'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs d etexto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
        ],
      )
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true, //automaticamente se pone por defecto
      textCapitalization: TextCapitalization.sentences, //Mayuscula por cada palabra
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),

      ),

      onChanged: (valor){
       
        setState(() {
           _nombre=valor;
        });
      },

    );
  }

  Widget _crearEmail(){
  return TextField(
        //*** diferencia de texto a email
        keyboardType: TextInputType.emailAddress,
        //*** 
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          counter: Text('Letras ${ _nombre.length}'),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Solo es el email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),

        ),

        onChanged: (valor)=>setState(() {
            _email=valor;
        })
      );
  }
 
  Widget _crearPassword(){
    return TextField(
        //*** diferencia de texto a password
        obscureText: true,
        //*** 
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          counter: Text('Letras ${ _nombre.length}'),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Solo es el Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),

        ),

        onChanged: (valor)=>setState(() {
            _email=valor;
        })
      );
  }
 
  Widget _crearFecha(BuildContext context){
    return TextField(
          
        //*** sin copiar
        enableInteractiveSelection: false,         
        //*** 
        // dato de edittext para cambierlo en otra funcion
        controller: _inputFieldDateController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ), 
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento', 
          suffixIcon: Icon(Icons.calendar_view_day),
          icon: Icon(Icons.calendar_today),

        ),
        //onTap
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      );
  }
    _selectDate(BuildContext context) async{
      
      DateTime picked = await showDatePicker(
        context:  context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        //idioma espanol de la fecha
        locale: Locale('es', 'ES')
      );

      if(picked!=null){
        setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;

        });
      }
  }


List<DropdownMenuItem<String>> getOpcionesDropdown(){
  List<DropdownMenuItem<String>> lista = new List();
  _poderes.forEach((poder){
    lista.add(DropdownMenuItem(
      child: Text(poder),
      value: poder,
    ));
  });

  return lista;
}

Widget  _crearDropdown(){

  return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,),

      Expanded(
        child: DropdownButton(
          value: _opcionesSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt){
            setState(() {
              _opcionesSeleccionada=opt;
            });

          },
        ),
      )
    ],
  );
  
  
  
  
}

  //MOSTRAR TEXTO DE LOS INPUTS
  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('email $_email'),
      trailing: Text(_opcionesSeleccionada),
    );
  }
}