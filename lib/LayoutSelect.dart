import 'package:aio_pc_controller/Custom.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'LoadCustom.dart';
import 'tilt.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:flutter/services.dart';
import 'globals.dart';
class LayoutSelect extends StatelessWidget {
  final TextEditingController ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(!ovisit){
      tilt();
      Timer.periodic(Duration(milliseconds: 50), (Timer t) {
        if (tiltcontrol) {
          tsend();
        }
      });
      ovisit = true;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Layout"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ping_test');
                      },
                      child: Text('Ping Test'),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/wasd_layout');
                      },
                      child: Text('WASD Layout'),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/gyro');
                      },
                      child: Text('Gyroscopic Control'),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        customLoader(context, '_untitled');
                      },
                      child: Text('Create Custom Layout'),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        loadCustomBuilder(context);
                      },
                      child: Text('Load Custom Layout'),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/controller');
                      },
                      child: Text('Controller'),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
