import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'Reusable_card.dart';
import 'Contants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

  Gender selectGender;
  int height = 180;
  int weight = 60;
  int age = 20;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reusablecard(
                onPress: (){
                  setState(() {
                    selectGender = Gender.male;
                  });
                },
                colour: selectGender == Gender.male ? kActivecardcolor : kInactiveCardColor,
                cardChild: Iconcontent(icon: FontAwesomeIcons.mars, label: 'MALE',),
              ),
              ),
              Expanded(child: Reusablecard(
                onPress: (){
                  setState(() {
                    selectGender = Gender.female;
                  });
                },
                colour: selectGender == Gender.female ? kActivecardcolor: kInactiveCardColor,
              cardChild: Iconcontent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),
              )),
            ],
          )),
          Expanded(child: Reusablecard(colour: kActivecardcolor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                          style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0,)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });

                    },
                  ),
                )
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reusablecard(
                  colour: kActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',
                    style: kLabelTextStyle,
                    ),
                  Text(
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                        onPressed: () {
                            setState(() {
                              weight++;
                            });
                        },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              Expanded(child: Reusablecard(colour: kActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('AGE', style: kLabelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                        setState(() {
                          age--;
                        });
                      },),
                      SizedBox(width: 10.0,),
                      RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                        setState(() {
                          age++;
                        });
                      },)
                    ],
                  )
                ],
              ),
              ),),
            ],
          )),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerheight,
          )
        ],
      )
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,

      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

