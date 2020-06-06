import 'package:aio_pc_controller/Custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config.dart';

class Controller extends StatefulWidget {
  @override
  ControllerState createState() => new ControllerState();
}

class ControllerState extends State<Controller> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  var w, h;
  double toph, rtx, rty, rbx, rby, ltx, lty, lbx, lby, ax, ay, r, xx, xy, yx, yy, bx, by, exitx, exity, exitr;
  int rtdark = 400, rbdark = 400, lbdark = 400, ltdark = 400, adark = 400, xdark = 400, ydark = 400, bdark = 400, exitdark = 400;

  double backx, backy, backh, backw, startx, starty, starth, startw;
  int backdark = 400, startdark = 400;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    toph = h / 8;
    rtx = w / 2;
    rty = 0.0;

    rbx = w/2;
    rby = toph;

    ltx = 0.0;
    lty = 0.0;

    lbx = 0.0;
    lby = toph;

    r = h/15;
    ax = yx = 7*w/9;
    ay = 5*h/9;

    xx = 7*w/9 - h/9;
    xy = by = 4*h/9;

    yy = 3*h/9;
    bx = 7*w/9 + h/9;
    
    exitx = w*0.95;
    exity = h*0.9;
    exitr = h/30;

    backh = h/10;
    backw = w/10;
    backx = w/2 - w/9 - backw/2;
    backy = h/3 - backh/2;

    starth = h/10;
    startw = w/10;
    startx = w/2 + w/9 - startw/2;
    starty = h/3 - starth/2;

    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
        top: rty,
        left: rtx,
        child: GestureDetector(
          child: Container(
            height: toph,
            width: w/2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[400], Colors.blue[rtdark + 300]]),
                border: Border(bottom: BorderSide(color:Colors.white,width:0.1)),
            ),
            child: Center(child:Text("RT")),
          ),
          onPanStart: (_) {
            _send('down&TriggerR');
            setState(() {
              rtdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&TriggerR');
            setState(() {
              rtdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: rby,
        left: rbx,
        child: GestureDetector(
          child: Container(
            height: toph,
            width: w/2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[400], Colors.blue[rbdark + 300]]),
                border: Border(bottom: BorderSide(color:Colors.blue[900])),
            ),
            child: Center(child:Text("RB")),
          ),
          onPanStart: (_) {
            _send('down&BtnShoulderR');
            setState(() {
              rbdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnShoulderR');
            setState(() {
              rbdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: lty,
        left: ltx,
        child: GestureDetector(
          child: Container(
            height: toph,
            width: w/2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[ltdark + 300],Colors.blue[400]]),
                border: Border(bottom: BorderSide(color:Colors.white,width:0.1)),
            ),
            child: Center(child:Text("LT")),
          ),
          onPanStart: (_) {
            _send('down&TriggerL');
            setState(() {
              ltdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&TriggerL');
            setState(() {
              ltdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: lby,
        left: lbx,
        child: GestureDetector(
          child: Container(
            height: toph,
            width: w/2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[lbdark + 300],Colors.blue[400]]),
                border: Border(bottom: BorderSide(color:Colors.blue[900])),
            ),
            child: Center(child:Text("LB")),
          ),
          onPanStart: (_) {
            _send('down&BtnShoulderL');
            setState(() {
              lbdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnShoulderL');
            setState(() {
              lbdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: ay,
        left: ax,
        child: GestureDetector(
          child: Container(
            height: 2*r,
            width: 2*r,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.green[adark],Colors.green[adark+300]]),
                border: Border.all(color:Colors.green[900]),
                shape: BoxShape.circle,
            ),
            child: Center(child:Text("A")),
          ),
          onPanStart: (_) {
            _send('down&BtnA');
            setState(() {
              adark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnA');
            setState(() {
              adark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: xy,
        left: xx,
        child: GestureDetector(
          child: Container(
            height: 2*r,
            width: 2*r,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.blue[xdark],Colors.blue[xdark+300]]),
                border: Border.all(color:Colors.blue[900]),
                shape: BoxShape.circle,
            ),
            child: Center(child:Text("X")),
          ),
          onPanStart: (_) {
            _send('down&BtnX');
            setState(() {
              xdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnX');
            setState(() {
              xdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: yy,
        left: yx,
        child: GestureDetector(
          child: Container(
            height: 2*r,
            width: 2*r,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.yellow[ydark],Colors.yellow[ydark+300]]),
                border: Border.all(color:Colors.yellow[900]),
                shape: BoxShape.circle,
            ),
            child: Center(child:Text("Y")),
          ),
          onPanStart: (_) {
            _send('down&BtnY');
            setState(() {
              ydark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnY');
            setState(() {
              ydark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: by,
        left: bx,
        child: GestureDetector(
          child: Container(
            height: 2*r,
            width: 2*r,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red[bdark],Colors.red[bdark+300]]),
                border: Border.all(color:Colors.red[900]),
                shape: BoxShape.circle,
            ),
            child: Center(child:Text("B")),
          ),
          onPanStart: (_) {
            _send('down&BtnB');
            setState(() {
              bdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnB');
            setState(() {
              bdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: exity,
        left: exitx,
        child: GestureDetector(
          child: Container(
            height: 2*exitr,
            width: 2*exitr,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red[bdark],Colors.black]),
                border: Border.all(color:Colors.black),
                shape: BoxShape.circle,
            ),
            child: Center(child:Icon(Icons.cancel))
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      Positioned(
        top: backy,
        left: backx,
        child: GestureDetector(
          child: Container(
            height: backh,
            width: backw,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.grey[backdark],Colors.grey]),
                border: Border.all(color:Colors.black),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular( 16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular( 16.0),
            )
            ),
            child: Center(child:Icon(Icons.content_copy))
          ),
          onPanStart: (_) {
            _send('down&BtnBack');
            setState(() {
              backdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnBack');
            setState(() {
              backdark = 400;
            });
          },
        ),
      ),
      Positioned(
        top: starty,
        left: startx,
        child: GestureDetector(
          child: Container(
            height: backh,
            width: backw,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.grey[startdark],Colors.grey]),
                border: Border.all(color:Colors.black),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular( 16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular( 16.0),
            )
            ),
            child: Center(child:Icon(Icons.dehaze))
          ),
          onPanStart: (_) {
            _send('down&BtnStart');
            setState(() {
              startdark = 600;
            });
          },
          onPanEnd: (_) {
            _send('up&BtnStart');
            setState(() {
              startdark = 400;
            });
          },
        ),
      ),
    ]));
  }

  void _send(char) {
    print("Sending " + char);
    if(sock == null) print("Could not send.");
    else sock.write('cont' + '&' + char + '%');
  }
}