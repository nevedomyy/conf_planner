import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'confession.db');
    await deleteDatabase(path);
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
            'CREATE TABLE planner(id INTEGER PRIMARY KEY, Description TEXT, Output TEXT, Category TEXT, RelatedTo TEXT, Summary TEXT, Violating TEXT)');
        });
    await database.rawInsert(
          'INSERT INTO planner(Description, Output, Category, RelatedTo, Summary, Violating) VALUES'
			      '("Have you.... laughed or talked in church", "I have.... laughed or talked in church.", "Sins Against God", "Holiness in Church", "Respecting the Church", "You shall not take the name of the Lord your God in vain."),'
            '("Have you.... tried to pay reverent attention to the readings, hymns, and prayers in church?", "I have not.... tried to pay reverent attention to the readings, hymns, and prayers in church.", "Sins Against God", "Holiness in Church", "Distracted in Church", "You shall not take the name of the Lord your God in vain."),'
            '("Have you.... Attended the liturgies every Sunday from the beginning?", "I have not.... attended the liturgies every Sunday.", "Sins Against God", "Holiness in Church", "Not fearing partaking of the Body & Blood", "Keep the Sabbath day holy."),'
            '("Have you.... Took Communion even though you came late to the liturgy? copy", "I have....tooken Communion even though I came late to the liturgy.", "Sins Against God", "Holiness in Church", "Took communion even though I came late", "Keep the Sabbath day holy."),'
            '("Have you.... prayed in the morning and evening, before and after meals?", "I have not.... prayed in the morning and evening, before and after meals.", "Sins Against God", "Prayer & Fasting", "Lack of prayer", "Keep the Sabbath day holy."),'
            '("Have you.... during prayer have you allowed your thoughts to wander? Rushed my prayers? Day dreamed?", "I have not.... focused in my prayers, and I have rushed my prayers.", "Sins Against God", "Prayer & Fasting", "Unfocused prayer", "You shall have no other gods before Me."),'
            '("Have you.... read the Scriptures daily? Do you read other spiritual writings regularly?", "I have not.... read the scriptures daily, or read other spiritual writings regularly.", "Sins Against God", "Prayer & Fasting", "Lack of spiritual reflection", "You shall have no other gods before Me."),'
            '("Have you.... kept the fasts? Such as fasting on Wednesday and Fridays?", "I have not.... kept the fasts, such as fasting on Wednesday and Fridays.", "Sins Against God", "Prayer & Fasting", "Kept the fasts	", "You shall have no other gods before Me."),'
            '("Have you.... prepared for the services beforehand?", "I have not.... prepared for the services beforehand.", "Sins Against God", "Prayer & Fasting", "Unprepared for church", "Keep the Sabbath day holy."),'
            '("Have you.... remembered God in all aspects of life?", "I have not.... remembered God in all aspects of life.", "Sins Against God", "Relationship with God", "Not remembering God", "You shall have no other gods before Me."),'
            '("Have you.... given thanks to the Lord for all things?", "I have not.... given thanks to the Lord for all things.", "Sins Against God", "Relationship with God", "Not thankful", "You shall have no other gods before Me."),'
            '("Have you.... strong faith in God and the intercessions of the Saints", "I have not.... been strong faithed in God and the saints.", "Sins Against God", "Relationship with God", "Lack of faith", "You shall have no other gods before Me."),'
            '("Have you.... loved and feared the Lord always? ", "I have not.... loved and feared the Lord always.", "Sins Against God", "Relationship with God", "Love & Fear God always", "You shall have no other gods before Me."),'
            '("Have you.... Complained against God in the problems, afflictions, sicknesses, and trials of your life", "I have.... complained against God in the problems, afflictions, sicknesses, and trials of my life.", "Sins Against God", "Relationship with God", "Complained against God", "You shall have no other gods before Me."),'
            '("Have you.... relied completely on yourself rather than God? Asked Gods help before starting every activity?", "I have .... relied completely on myself rather than God, and have not asked God\'s help before starting every activity.", "Sins Against God", "Relationship with God", "Relied on myself not God", "You shall have no other gods before Me."),'
            '("Have you.... respected everyone? Including, love and respect in-laws?", "I have not.... respected everyone including, love and respect in-laws.", "Sins Against Your Neighbors", "Condemning People", "Respect", "You shall not bear false witness against your neighbor."),'
            '("Have you.... insulted anyone? Have you called anyone names? Do you use foul language?", "I have.... insulted someone, called someone names, or used foul language.", "Sins Against Your Neighbors", "Condemning People", "Insulted", "You shall not bear false witness against your neighbor."),'
            '("Have you.... entertained bad feelings, ill will or hatred against anyone? resentment people? Hatred and ill-feelings towards someone who did you wrong or insulted you in their anger?", "I have.... entertained bad feelings, ill will or hatred against someone, or resentment people. Hatred and ill-feelings towards someone who did me wrong or insulted me in their anger.", "Sins Against Your Neighbors", "Condemning People", "Hatred", "You shall not bear false witness against your neighbor."),'
            '("Have you.... gossiped?", "I have.... gossiped.", "Sins Against Your Neighbors", "Condemning People ", "Gossiped", "You shall not bear false witness against your neighbor."),'
            '("Have you.... judged and condemned others? Including Clergy", "I have.... judged and condemned others, including clergy.", "Sins Against Your Neighbors", "Condemning People ", "Judged", "You shall not bear false witness against your neighbor."),'
            '("Have you.... Have you been prejudice towards anyone for any reason? ", "I have.... been prejudice towards someone for any reason.", "Sins Against Your Neighbors", "Condemning People ", "Prejudice", "You shall not bear false witness against your neighbor."),'
            '("Have you.... sent an anonymous or cruel letter to anyone? ", "I have.... sent an anonymous or cruel letter to someone.", "Sins Against Your Neighbors", "Condemning People ", "Anonymous", "You shall not bear false witness against your neighbor."),'
            '("Have you.... hindered my spouse, children, parents, brothers or sisters, or any other person from attending Church?", "I have.... hindered my spouse, children, parents, brothers or sisters, or any other person from attending Church.", "Sins Against Your Neighbors", "Condemning People", "Better parenting", "You shall not bear false witness against your neighbor."),'
            '("Are you.... suspicious and do you without reason suspect that everyone supposedly talks about you, that they don\'t want you, and that they don\'t love or like you?", "I have.... been suspicious and do without reason suspect that everyone supposedly talks about me, that they don\'t want me, and that they don\'t love or like me.", "Sins Against Your Neighbors", "Condemning People", "Suspicious", "You shall not bear false witness against your neighbor."),'
            '("Are you.... jealous and upset over the progress, fortune, possessions and beauty of others? Envied anyone anything?", "I have.... been jealous and upset over the progress, fortune, possessions and beauty of others, envied anyone or anything.", "Sins Against Your Neighbors", "Condemning People", "Jealous", "You shall not bear false witness against your neighbor."),'
            '("Do you.... been inconsiderate of other people\'s feelings? Have mercy and compassion on the poor, on orphans, on the elderly, on families with many children struggling to make ends meet? Are you unmoved by the misfortune and needs of your fellow men? Left the needy without help when you could have helped? Shown kindness and attention to all, remembering that God is expecting just such an attitude from you?", "I have not.... been considerate of other people\'s feelings, had mercy and compassion on the poor, on orphans, on the elderly, on families with many children struggling to make ends meet, been moved by the misfortune and needs of my fellow men, left the needy with help when I could have helped, or shown kindness and attention to all remembering that God is expecting just such an attitude from me.", "Sins Against Your Neighbors", "Condemning People", "Incompassionate", "You shall not bear false witness against your neighbor."),'
            '("Have you.... criticized or slandered anyone, wrongly accusing them?", "I have.... criticized or slandered someone, wrongly accusing them.", "Sins Against Your Neighbors", "Condemning People", "Criticized", "You shall not bear false witness against your neighbor."),'
            '("Have you.... Physically harmed anyone?", "I have.... phsically harmed someone.", "Sins Against Your Neighbors", "Condemning People ", "Abuse", "You shall not bear false witness against your neighbor."),'
            '("Have you.... told untruths? Exaggerated, lied or added or subtracted from the truth? ", "I have.... told untruths, exaggerated, lied or added or subtracted from the truth.", "Sins Against Your Neighbors", "Honesty", "Exaggerated, added, withheld Information", "You shall not steal."),'
            '("Have you.... lied to clergy?", "I have.... lied to clergy.", "Sins Against Your Neighbors", "Honesty", "Lied to people", "You shall not bear false witness against your neighbor."),'
            '("Have you.... lied for self gain?", "I have.... lied for self gain.", "Sins Against Your Neighbors", "Honesty", "Lied for Self Gain ", "You shall not steal."),'
            '("Have you.... deceived people? flattered others in order to get your own way?", "I have.... deceived people, flattered others in order to get my own way.", "Sins Against Your Neighbors", "Honesty", "Deceived people, flattered people", "You shall not bear false witness against your neighbor."),'
            '("Have you.... Forged / Lied the government system", "I have.... forged / lied the government system.", "Sins Against Your Neighbors", "Honesty", "Lied in official documents", "You shall not steal."),'
            '("Have you.... lied for business dealings? In your transactions with your business partners, co-workers, and clients, are you honest and forthright?", ",I have.... lied for business dealings, in my transactions with my business partners, co-workers, and clients,and have not been honest and forthright with them.", "Sins Against Your Neighbors", "Self Gain", "Self Gain lies in business transactions", "You shall not steal."),'
            '("Have you.... Misled people about others.  Slandered anyone wanting to or intending to injure the reputation of another?", "I have.... misled people about others, slandered someone wanting to or intending to injure the reputation of someone else.", "Sins Against Your Neighbors", "Self Gain ", "Self Gain Misled people about others", "You shall not bear false witness against your neighbor."),'
            '("Have you.... given bad ideas or words to people? ", "I have.... given bad ideas or words to people.", "Sins Against Your Neighbors", "Self Gain ", "Self Gain Misled with bad ideas", "You shall not bear false witness against your neighbor."),'
            '("Do you.... keep company with bad and sinful people or associates? ", "I have.... keept company with bad and sinful people or associates. ", "Sins Against Your Neighbors", "Self Gain ", "Self Gain in Bad company", "You shall have no other gods before Me."),'
            '("Have you.... with your words or example, have you ever pushed anyone to sin?", "I have.... with my words or example, have pushed someone to sin.", "Sins Against Your Neighbors", "Self Gain", "Self Gain Misled people to sin", "You shall not bear false witness against your neighbor."),'
            '("Have you.... Misled people for my own gain", "I have.... misled people for my own gain.", "Sins Against Your Neighbors", "Self Gain ", "Self Gain Used people", "You shall not covet."),'
            '("Have you.... always try to have your own way? ", "I have.... tryed to have my own way. ", "Sins Against Yourself", "Character", "Selfish", "You shall not steal."),'
            '("Have you.... been lazy? Have you done your duties heartily?  Wasted too much time,  TV, internet?", "I have.... been lazy, done my duties heartily, wasted too much time on TV and internet.", "Sins Against Yourself", "Character", "Lazy, Wasted time (internet, tv)", "You shall have no other gods before Me."),'
            '("Have you.... Been over-sensitive?", "I have.... been over-sensitive.", "Sins Against Yourself", "Character", "Over sensitive", "You shall make no idols."),'
            '("Is there any other sin, which burdens your conscience, or which you are ashamed to tell?", "I have.... other sins, which burden my conscience, or which I am ashamed to tell.	", "Sins Against Yourself", "Character", "Ashamed", "You shall not covet."),'
            '("Have you.... done sins knowing I will just confess it?", "I have.... done sins knowing I will just confess it.", "Sins Against Yourself", "Character", "Carelessness with sins", "You shall make no idols."),'
            '("Do you have.... humility do you have a spirit of self-denial?", "I don\'t have.... humility, or a spirit of self-denial.", "Sins Against Yourself", "Character", "Not humble", "You shall not covet."),'
            '("Do you have.... Pride! Been proud? Do you boast of your abilities, achievements? Win praise and glory? Have you thought myself better than anybody else?", "I have.... Pride, been proud, boasted of my abilities and achievements, win praise and glory, thought myself better than anybody else.", "Sins Against Yourself	", "Character", "Pride", "You shall not covet."),'
            '("Have you.... hypocritical ", "I have.... been hypocritical. ", "Sins Against Yourself", "Character", "hypocritical ", "You shall not covet."),'
            '("Have you.... sinned in thought, word or deed, by a look or glance, or in any other way against the seventh commandment? (Adultery, fornication, all extra-marital sexual relationships with others, masturbation, engaging in unnatural sexual acts, fantasizing, pornography, etc.)", "I have.... sinned in thought, word or deed, by a look or glance, or in any other way against the seventh commandment. (Adultery, fornication, all extra-marital sexual relationships with others, masturbation, engaging in unnatural sexual acts, fantasizing, pornography, etc.)", "Sins Against Yourself", "Lust", "Lust", "You shall not commit adultery."),'
            '("Have you.... made impure glances? ", "I have.... made impure glances.", "Sins Against Yourself", "Lust", "Lust", "You shall not commit adultery."),'
            '("Are you.... Pure in heart", "I have not.... been pure in heart", "Sins Against Yourself", "Lust", "Lust", "You shall not commit adultery."),'
            '("Have you.... been greedy? ", "I have.... been greedy.", "Sins Against Yourself", "Money", "Greedy", "You shall not steal."),'
            '("Have you.... gambled?", "I have.... gambled.", "Sins Against Yourself", "Money", "Gambling", "You shall not steal."),'
            '("Have you.... wished in your mind that you had more money than you do already? ", "I have.... wished in my mind that I had more money than I do already.", "Sins Against Yourself", "Money", "Money greed", "You shall not covet.")'
    );
    await database.close();
  }

  Future<List<String>> get(int index) async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'confession.db');
    Database database = await openDatabase(path, version: 1);
    var result = await database.rawQuery(
      'SELECT * FROM planner WHERE id = $index'
    );
    await database.close();
    if (result.isNotEmpty) {
      List<String> list = List();
      list.add(result[0]["Description"]);
      list.add(result[0]["Output"]);
      list.add(result[0]["Category"]);
      list.add(result[0]["RelatedTo"]);
      list.add(result[0]["Summary"]);
      list.add(result[0]["Violating"]);
      return list;
    }
    return ['','','','','',''];
  }

  Future<List<List<Widget>>> getList(List<int> list, String column) async{
    List<Widget> list1 = List();
    List<Widget> list2 = List();
    List<Widget> list3 = List();
    List<List<Widget>> listFromDB = [list1, list2, list3];
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'confession.db');
    Database database = await openDatabase(path, version: 1);
    for (int i = 0; i < list.length; i++) {
      var result = await database.rawQuery(
          'SELECT $column FROM planner WHERE id = ${list[i]}'
      );
      if(list[i] < 16) list1.add(_item(result[0][column].toString()));
      if(list[i] > 15 && list[i] < 40) list2.add(_item(result[0][column].toString()));
      if(list[i] > 39) list3.add(_item(result[0][column].toString()));
    }
//    list = list.toSet().toList();
    await database.close();
    return listFromDB;
  }

  Widget _item(String text){
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, left: 20.0, right: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Icon(Icons.fiber_manual_record, color: Color.fromRGBO(38, 153, 251, 1), size: 5.0,),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 12.0),
            ),
          )
        ],
      )
    );
  }
}