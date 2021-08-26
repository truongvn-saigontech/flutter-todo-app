import 'package:flutter/material.dart';

class HeaderWrapper extends StatelessWidget {
  const HeaderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: HeaderContent(),
      decoration: BoxDecoration(
          color: Color(0xff5a348b),
          gradient: LinearGradient(
              colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0))),
    ));
  }
}

class HeaderContent extends StatelessWidget {
  const HeaderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ListTile(
        leading:
            Text('26', style: TextStyle(fontSize: 50.0, color: Colors.amber)),
        title: Text("Feburary",
            style: TextStyle(fontSize: 34.0, color: Colors.white)),
        subtitle:
            Text("2019", style: TextStyle(fontSize: 24.0, color: Colors.white)),
      ),
    );
  }
}
