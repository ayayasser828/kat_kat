import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';

class DescriptionContent extends StatefulWidget {
  @override
  _DescriptionContentState createState() => _DescriptionContentState();
}

class _DescriptionContentState extends State<DescriptionContent> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('الوصف',style: textA16.copyWith(decoration: TextDecoration.underline),),
          Text('بطاقات بلايستيشن ستور مسبقة الدفع تستخدم لشحن رصيد محفظتك على منصة Playstation ، والحصول على محتوى رقمي قابل للتحميل، وتمكنك ايضا من الاشتراك بعضوية Playstation Plus والحصول على خصومات حصرية لمن يتمتعون بهذه العضوية.',style: textA16.copyWith(fontSize: 15),textDirection: TextDirection.rtl,),
        ],
      ),
    );
  }
}
