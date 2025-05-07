import 'package:flutter/material.dart';

enum Choices { choice1, choice2, choice3 }

class Filter extends StatelessWidget {
  const Filter({super.key});

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filter',
            style: TextStyle(fontSize: 40, color: Color(0x0ffbab9cf)),
          ),
          Icon(Icons.cancel, color: Color(0x0ffbab9cf)),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              'Search by keyboard',
              style: TextStyle(color: Color(0xff928eb6), fontSize: 30),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: Color(0xff242046),
              filled: true,
              hintText: 'search jobs',
              hintStyle: TextStyle(color: Color(0xff615e7d), fontSize: 22),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff242046)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff615e7d),
                size: 38.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF322e59),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header(),
              searchBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 20.0,
                ),
                child: SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'VIEW',
                          style: TextStyle(
                            color: Color(0xff8b86ae),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      RadioExample(),
                      SizedBox(height: 5.0),
                      Text(
                        'INCLUDE',
                        style: TextStyle(
                          color: Color(0x0ff8b86ae),
                          fontSize: 20.0,
                        ),
                      ),
                      CheckBoxI(),
                      SizedBox(height: 80.0),
                      Container(
                        width: 400.0,
                        decoration: BoxDecoration(
                          color: Color(0xffffbc58),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Save changes ',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  Choices? _choice = Choices.choice1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Transform.scale(
              scale: 2,
              child: Radio<Choices>(
                value: Choices.choice1,
                groupValue: _choice,
                activeColor: Colors.white70,
                onChanged: (Choices? value) {
                  setState(() {
                    _choice = value;
                  });
                },
              ),
            ),
            SizedBox(width: 15),
            Text(
              'All jobs',
              style: TextStyle(color: Color(0x0ff8b86ae), fontSize: 20.0),
            ),
          ],
        ),
        Row(
          children: [
            Transform.scale(
              scale: 2,
              child: Radio<Choices>(
                value: Choices.choice2,
                groupValue: _choice,
                activeColor: Colors.white70,
                onChanged: (Choices? value) {
                  setState(() {
                    _choice = value;
                  });
                },
              ),
            ),
            SizedBox(width: 15),
            Text(
              'Active job posts',
              style: TextStyle(color: Color(0x0ff8b86ae), fontSize: 20.0),
            ),
          ],
        ),
        Row(
          children: [
            Transform.scale(
              scale: 2,
              child: Radio<Choices>(
                value: Choices.choice3,
                groupValue: _choice,
                activeColor: Colors.white70,
                onChanged: (Choices? value) {
                  setState(() {
                    _choice = value;
                  });
                },
              ),
            ),
            SizedBox(width: 15),
            Text(
              'All active job posts',
              style: TextStyle(color: Color(0x0ff8b86ae), fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}

class CheckBoxI extends StatefulWidget {
  const CheckBoxI({super.key});

  @override
  State<CheckBoxI> createState() => _CheckBoxIState();
}

class _CheckBoxIState extends State<CheckBoxI> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          'Jobs shared with me',
          style: TextStyle(color: Color(0x0ff8b86ae), fontSize: 20.0),
        ),
      ],
    );
  }
}
