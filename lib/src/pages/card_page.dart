import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),

      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
           _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
        ],
      ) ,
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color:Colors.blue),
            title: Text('Aqui estamos con ladescrioc de la tarjeta'),
            subtitle: Text('subtitulo loololololololololol'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
                
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
                
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card=  Container(

      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://www.canva.com/learn/wp-content/uploads/2018/12/00-winterlandscapes_featimage.jpg'
            ),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
         // Image(
          //  image: NetworkImage('https://www.canva.com/learn/wp-content/uploads/2018/12/00-winterlandscapes_featimage.jpg'
          //  ),
          //  ),
            Container(
              padding: EdgeInsets.all(10.0),  
              child: Text('No tengo idea de que poner')
            )
            
        ],
      ),
    );

    return Container(
      
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)
          )
        ]
        
      ),
      child: ClipRRect(
        borderRadius:BorderRadius.circular(30.0),
        child: card,

      ),
    );
  }
}