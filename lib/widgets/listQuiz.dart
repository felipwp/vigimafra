import 'package:vigimafra/models/question.dart';
import 'package:flutter/material.dart';

class ListQuiz extends StatelessWidget {
  Question question;
  VoidCallback onTapItem;
  ListQuiz({
    @required this.question,
    this.onTapItem,  
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapItem,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromARGB(255,16,29,50),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(right: 15),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person,
                          color: Color.fromARGB(255,152,255,152)
                        )
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bairro: "${question.bairro}"',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255,16,29,50),
                          ),
                        ),
                        Text(
                          '${question.sexo}, ${question.idade} anos',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255,16,29,50),
                          ),
                        ),

                      ],
                    )
                    
                  ],
                ),
              ),
            ),
          ],            
        ),
      ), 
    );
  }
}