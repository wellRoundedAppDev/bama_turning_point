import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text("Merna ali",style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Color(0xff313846),fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
              Row(
                children: [
                  Icon(Icons.star_outline_sharp,color: Colors.black,size: 16,),
                  Icon(Icons.star_outline_sharp,color: Colors.black,size: 16,),
                  Icon(Icons.star_outline_sharp,color: Colors.black,size: 16,),
                  Icon(Icons.star_outline_sharp,color: Colors.black,size: 16,),
                  Icon(Icons.star_outline_sharp,color: Colors.black,size: 16,),

                ],),

            ],),
            Text("30/2/2022",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff313846)),),

          ],),
        SizedBox(height: 8,),
        Text("great and pretty",style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Color(0xff626670)),)
      ],
    );
  }
}
