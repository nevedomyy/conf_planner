import 'package:flutter/material.dart';
import 'behavior.dart';

class PrayersItem extends StatefulWidget{
  final String _title;
  PrayersItem(this._title);
  @override
  _PrayersItem createState() => _PrayersItem(_title);
}

class _PrayersItem extends State<PrayersItem> with TickerProviderStateMixin{
  final String _title;
  AnimationController _controller;
  Animation<double> _animation;
  double _screenWidth = 0;

  _PrayersItem(this._title);

  @override
  initState(){
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250)
    )..addListener((){setState((){});});
    _animation = Tween(
      begin: 0.0,
      end: 200.0
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn
    ));
  }

  @override
  dispose(){
    super.dispose();
    _controller.dispose();
  }

  Widget _txt(){
    String text = '';
    switch(_title){
      case 'Prayer for Repentance': text = 'O Lord, God and Savior Jesus Christ, treasure of mercy and source of salvation, I come to You confessing my sins. I confess that I insolently dared to defile Your holy sanctuary with my sins. Now I seek Your mercy and lovingkindness, for Your mercies are countless and You never turn back a sinner who comes to You.\n\nI confess that my mind is burdened with sin and I have no strength left. Do not turn away from me in Your anger nor punish me in Your wrath. I am worn out, have compassion upon me, O Lord, and judge me not in Your justice, but according to Your mercy.\n\nRemember Your creation, O God, do not put me on trial for none of Your servants can justify his deeds. Dress me in a new attire that befits Your glory. Forgive my sins and I shall sing saying:\n\nBlessed is he whose sins are forgiven.” When I confess my sins, and reveal my iniquities, You cleanse me.\n\nAmen.'; break;
      case 'Prayer Before Confession': text = 'O holy Father, who longs to the sinners return, who promised to accept those who repent, look at a soul that was long lost in the valleys of disobedience.\n\nI have long tasted the bitterness of misery, being away from the source of salvation.\n\nNow I come back to You to be purified, accept me and do not reject me, for when You look at me with mercy and compassion, I will be cleansed and saved but if You turn away from me I will perish.\n\nGrant me, O Lord, Your blessings to strengthen my will to come closer to You in faith and hope, to confess my sins and detest returning to them.\n\nLet Your Holy Spirit remind me not to stray. Enlighten my heart, O God, so that I can see the graveness of my sins and negligence, and have the will to obey Your commandments and live.\n\nFor the glory of Your holy name. Amen.'; break;
      case 'Prayer After Confession': text = 'O Father, I am grateful for Your goodness, and love of mankind. You did not wish that I perish, but awakened me from my sleep and guided me to Your way.\n\nYou saved me from the valley of death to the protection of Your strong fortress.\n\nFill me with hope and faith, I come to You like the sick wishing to be healed, like the hungry seeking to be filled, like the poor to the source of riches and the sinner to the redeemer, and like the dying to the origin of life.\n\nYou are my salvation, my health my life and my strength, with You I find consolation, happiness and comfort. Help me, protect me and surround me with Your goodness, teach me to put my will in Your hands and live according to Your will.\n\nRemove my weakness so that I may be firm and honest to You to the end.\n\nAmen.'; break;
      case 'Psalm 50': text = 'Have mercy upon me, O God, according to Your great mercy; and according to the multitude of Your compassions blot out my iniquity. Wash me thoroughly from my iniquity, and cleanse me from my sin. For I am conscious of my iniquity; and my sin is at all times before me.\n\nAgainst You only I have sinned, and done evil before You: that You might be just in Your sayings, and might overcome when You are judged. For, behold, I was conceived in iniquities, and in sins my mother conceived me.\n\nFor, behold, You have loved the truth: You have manifested to me the hidden and unrevealed things of Your wisdom. You shall sprinkle me with Your hyssop, and I shall be purified: You shall wash me, and I shall be made whiter than snow. You shall make me to hear gladness and joy: the humbled bones shall rejoice.\n\nTurn away Your face from my sins, and blot out all my iniquities. Create in me a clean heart, O God; and renew a right spirit in my inward parts. Do not cast me away from Your face; and do not remove Your Holy Spirit from me. Give me the joy of Your salvation: and uphold me with a directing spirit. Then I shall teach the transgressors Your ways; and the ungodly men shall turn to You.\n\nDeliver me from blood, O God, the God of my salvation: and my tongue shall rejoice in Your righteousness. O Lord, You shall open my lips; and my mouth shall declare Your praise. For if You desired sacrifice, I would have given it: You do not take pleasure in burnt offerings. The sacrifice of God is a broken spirit: a broken and humbled heart God shall not despise.\n\nDo good, O Lord, in Your good pleasure to Zion; and let the walls of Jerusalem be built. Then You shall be pleased with sacrifices of righteousness, offering, and burnt sacrifices: then they shall offer calves upon Your altar. ALLELUIA.';
    }
    return Text(
      text,
      style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1.0), fontSize: 16.0),
    );
  }

  Widget _items(BuildContext context, String text){
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => PrayersItem(text)
        ));
      },
      title: Text(
        text,
        style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 14.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromRGBO(121, 85, 72, 1.0),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(121, 85, 72, 1.0),
            centerTitle: true,
            title: Text(
              _title,
              style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, 'Prayers');
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: (){
                  if (_controller.status == AnimationStatus.completed )_controller.reverse();
                  else _controller.forward();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(-_animation.value, 0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(23.0),
                  child: ScrollConfiguration(
                    behavior: Behavior(),
                    child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 7.0, bottom: 30.0),
                                child: Text(
                                  _title,
                                  style: TextStyle(color: Color.fromRGBO(78, 53, 43, 1.0), fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            _txt()
                          ],
                        )
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(-_animation.value, 0.0, 0.0),
                child: Transform.translate(
                  offset: Offset(_screenWidth + 1.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.black54))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0,),
                          Divider(),
                          _items(context, 'Prayer for Repentance'),
                          Divider(),
                          _items(context, 'Prayer Before Confession'),
                          Divider(),
                          _items(context, 'Prayer After Confession'),
                          Divider(),
                          _items(context, 'Psalm 50'),
                          Divider(),
                          Expanded(child: Container(),)
                        ],
                      ),
                    ),
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}