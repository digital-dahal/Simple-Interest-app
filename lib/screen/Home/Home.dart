import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  String cityname = "";
  var currnecy = ["Rupees", "Pound", "Others"];
  String currentcurrency = "";
  String displayString = "Calculate some";
  String displayText = "";
  @override
  void initState() {
    super.initState();
    currentcurrency = currnecy[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: logo(),
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 3.0,
          title: Text(
            'Calculator',
            style: TextStyle(
              fontFamily: "Unbuntu",
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        body: Form(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              showWidget(),
              Text(
                displayText.length > 0 ? displayText : displayString,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showWidget() {
    var show = Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calculate",
            style: TextStyle(
              fontFamily: "Unbuntu",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          //Principal Text field
          TextField(
            controller: controller1,
            autofocus: true,
            cursorColor: Colors.white10,
            autocorrect: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurpleAccent,
                ),
              ),
              labelText: "Enter Your Principal",
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            onChanged: (String usr) {
              setState(() {
                cityname = usr;
              });
            },
          ),
          // Rate tex field
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: controller2,
              autofocus: false,
              autocorrect: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                labelText: "Enter Your Rate",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              //Term text field
              Expanded(
                child: TextField(
                  controller: controller3,
                  autofocus: false,
                  autocorrect: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    labelText: "Enter Your Term",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              //DropDown
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DropdownButton<String>(
                  items: currnecy.map((String dropitem) {
                    return DropdownMenuItem<String>(
                      value: dropitem,
                      child: Text(dropitem),
                    );
                  }).toList(),
                  value: currentcurrency,
                  onChanged: (String isSelect) {
                    dropDown(isSelect);
                  },
                ),
              )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              //Button Submit
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurpleAccent),
                  ),
                  onPressed: () {
                    setState(() {
                      displayText = onSubmit();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 10, 68, 10),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              //Button Reset
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  onPressed: () {
                    setState(() {
                      displayText = displayString;
                      reset();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 10, 68, 10),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return show;
  }

  void dropDown(String isSelect) {
    setState(() {
      currentcurrency = isSelect;
    });
  }

  Widget logo() {
    AssetImage asset = AssetImage('images/logo.png');
    Image image = Image(image: asset);
    return Container(
      child: image,
    );
  }

  String onSubmit() {
    double principal = double.parse(controller1.text);
    double rate = double.parse(controller2.text);
    double term = double.parse(controller3.text);

    double total = (principal * rate * term) / 100;
    String result =
        "Your Si with $principal principal and $rate rate and $term term is $total $currentcurrency ";
    return result;
  }

  void reset() {
    controller1.text = "";
    controller3.text = "";
    controller2.text = "";
    currentcurrency = currnecy[0];
  }
}
