

import 'package:flutter/material.dart';

import 'dart:async';
class ListPage extends StatefulWidget {
 
  _ListPageState createState() => _ListPageState();
  
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController= new ScrollController();

  List<int> _listaNumeros= new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {//metodo 
    super.initState();

    _agregar10();

    _scrollController.addListener( (){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();
      }
    });
  }
  @override
  void dispose() { 
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Listas'),

      ),
      body:  
      
      Stack(
        children: <Widget>[

          _crearLista(),
          _crearLoading(),
        ],
      ),

      
    );
  }

  Widget _crearLista(){
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index){ // la forma de como se dibuja (builder)
        
        final imagen = _listaNumeros[index];
        return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen') ,
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
      },
    );
  }

  void _agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

  Future fetchData() async{

    _isLoading = true;
    setState(() {
      
    });
    final duracion = new Duration(seconds: 2);
    return new Timer(duracion, respuestaHTTP);

  }

  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      curve:  Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)

    );
    _agregar10();
  }
  Widget _crearLoading(){
    if(_isLoading){
      return 
      
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircularProgressIndicator(),

          ],),
          SizedBox(height:15.0)
      ],
      
      );
       
    }
    else{
      return Container();
    }
  }
}