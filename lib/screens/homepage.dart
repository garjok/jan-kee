import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TarotCardData {
  final String name;
  final String keyword;
  final String meaning;
  final String summary;
  final IconData icon;
  final Color color;
  final String imageAsset;

  const TarotCardData({
    required this.name,
    required this.keyword,
    required this.meaning,
    required this.summary,
    required this.icon,
    required this.color,
    required this.imageAsset,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const int totalDeckCount = 72;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Map<String, String> _knownArtAssets = {
    'The Fool': 'assets/tarot_cards/the_fool.svg',
    'The Magician': 'assets/tarot_cards/the_magician.svg',
    'The High Priestess': 'assets/tarot_cards/the_moon.svg',
    'The Empress': 'assets/tarot_cards/the_star.svg',
    'The Emperor': 'assets/tarot_cards/the_world.svg',
    'The Hierophant': 'assets/tarot_cards/the_magician.svg',
    'The Lovers': 'assets/tarot_cards/the_lovers.svg',
    'The Chariot': 'assets/tarot_cards/the_chariot.svg',
    'Strength': 'assets/tarot_cards/strength.svg',
    'The Hermit': 'assets/tarot_cards/the_hermit.svg',
    'The Star': 'assets/tarot_cards/the_star.svg',
    'The Moon': 'assets/tarot_cards/the_moon.svg',
    'The Sun': 'assets/tarot_cards/the_sun.svg',
    'The World': 'assets/tarot_cards/the_world.svg',
  };

  static String _cardImageAssetFor(String cardName) =>
      _knownArtAssets[cardName] ?? 'assets/tarot_cards/card_back.svg';

  static const List<TarotCardData> _majorArcana = [
    TarotCardData(
      name: 'The Fool',
      keyword: 'เริ่มต้นใหม่',
      meaning:
          'สัญญาณของการเริ่มต้น การกล้าเปลี่ยนแปลง และความเชื่อมั่นในการก้าวไปข้างหน้า',
      summary:
          'วันนี้เป็นวันที่คุณควรกล้าทำสิ่งที่อยากทำ แม้ยังไม่รู้ว่าผลจะออกแบบไร แต่การเริ่มต้นก็สำคัญกว่าเดิม',
      icon: Icons.flight,
      color: Color(0xFF7C4DFF),
      imageAsset: 'assets/tarot_cards/the_fool.svg',
    ),
    TarotCardData(
      name: 'The Magician',
      keyword: 'พลังแห่งการกระทำ',
      meaning:
          'บ่งชี้ว่าคุณมีศักยภาพและเครื่องมือที่จำเป็นอยู่แล้ว เพียงแค่ใช้มันให้เหมาะสม',
      summary:
          'ดวงวันนี้ชวนให้ลงมือทำอย่างจริงจัง คุณมีความสามารถมากกว่าที่คิด ไม่ต้องรอให้คนอื่นเชื่อก่อน',
      icon: Icons.auto_fix_high,
      color: Color(0xFF00B8D9),
      imageAsset: 'assets/tarot_cards/the_magician.svg',
    ),
    TarotCardData(
      name: 'The High Priestess',
      keyword: 'ความลึกภายใน',
      meaning:
          'ชวนให้คุณฟังสิ่งที่อยู่ภายใน และตัดสินใจด้วยความสงบมากกว่าความรีบร้อน',
      summary:
          'การหยุดพักและฟังความรู้สึกของตัวเอง จะช่วยให้เห็นทางที่แท้จริงมากขึ้น',
      icon: Icons.psychology_rounded,
      color: Color(0xFF8E7CC3),
      imageAsset: 'assets/tarot_cards/the_moon.svg',
    ),
    TarotCardData(
      name: 'The Empress',
      keyword: 'ความอุดมสมบูรณ์',
      meaning:
          'เป็นภาพแห่งการดูแล ความเจริญเติบโต และการสร้างความมั่นคงแบบยั่งยืน',
      summary:
          'ให้ความรักและความเอาใจใส่กับสิ่งที่คุณพัฒนาอยู่ จะส่งผลดีต่ออนาคตของคุณ',
      icon: Icons.eco_rounded,
      color: Color(0xFF9CCC65),
      imageAsset: 'assets/tarot_cards/the_star.svg',
    ),
    TarotCardData(
      name: 'The Emperor',
      keyword: 'ความเป็นระเบียบ',
      meaning:
          'แสดงถึงการควบคุม การมีหลักการ และความมั่นคงที่เกิดจากการมีโครงสร้างที่ชัดเจน',
      summary:
          'ในช่วงนี้การวางแผนและจัดระบบจะช่วยให้คุณก้าวหน้าได้มากกว่าความเร่งรีบ',
      icon: Icons.account_balance_rounded,
      color: Color(0xFFB0BEC5),
      imageAsset: 'assets/tarot_cards/the_world.svg',
    ),
    TarotCardData(
      name: 'The Hierophant',
      keyword: 'คำแนะนำ',
      meaning:
          'ชี้ว่าแนวทางที่ยั่งยืนจะมาจากการเรียนรู้จากผู้มีประสบการณ์และระบบที่มีความหมาย',
      summary:
          'ถ้าคุณต้องการความชัดเจน ให้ยอมรับคำแนะนำที่มีประโยชน์และมีเงื่อนไขที่ดี',
      icon: Icons.school_rounded,
      color: Color(0xFF7E57C2),
      imageAsset: 'assets/tarot_cards/the_magician.svg',
    ),
    TarotCardData(
      name: 'The Lovers',
      keyword: 'ทางเลือก',
      meaning:
          'บอกว่าคุณกำลังอยู่ในจุดที่ต้องตัดสินใจเรื่องสำคัญ และความสัมพันธ์มีผลต่อการตัดสินใจมาก',
      summary:
          'เลือกสิ่งที่ทำให้ใจคุณสบายและตรงกับความจริงของตัวเอง อย่าปล่อยให้คนอื่นกำหนดทางให้คุณมากเกินไป',
      icon: Icons.favorite,
      color: Color(0xFFE91E63),
      imageAsset: 'assets/tarot_cards/the_lovers.svg',
    ),
    TarotCardData(
      name: 'The Chariot',
      keyword: 'ความมุ่งมั่น',
      meaning:
          'การควบคุม ตัวเองและเป้าหมายได้ดีในวันนี้ สะท้อนถึงความอดทนและการขับเคลื่อนเอง',
      summary:
          'วันนี้เป็นวันที่เหมาะกับการเดินหน้าแบบไม่หวั่นไหว ถ้าคุณตั้งใจจริงและไม่สลับเป้าหมายบ่อย คุณจะไปถึงจุดหมายได้',
      icon: Icons.directions_car,
      color: Color(0xFF4CAF50),
      imageAsset: 'assets/tarot_cards/the_chariot.svg',
    ),
    TarotCardData(
      name: 'Strength',
      keyword: 'ความกล้าหาญ',
      meaning:
          'ความอ่อนโยนที่ผสานกับความเข้มแข็งอยู่ด้วยกัน พร้อมยืนหยัดต่อความยากลำบาก',
      summary:
          'คุณอาจไม่จำเป็นต้องโหดเหี้ยม แต่คุณมีความกล้าในแบบของตัวเองที่ทำให้คนรอบข้างไว้ใจได้',
      icon: Icons.shield,
      color: Color(0xFF8BC34A),
      imageAsset: 'assets/tarot_cards/strength.svg',
    ),
    TarotCardData(
      name: 'The Hermit',
      keyword: 'การสะท้อนตัวเอง',
      meaning: 'ชวนให้หยุดพักและฟังเสียงในใจ ลองค่อย ๆ คิดก่อนตัดสินใจ',
      summary:
          'อาจต้องมีเวลาคิดให้เยอะขึ้นก่อนจะตัดสินใจเรื่องใหญ่ ถ้าคุณให้โอกาสตัวเองได้พัก คุณจะเห็นทางชัดกว่าเดิม',
      icon: Icons.lightbulb,
      color: Color(0xFF607D8B),
      imageAsset: 'assets/tarot_cards/the_hermit.svg',
    ),
    TarotCardData(
      name: 'Wheel of Fortune',
      keyword: 'การเปลี่ยนแปลง',
      meaning:
          'บอกว่าช่วงนี้มีการหมุนของสถานการณ์และโอกาสที่ไม่คาดคิดเข้ามาได้แล้ว',
      summary:
          'อย่าต้านการเปลี่ยนแปลงมากเกินไป ให้ยอมรับมันแล้วใช้เป็นทางลัดสู่สิ่งที่ดีขึ้น',
      icon: Icons.rotate_90_degrees_ccw_rounded,
      color: Color(0xFFF9A825),
      imageAsset: 'assets/tarot_cards/the_star.svg',
    ),
    TarotCardData(
      name: 'Justice',
      keyword: 'ความยุติธรรม',
      meaning:
          'สัญญาณว่าความจริงและความสมดุลกำลังได้รับการยกย่องและต้องใช้ความตรงไปตรงมา',
      summary:
          'ถ้าคุณต้องการชนะในใจทั้งหลาย ให้ยืนบนความจริงและทำด้วยความเที่ยงธรรม',
      icon: Icons.balance_rounded,
      color: Color(0xFF81D4FA),
      imageAsset: 'assets/tarot_cards/the_moon.svg',
    ),
    TarotCardData(
      name: 'The Hanged Man',
      keyword: 'การพักเพื่อเห็น',
      meaning:
          'ย้ำว่าการหยุดและเปลี่ยนมุมมองอาจเปิดทางใหม่ที่คุณไม่เคยเห็นมาก่อน',
      summary:
          'เขยิบความเร็วให้ช้าลงและลองมองสิ่งที่คุณเคยมองข้าม ดวงกำลังบอกว่าคุณควรรอฟัง',
      icon: Icons.pause_circle_outline_rounded,
      color: Color(0xFF7E57C2),
      imageAsset: 'assets/tarot_cards/the_moon.svg',
    ),
    TarotCardData(
      name: 'Death',
      keyword: 'การสิ้นสุดและเริ่มใหม่',
      meaning:
          'ไม่ใช่เรื่องร้ายเสมอไป แต่แปลว่าอะไรที่ไม่เหมาะสมกำลังอำพรางไล่ไปแล้ว',
      summary:
          'ให้ตัวเองปล่อยวางสิ่งที่สายเกินไป เพื่อเปิดทางให้สิ่งใหม่เข้ามาแทนที่',
      icon: Icons.auto_fix_off_rounded,
      color: Color(0xFF37474F),
      imageAsset: 'assets/tarot_cards/the_world.svg',
    ),
    TarotCardData(
      name: 'Temperance',
      keyword: 'สมดุล',
      meaning:
          'บอกว่าความเข้มแข็งที่แท้จริงมักมาพร้อมกับความยับยั้งชั่งใจและการผสมผสานที่ดี',
      summary:
          'หากมีหลายสิ่งพร้อมกัน ให้ผสานสิ่งที่ควบคุมได้แล้วคุณจะพบความเป็นธรรมชาติ',
      icon: Icons.opacity_rounded,
      color: Color(0xFF4DD0E1),
      imageAsset: 'assets/tarot_cards/the_star.svg',
    ),
    TarotCardData(
      name: 'The Devil',
      keyword: 'การผูกติด',
      meaning:
          'สะท้อนถึงสิ่งที่ยึดติดหรือกักขังคุณไว้ ไม่จำเป็นต้องเป็นภาระที่ชัดเจนเสมอไป',
      summary:
          'ถ้าคุณรู้สึกติดกับเรื่องที่ควบคุมไม่ได้ ให้ปล่อยและกลับมามองความจริงอีกครั้ง',
      icon: Icons.lock_rounded,
      color: Color(0xFF8E24AA),
      imageAsset: 'assets/tarot_cards/the_moon.svg',
    ),
    TarotCardData(
      name: 'The Tower',
      keyword: 'การระเบิดของสภาพ',
      meaning:
          'การเปลี่ยนแปลงที่รุนแรงอาจกระทบทุกสิ่ง แต่เขาคือการเปิดทางให้สิ่งใหม่เกิดขึ้น',
      summary:
          'อย่าหวาดกลัวกับความวุ่นวาย เพราะมันอาจเป็นค่าใช้จ่ายที่ต้องจ่ายเพื่อก้าวไปข้างหน้า',
      icon: Icons.flash_on_rounded,
      color: Color(0xFFE53935),
      imageAsset: 'assets/tarot_cards/the_sun.svg',
    ),
    TarotCardData(
      name: 'The Star',
      keyword: 'ความหวัง',
      meaning: 'สะท้อนถึงความหวัง ความสงบ และการฟื้นคืนของแรงบันดาลใจ',
      summary:
          'แม้ช่วงนี้อาจเหนื่อย ลองเชื่อว่ามีแสงสว่างรออยู่เสมอ และสิ่งดี ๆ กำลังเข้ามาให้คุณ',
      icon: Icons.star,
      color: Color(0xFFFFC107),
      imageAsset: 'assets/tarot_cards/the_star.svg',
    ),
    TarotCardData(
      name: 'The Moon',
      keyword: 'ความไม่แน่ใจ',
      meaning:
          'ช่วงเวลาที่มีความสับสนและความรู้สึกไม่ชัดเจน แต่บางครั้งมันคือสัญญาณว่าคุณกำลังค้นหาความจริง',
      summary:
          'อย่าให้ความไม่แน่ใจทำให้คุณตัดสินใจเร็วเกินไป ให้รอจนสิ่งที่ชัดเจนปรากฏก่อนเสมอ',
      icon: Icons.nightlight_round,
      color: Color(0xFF3F51B5),
      imageAsset: 'assets/tarot_cards/the_moon.svg',
    ),
    TarotCardData(
      name: 'The Sun',
      keyword: 'ความชัดเจน',
      meaning: 'เป็นสัญญาณของความสุข ความสำเร็จ และความเข้าใจที่เข้มแข็งขึ้น',
      summary:
          'วันนี้เหมาะกับการยืนอยู่บนความจริงของตัวเอง และรับความสำเร็จที่คุณพยายามทำมาด้วยความขยัน',
      icon: Icons.wb_sunny,
      color: Color(0xFFFFA000),
      imageAsset: 'assets/tarot_cards/the_sun.svg',
    ),
    TarotCardData(
      name: 'Judgement',
      keyword: 'การตื่นรู้',
      meaning:
          'บอกว่าคุณกำลังตื่นรู้ถึงสิ่งที่เคยหลีกเลี่ยง และพร้อมจะยอมรับบทใหม่',
      summary:
          'อาจถึงเวลาที่คุณจะเรียกตัวเองกลับมาและตัดสินใจด้วยความตรงไปตรงมา',
      icon: Icons.speaker_group_rounded,
      color: Color(0xFFB39DDB),
      imageAsset: 'assets/tarot_cards/the_star.svg',
    ),
    TarotCardData(
      name: 'The World',
      keyword: 'ความสำเร็จ',
      meaning:
          'ตราบใดที่คุณทำสิ่งที่ถูกต้องอย่างสม่ำเสมอ ความสำเร็จกำลังใกล้เข้ามา',
      summary:
          'วันนี้คือสัญญาณว่าคุณใกล้บรรลุสิ่งที่เฝ้าค้นหาแล้ว ให้ยิ้มและขอบคุณคนที่ช่วยให้คุณมาถึงตรงนี้',
      icon: Icons.emoji_events,
      color: Color(0xFFFF9800),
      imageAsset: 'assets/tarot_cards/the_world.svg',
    ),
  ];

  static List<TarotCardData> _buildMinorArcana() {
    final suits = [
      {
        'name': 'Cups',
        'keyword': 'ความรู้สึก',
        'meaning': 'ความรัก ความผูกพัน และการรับรู้ทางอารมณ์',
        'icon': Icons.favorite_rounded,
        'color': Color(0xFFE66DAA),
      },
      {
        'name': 'Swords',
        'keyword': 'ความคิด',
        'meaning': 'ปัญหา ความกลัว และการตัดสินใจด้วยเหตุผล',
        'icon': Icons.flash_on_rounded,
        'color': Color(0xFF7ACDFF),
      },
      {
        'name': 'Wands',
        'keyword': 'แรงบันดาลใจ',
        'meaning': 'ความตั้งใจ การเริ่มต้น และการเคลื่อนไหวเพื่อเป้าหมาย',
        'icon': Icons.auto_awesome_rounded,
        'color': Color(0xFFB58BFF),
      },
      {
        'name': 'Pentacles',
        'keyword': 'ความมั่นคง',
        'meaning': 'ผลลัพธ์ทางกายภาพ เงินทอง และการพัฒนาแบบยั่งยืน',
        'icon': Icons.workspace_premium_rounded,
        'color': Color(0xFF7EE0A1),
      },
    ];

    final ranks = [
      {
        'name': 'Ace',
        'keyword': 'เริ่มต้น',
        'meaning': 'การเริ่มต้นที่มีศักยภาพและความหวัง'
      },
      {
        'name': 'Two',
        'keyword': 'เลือกทาง',
        'meaning': 'การเลือกและการประสานแนวทางที่ถูกต้อง'
      },
      {
        'name': 'Three',
        'keyword': 'เติบโต',
        'meaning': 'การพัฒนาและการสร้างความร่วมมือ'
      },
      {
        'name': 'Four',
        'keyword': 'ความมั่นคง',
        'meaning': 'ความปลอดภัยและการสร้างระบบที่ยั่งยืน'
      },
      {
        'name': 'Five',
        'keyword': 'ความท้าทาย',
        'meaning': 'ความกดดันที่ต้องผ่านไปเพื่อเห็นผลดี'
      },
      {
        'name': 'Six',
        'keyword': 'สมดุล',
        'meaning': 'ช่วงเวลาที่ต้องอุ่นใจและยอมรับความเปลี่ยนแปลง'
      },
      {
        'name': 'Seven',
        'keyword': 'ทดสอบ',
        'meaning': 'การคัดกรองและการเรียนรู้จากประสบการณ์'
      },
      {
        'name': 'Eight',
        'keyword': 'เคลื่อนไหว',
        'meaning': 'การค่อย ๆ ก้าวไปอย่างมีทิศทางและการสานต่อ'
      },
      {
        'name': 'Nine',
        'keyword': 'บรรลุผล',
        'meaning': 'ช่วงที่ความพยายามเริ่มเห็นผลชัดเจน'
      },
      {
        'name': 'Ten',
        'keyword': 'สิ้นสุด',
        'meaning': 'การปิดบทและก้าวสู่บทใหม่ด้วยความรู้'
      },
      {
        'name': 'Page',
        'keyword': 'ข้อมูล',
        'meaning': 'ข่าวสารหรือแรงบันดาลใจใหม่ที่กำลังเข้ามา'
      },
      {
        'name': 'Knight',
        'keyword': 'การเคลื่อนไหว',
        'meaning': 'พลังที่ผลักดันให้ตัดสินใจและก้าวไปข้างหน้า'
      },
      {
        'name': 'Queen',
        'keyword': 'ความเข้าใจ',
        'meaning': 'ความอ่อนโยนแต่มีความชำนาญและการรับรู้ลึก'
      },
      {
        'name': 'King',
        'keyword': 'ความเป็นผู้นำ',
        'meaning': 'ความรับผิดชอบและความมั่นใจแบบยั่งยืน'
      },
    ];

    final cards = <TarotCardData>[];

    for (final suit in suits) {
      for (final rank in ranks) {
        final suitName = suit['name'] as String;
        final suitKeyword = suit['keyword'] as String;
        final suitMeaning = suit['meaning'] as String;
        final suitIcon = suit['icon'] as IconData;
        final suitColor = suit['color'] as Color;

        cards.add(
          TarotCardData(
            name: '${rank['name']} of $suitName',
            keyword: rank['keyword'] as String,
            meaning: '$suitMeaning • ${rank['meaning']} ',
            summary:
                'ไพ่ใบนี้สะท้อนถึง $suitKeyword ในมิติของ ${rank['keyword']} และชี้ว่า คุณกำลังอยู่ในช่วงที่ต้องรับรู้และจัดการกับมันอย่างมีสติ',
            icon: suitIcon,
            color: suitColor,
            imageAsset: _cardImageAssetFor('${rank['name']} of $suitName'),
          ),
        );
      }
    }

    return cards;
  }

  static final List<TarotCardData> _fullDeck = () {
    final major = List<TarotCardData>.from(_majorArcana);
    final minor = _buildMinorArcana();
    final combined = <TarotCardData>[...major, ...minor];
    final unique = <TarotCardData>[];
    final seen = <String>{};

    for (final card in combined) {
      if (seen.add(card.name)) {
        unique.add(card);
      }
    }

    return unique.take(HomePage.totalDeckCount).toList();
  }();

  List<TarotCardData> _drawnCards = [];
  TarotCardData? _selectedCard;
  DateTime? _birthDate;
  bool _soundOn = true;
  bool _isShuffling = false;
  List<TarotCardData> _availableCards = [];
  List<TarotCardData> _manualSelection = [];
  final Random _random = Random();

  static const Map<String, List<String>> _zodiacCardBias = {
    'เมษ': ['The Fool', 'The Chariot', 'The Sun', 'Strength', 'The Magician'],
    'พฤษภ': ['The Magician', 'The Hermit', 'The Star', 'The Sun', 'The Lovers'],
    'เมถุน': ['The Lovers', 'The Star', 'The Moon', 'The Fool', 'The World'],
    'กรกฎ': ['The Chariot', 'Strength', 'The World', 'The Magician', 'The Sun'],
    'สิงห์': ['The Sun', 'The Star', 'The Lovers', 'The World', 'The Fool'],
    'กันย์': [
      'The Hermit',
      'The Magician',
      'The Moon',
      'The World',
      'The Lovers'
    ],
    'ตุลย์': ['The Moon', 'The Hermit', 'The World', 'The Star', 'Strength'],
    'พิจิก': ['The Magician', 'The Chariot', 'Strength', 'The Sun', 'The Fool'],
    'ธนู': ['The World', 'The Star', 'The Fool', 'The Lovers', 'The Chariot'],
    'มังกร': [
      'The Sun',
      'The World',
      'The Chariot',
      'Strength',
      'The Magician'
    ],
    'กุมภ์': [
      'The Hermit',
      'The Magician',
      'The World',
      'The Moon',
      'The Lovers'
    ],
    'มีน': ['The Moon', 'The Lovers', 'The Star', 'The Fool', 'The Hermit'],
  };

  static const Map<String, Map<String, dynamic>> _zodiacProfiles = {
    'เมษ': {
      'thai': 'เมษ',
      'english': 'Aries',
      'color': Color(0xFFFF7A59),
      'icon': Icons.local_fire_department_rounded,
      'trait': 'กล้าตัดสินใจและชอบเริ่มสิ่งใหม่',
      'tag': 'ผู้ริเริ่ม',
    },
    'พฤษภ': {
      'thai': 'พฤษภ',
      'english': 'Taurus',
      'color': Color(0xFF7C9CFF),
      'icon': Icons.eco_rounded,
      'trait': 'มั่นคง มองเห็นความคุ้มค่า และชอบความอุ่นใจ',
      'tag': 'ผู้สร้างความมั่นคง',
    },
    'เมถุน': {
      'thai': 'เมถุน',
      'english': 'Gemini',
      'color': Color(0xFFEC6AAE),
      'icon': Icons.favorite_rounded,
      'trait': 'คมคาย สื่อสารดี และชอบเปิดประสบการณ์ใหม่',
      'tag': 'ผู้เชื่อมสัมพันธ์',
    },
    'กรกฎ': {
      'thai': 'กรกฎ',
      'english': 'Cancer',
      'color': Color(0xFF5FD1A5),
      'icon': Icons.trending_up_rounded,
      'trait': 'อ่อนโยนแต่มีความหยั่งรู้ และรักครอบครัว',
      'tag': 'ผู้ปกป้อง',
    },
    'สิงห์': {
      'thai': 'สิงห์',
      'english': 'Leo',
      'color': Color(0xFFFFC857),
      'icon': Icons.wb_sunny_rounded,
      'trait': 'มีความมั่นใจและชอบเป็นศูนย์กลาง',
      'tag': 'ผู้เพลิดเพลิน',
    },
    'กันย์': {
      'thai': 'กันย์',
      'english': 'Virgo',
      'color': Color(0xFF7ED6D3),
      'icon': Icons.psychology_rounded,
      'trait': 'ละเอียด รอบคอบ และชอบความเป็นระเบียบ',
      'tag': 'ผู้วางแผน',
    },
    'ตุลย์': {
      'thai': 'ตุลย์',
      'english': 'Libra',
      'color': Color(0xFFB89AF7),
      'icon': Icons.nightlight_rounded,
      'trait': 'ชอบความสมดุล การสานสัมพันธ์ และความสวยงาม',
      'tag': 'ผู้สร้างสมดุล',
    },
    'พิจิก': {
      'thai': 'พิจิก',
      'english': 'Scorpio',
      'color': Color(0xFF69D2FF),
      'icon': Icons.flash_on_rounded,
      'trait': 'ลึก มีพลัง และมักมีความตั้งใจที่แรงมาก',
      'tag': 'ผู้เปลี่ยนแปลง',
    },
    'ธนู': {
      'thai': 'ธนู',
      'english': 'Sagittarius',
      'color': Color(0xFFB8E986),
      'icon': Icons.explore_rounded,
      'trait': 'เปิดกว้าง มองโลกในมุมกว้าง และชอบอิสระ',
      'tag': 'ผู้ค้นหา',
    },
    'มังกร': {
      'thai': 'มังกร',
      'english': 'Capricorn',
      'color': Color(0xFFE7B15E),
      'icon': Icons.workspace_premium_rounded,
      'trait': 'จริงจัง มีวินัย และมักบรรลุเป้าหมาย',
      'tag': 'ผู้พิชิต',
    },
    'กุมภ์': {
      'thai': 'กุมภ์',
      'english': 'Aquarius',
      'color': Color(0xFF7BC7FF),
      'icon': Icons.account_balance_wallet_rounded,
      'trait': 'คิดนอกกรอบ และมักเป็นคนที่สร้างแรงบันดาลใจ',
      'tag': 'ผู้สร้างแนวคิด',
    },
    'มีน': {
      'thai': 'มีน',
      'english': 'Pisces',
      'color': Color(0xFF7FE0C8),
      'icon': Icons.water_drop_rounded,
      'trait': 'อ่อนไหว มีจินตนาการ และชอบการเชื่อมใจ',
      'tag': 'ผู้รับรู้',
    },
  };

  Color _zodiacColor(String sign) {
    return _zodiacProfiles[sign]?['color'] as Color? ?? const Color(0xFFFFD166);
  }

  IconData _zodiacIcon(String sign) {
    return _zodiacProfiles[sign]?['icon'] as IconData? ?? Icons.star_rounded;
  }

  String get _zodiacFullName {
    final profile = _zodiacProfiles[_zodiacSign];
    if (profile == null) return _zodiacSign;
    return '${profile['thai']} • ${profile['english']}';
  }

  @override
  void initState() {
    super.initState();
    _drawNewCards();
  }

  String get _zodiacSign {
    if (_birthDate == null) return 'ราศรีที่คุณเลือก';

    final month = _birthDate!.month;
    final day = _birthDate!.day;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'เมษ';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'พฤษภ';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'เมถุน';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'กรกฎ';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'สิงห์';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'กันย์';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'ตุลย์';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return 'พิจิก';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) return 'ธนู';
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) return 'มังกร';
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) return 'กุมภ์';
    return 'มีน';
  }

  String get _zodiacTrait {
    switch (_zodiacSign) {
      case 'เมษ':
        return 'มีพลังความกล้าทำและชอบก้าวทันที';
      case 'พฤษภ':
        return 'วิเคราะห์ก่อนลงมือและมีความรอบคอบ';
      case 'เมถุน':
        return 'เปิดใจและชอบสานสัมพันธ์';
      case 'กรกฎ':
        return 'มุ่งมั่นและไม่ยอมถอย';
      case 'สิงห์':
        return 'ชอบโดดเด่นและต้องการการยอมรับ';
      case 'กันย์':
        return 'รอบรู้และมีความละเอียด';
      case 'ตุลย์':
        return 'มีความลึกซึ้งและค่อย ๆ ก้าว';
      case 'พิจิก':
        return 'กล้าคิด กล้าลอง และต้องการผลลัพธ์';
      case 'ธนู':
        return 'ชอบเสรีและมองเห็นอนาคต';
      case 'มังกร':
        return 'มีความเด็ดเดี่ยวและมีเสน่ห์';
      case 'กุมภ์':
        return 'คิดวิเคราะห์และมักควบคุมได้ดี';
      default:
        return 'อ่อนโยนและแสวงหา harmony';
    }
  }

  String get _readingSummary {
    if (_drawnCards.isEmpty) return '...';

    final first = _drawnCards[0];
    final second = _drawnCards[1];
    final third = _drawnCards[2];

    final zodiacLine = _birthDate == null
        ? 'ราศรีของคุณยังไม่ได้ระบุ'
        : 'ด้วยราศรี$_zodiacSign คุณมีลักษณะ $_zodiacTrait';

    return 'การอ่าน 3 ใบนี้สะท้อนว่า $firstName และ $secondName จะช่วยชี้ทางให้คุณจัดการกับ $thirdName ได้อย่างมีสติและมั่นใจมากขึ้น $zodiacLine';
  }

  String get _zodiacSummary {
    if (_birthDate == null) {
      return 'เลือกวันเกิดเพื่อดูสรุปไพ่ตามราศรีแบบโหราศาสตร์';
    }

    final sign = _zodiacSign;
    final cardNames = _drawnCards.map((card) => card.name).join(', ');

    return 'ราศรี$sign ให้แนวทางว่า $cardNames จะสะท้อนความต้องการของคุณในเรื่องความมั่นใจ ความสัมพันธ์ และการตัดสินใจแบบชัดเจน โดยเฉพาะในช่วงที่คุณต้องกล้าทำสิ่งที่ชอบและปล่อยวางสิ่งที่รบกวนใจ';
  }

  String get _dailyAstroReading {
    if (_birthDate == null) {
      return 'เลือกวันเกิดก่อนแล้วคุณจะได้สรุปดวงรายวันแบบตรงเป้าหมายมากขึ้น';
    }

    final sign = _zodiacSign;
    final primary =
        _drawnCards.isNotEmpty ? _drawnCards.first.name : 'The Fool';

    return 'รายวันสำหรับราศรี$sign: โอกาสในเรื่องงานและความสัมพันธ์กำลังเคลื่อนไหวดีขึ้น ถ้าให้ความสำคัญกับ $primary และอย่ากลัวความเปลี่ยนแปลง คุณจะเห็นทางที่ชัดเจนภายใน 24 ชั่วโมง';
  }

  String get _weeklyAstroReading {
    if (_birthDate == null) {
      return 'เลือกวันเกิดเพื่อดูแนวโน้มรายสัปดาห์แบบโหราศาสตร์';
    }

    final sign = _zodiacSign;
    final secondary = _drawnCards.length > 1 ? _drawnCards[1].name : 'The Star';

    return 'รายสัปดาห์สำหรับราศรี$sign: กำลังเข้าสู่ช่วงที่ต้องตัดสินใจและเริ่มทำสิ่งใหม่ โดย $secondary ช่วยบอกว่าคุณควรให้ความสำคัญกับการวางแผนและใช้โอกาสแบบค่อย ๆ แต่มั่นใจ';
  }

  List<TarotCardData> _dedupeCards(List<TarotCardData> cards) {
    final unique = <TarotCardData>[];
    final seenNames = <String>{};

    for (final card in cards) {
      if (seenNames.add(card.name)) {
        unique.add(card);
      }
    }

    return unique;
  }

  List<TarotCardData> _buildDeckForZodiac() {
    final deck = _dedupeCards(_fullDeck);

    if (_birthDate == null) {
      deck.shuffle(_random);
      return deck;
    }

    final bias = _zodiacCardBias[_zodiacSign] ?? [];
    final priority = {for (var i = 0; i < bias.length; i++) bias[i]: i};

    deck.sort((a, b) {
      final pa = priority[a.name] ?? 999;
      final pb = priority[b.name] ?? 999;
      if (pa != pb) return pa.compareTo(pb);
      return a.name.compareTo(b.name);
    });

    final dateSeed =
        _birthDate!.day * 31 + _birthDate!.month * 11 + _birthDate!.year;
    final timeSeed = DateTime.now().microsecondsSinceEpoch;
    final random = Random(dateSeed + timeSeed);

    for (int i = deck.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = deck[i];
      deck[i] = deck[j];
      deck[j] = temp;
    }

    final weightedStart = ((dateSeed + timeSeed) % deck.length);
    final rotated = [
      ...deck.sublist(weightedStart),
      ...deck.sublist(0, weightedStart)
    ];

    return rotated;
  }

  List<Map<String, dynamic>> get _astrologyCards {
    final sign = _birthDate == null ? 'เมษ' : _zodiacSign;
    final color = _zodiacColor(sign);
    final profile = _zodiacProfiles[sign] ?? _zodiacProfiles['เมษ'];
    return [
      {
        'title': 'ดวงเสาร์อาทิตย์',
        'icon': Icons.wb_sunny_rounded,
        'color': color,
        'text': _birthDate == null
            ? 'เลือกวันเกิดเพื่อดูดวงอาทิตย์แบบเข้าถึงความต้องการของคุณ'
            : 'ราศรี$sign (${profile?['english'] ?? 'Aries'}) ให้พลังความเข้มแข็งและความชัดเจน ช่วงนี้คุณควรให้เวลาในการตัดสินใจแบบมีสติและกล้าทำสิ่งที่ถูกต้องมากกว่าเผื่อใจคนอื่น',
      },
      {
        'title': 'ความรัก',
        'icon': Icons.favorite_rounded,
        'color': const Color(0xFFE66DAA),
        'text': _birthDate == null
            ? 'เลือกวันเกิดเพื่อดูแนวทางความสัมพันธ์ของคุณ'
            : 'ความรักของราศรี$sign จะดีขึ้นเมื่อคุณเปิดใจและสื่อสารตรงมากขึ้น การเข้าใจคนรอบข้างจะช่วยให้ดวงของคุณเคลื่อนไหวได้อย่างอ่อนโยนและเป็นธรรม',
      },
      {
        'title': 'งาน',
        'icon': Icons.business_center_rounded,
        'color': const Color(0xFF7ACDFF),
        'text': _birthDate == null
            ? 'เลือกวันเกิดเพื่อดูแนวโน้มงานและการเงิน'
            : 'ด้านงานสำหรับราศรี$sign ขยับดีขึ้นเมื่อคุณลงมือทำอย่างต่อเนื่อง และเลือกสิ่งที่ให้ผลลัพธ์ที่มั่นคงกว่าความรีบเร่ง',
      },
    ];
  }

  List<Map<String, dynamic>> get _attractionForces {
    final sign = _birthDate == null ? 'เมษ' : _zodiacSign;
    final profile = _zodiacProfiles[sign] ?? _zodiacProfiles['เมษ'];
    return [
      {
        'title': 'งาน',
        'icon': Icons.work_rounded,
        'color': const Color(0xFF7ACDFF),
        'text':
            'แรงดึงดูดด้านการงาน: ${profile?['tag']} ให้ความสำคัญกับความคืบหน้าและความมั่นใจที่เห็นผลจริง',
      },
      {
        'title': 'ความรัก',
        'icon': Icons.favorite_rounded,
        'color': const Color(0xFFE66DAA),
        'text':
            'แรงดึงดูดด้านความรัก: คุณมีเสน่ห์ที่เข้าถึงใจคนรอบข้างด้วยความจริงใจและการสื่อสารตรง',
      },
      {
        'title': 'สุขภาพ',
        'icon': Icons.favorite_border_rounded,
        'color': const Color(0xFF7EE0A1),
        'text':
            'แรงดึงดูดด้านสุขภาพ: การพักผ่อนและการเคลื่อนไหวที่มีจังหวะจะช่วยให้พลังงานของคุณสมดุลขึ้น',
      },
    ];
  }

  String get firstName =>
      _drawnCards.isNotEmpty ? _drawnCards[0].name : 'ไพ่ใบแรก';
  String get secondName =>
      _drawnCards.length > 1 ? _drawnCards[1].name : 'ไพ่ใบที่สอง';
  String get thirdName =>
      _drawnCards.length > 2 ? _drawnCards[2].name : 'ไพ่ใบที่สาม';

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(now.year - 25, now.month, now.day),
      firstDate: DateTime(1940),
      lastDate: now,
      helpText: 'เลือกวันเกิดของคุณ',
      cancelText: 'ยกเลิก',
      confirmText: 'ยืนยัน',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFFFD166),
              onPrimary: Color(0xFF1C1026),
              surface: Color(0xFF1E1227),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _birthDate = picked;
      });
      _drawNewCards();
    }
  }

  Future<void> _showResultPopup(List<TarotCardData> cards) async {
    final sign = _birthDate == null ? 'เมษ' : _zodiacSign;
    final summary =
        'ไพ่ 3 ใบ: ${cards.map((card) => card.name).join(' • ')}\nราศรี$sign • ${_zodiacTrait}';

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF1B1222),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _zodiacColor(sign),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        _zodiacIcon(sign),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'อ่านเสร็จแล้ว',
                            style: TextStyle(
                              color: Color(0xFFFFD166),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ราศรี$sign',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  summary,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFFFD166),
                    ),
                    child: const Text('ปิด'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggleManualSelection(TarotCardData card) {
    if (_isShuffling) return;

    final alreadySelected =
        _manualSelection.any((item) => item.name == card.name);
    if (alreadySelected) {
      setState(() {
        _manualSelection.removeWhere((item) => item.name == card.name);
        _drawnCards = [];
        _selectedCard = null;
      });
      return;
    }

    setState(() {
      if (_manualSelection.length >= 3) {
        _manualSelection.removeAt(0);
      }

      _manualSelection.add(card);

      if (_manualSelection.length == 3) {
        _drawnCards = List.from(_manualSelection);
        _selectedCard = _drawnCards.first;
      } else {
        _drawnCards = [];
        _selectedCard = null;
      }
    });
  }

  void _confirmSelectedCards() {
    if (_manualSelection.length != 3) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF2B1C33),
          content: const Text(
            'กรุณาเลือกไพ่ 3 ใบให้ครบก่อนดูผล',
            style: TextStyle(color: Colors.white),
          ),
          duration: const Duration(milliseconds: 1600),
        ),
      );
      return;
    }

    final cards = List<TarotCardData>.from(_manualSelection);
    setState(() {
      _drawnCards = cards;
      _selectedCard = cards.first;
    });

    _showResultPopup(cards);
  }

  void _drawNewCards() {
    if (_isShuffling) return;

    setState(() {
      _isShuffling = true;
      _manualSelection.clear();
      _drawnCards = [];
      _selectedCard = null;
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;

      final baseDeck = _buildDeckForZodiac();
      final cards = _dedupeCards([...baseDeck, ..._fullDeck]);

      setState(() {
        _availableCards = cards;
        _isShuffling = false;
      });

      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF2B1C33),
          content: const Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFFFFD166)),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'กองไพ่พร้อมแล้ว • เลือก 3 ใบเพื่ออ่านผล',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 1800),
          margin: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF120B1B), Color(0xFF2C1837), Color(0xFF4B2E4D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.05),
                    border: Border.all(
                      color: const Color(0xFFFFD166).withOpacity(0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFD166), Color(0xFFB57CFF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          color: Color(0xFF1C1026),
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Aster Arcana',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'ดูดวง • อ่านชะตา • ตามราศรีของคุณ',
                              style: TextStyle(
                                color: Color(0xFFD9C5F5),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() => _soundOn = !_soundOn),
                        icon: Icon(
                          _soundOn ? Icons.music_note : Icons.music_off,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.library_books_rounded,
                        color: Color(0xFFFFD166),
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'สำรับไพ่ทาโรต์มาตรฐาน',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '78 ใบ • Major Arcana 22 ใบ + Minor Arcana 56 ใบ',
                              style: TextStyle(
                                color: Color(0xFFEADCFD),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFFFFD166).withOpacity(0.35),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFD166),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.cake_rounded,
                          color: Color(0xFF1C1026),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'วันเกิดของคุณ',
                              style: TextStyle(
                                color: Color(0xFFE7D7FF),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              _birthDate == null
                                  ? 'ยังไม่ได้เลือก วัน/เดือน/ปี'
                                  : '${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year} • ราศรี$_zodiacSign',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _pickBirthDate,
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFFFD166),
                        ),
                        icon: const Icon(Icons.edit_calendar_rounded),
                        label: const Text('เลือก'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white.withOpacity(0.06),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.auto_awesome, color: Color(0xFFFFD166)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _soundOn
                              ? 'โหมดเพลงออร่า • เปิด'
                              : 'โหมดเพลงออร่า • ปิด',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                if (_isShuffling)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD166).withOpacity(0.06),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFFFD166).withOpacity(0.24),
                      ),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xFFFFD166),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'กำลังเรียกพลังไพ่... ใจให้หายใจลึกๆ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_drawnCards.isNotEmpty)
                  SizedBox(
                    height: 220,
                    child: Row(
                      children: _drawnCards.asMap().entries.map((entry) {
                        final index = entry.key;
                        final card = entry.value;
                        final isSelected = _selectedCard?.name == card.name;

                        return Expanded(
                          child: Transform.translate(
                            offset: Offset(index * 2.0, index * 1.5),
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedCard = card),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeInOut,
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 0 : 6,
                                  right: index == 2 ? 0 : 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.18),
                                    width: isSelected ? 2.2 : 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.22),
                                      blurRadius: 10,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFF4E3754),
                                                const Color(0xFF1D1224),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white.withOpacity(0.05),
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.08),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Opacity(
                                          opacity: 0.9,
                                          child: SvgPicture.asset(
                                            'assets/tarot_cards/card_back.svg',
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(0.12),
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        right: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.18),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFFFD166),
                                                  width: 1.2,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.18),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFFFD166),
                                                  width: 1.2,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: card.imageAsset ==
                                                'assets/tarot_cards/card_back.svg'
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      card.color
                                                          .withOpacity(0.95),
                                                      const Color(0xFF1B1523),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        card.icon,
                                                        color: Colors.white,
                                                        size: 38,
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      Text(
                                                        card.name,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        card.keyword,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFFF2DFFF),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : SvgPicture.asset(
                                                card.imageAsset,
                                                fit: BoxFit.cover,
                                                placeholderBuilder: (_) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        card.color
                                                            .withOpacity(0.95),
                                                        const Color(0xFF1B1523),
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          card.icon,
                                                          color: Colors.white,
                                                          size: 38,
                                                        ),
                                                        const SizedBox(
                                                            height: 12),
                                                        Text(
                                                          card.name,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        Text(
                                                          card.keyword,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFFF2DFFF),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      if (!isSelected)
                                        Positioned.fill(
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                else if (_availableCards.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.touch_app_rounded,
                              color: Color(0xFFFFD166),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _manualSelection.isEmpty
                                    ? 'เลือกไพ่ 3 ใบจากกองด้านล่าง'
                                    : 'เลือกไพ่ต่อไป: ${3 - _manualSelection.length} ใบ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 220,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            itemCount: _availableCards.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              final card = _availableCards[index];
                              final isPicked = _manualSelection.any(
                                (item) => item.name == card.name,
                              );

                              return GestureDetector(
                                onTap: () => _toggleManualSelection(card),
                                child: SizedBox(
                                  width: 120,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 220),
                                    transform: Matrix4.rotationZ(
                                      _isShuffling
                                          ? ((card.name.hashCode % 7) - 3) *
                                              0.05
                                          : 0,
                                    ),
                                    curve: Curves.easeInOutBack,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: isPicked
                                            ? const Color(0xFFFFD166)
                                            : Colors.white.withOpacity(0.14),
                                        width: isPicked ? 2 : 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Positioned.fill(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    const Color(0xFF3B2448),
                                                    const Color(0xFF1C1223),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.white
                                                        .withOpacity(0.04),
                                                    Colors.transparent,
                                                    Colors.black
                                                        .withOpacity(0.07),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (!isPicked)
                                            Positioned.fill(
                                              child: Opacity(
                                                opacity: 0.98,
                                                child: SvgPicture.asset(
                                                  'assets/tarot_cards/card_back.svg',
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withOpacity(0.12),
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            )
                                          else if (card.imageAsset ==
                                              'assets/tarot_cards/card_back.svg')
                                            Positioned.fill(
                                              child: Container(
                                                color: card.color
                                                    .withOpacity(0.35),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      card.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          else
                                            Positioned.fill(
                                              child: SvgPicture.asset(
                                                card.imageAsset,
                                                fit: BoxFit.cover,
                                                placeholderBuilder: (_) =>
                                                    Container(
                                                  color: card.color
                                                      .withOpacity(0.35),
                                                  child: Center(
                                                    child: Text(
                                                      card.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (!isPicked)
                                            Positioned(
                                              top: 6,
                                              right: 6,
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.12),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFFFFD166),
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (isPicked)
                                            Positioned(
                                              top: 6,
                                              right: 6,
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFFD166),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.check,
                                                  size: 14,
                                                  color: Color(0xFF1C1026),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (_manualSelection.length == 3)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: ElevatedButton.icon(
                              onPressed: _confirmSelectedCards,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB88CFF),
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              icon: const Icon(Icons.auto_awesome,
                                  color: Colors.white),
                              label: const Text(
                                'ดูผลลัพธ์ 3 ใบ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                if (_birthDate != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _zodiacColor(_zodiacSign).withOpacity(0.28),
                          Colors.white.withOpacity(0.04),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: _zodiacColor(_zodiacSign).withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: _zodiacColor(_zodiacSign),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            _zodiacIcon(_zodiacSign),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ราศรี$_zodiacSign',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _zodiacSummary,
                                style: const TextStyle(
                                  color: Color(0xFFF3EAFF),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 22),
                if (_birthDate != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ดวงตามราศรี',
                          style: TextStyle(
                            color: Color(0xFFFFD166),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ..._astrologyCards.map((item) {
                          final color = item['color'] as Color;
                          final icon = item['icon'] as IconData;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: color.withOpacity(0.35),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child:
                                      Icon(icon, color: Colors.white, size: 20),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'] as String,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item['text'] as String,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 13,
                                          height: 1.55,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                if (_selectedCard != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: _selectedCard!.color,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                _selectedCard!.icon,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedCard!.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    _selectedCard!.keyword,
                                    style: const TextStyle(
                                      color: Color(0xFFEBD9FF),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'สรุปดวงวันนี้',
                          style: TextStyle(
                            color: Color(0xFFFFD166),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _selectedCard!.summary,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'ความหมายของไพ่',
                          style: TextStyle(
                            color: Color(0xFFFFD166),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _selectedCard!.meaning,
                          style: const TextStyle(
                            color: Color(0xFFE8D7FF),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'แรงดึงดูด',
                        style: TextStyle(
                          color: Color(0xFFFFD166),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ..._attractionForces.map((item) {
                        final color = item['color'] as Color;
                        final icon = item['icon'] as IconData;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: color.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:
                                    Icon(icon, color: Colors.white, size: 20),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['text'] as String,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'สรุปไพ่ตามราศรี',
                        style: TextStyle(
                          color: Color(0xFFFFD166),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _zodiacSummary,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ผลลัพธ์รายวัน',
                              style: TextStyle(
                                color: Color(0xFFFFD166),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _dailyAstroReading,
                              style: const TextStyle(
                                color: Colors.white,
                                height: 1.55,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ผลลัพธ์รายสัปดาห์',
                              style: TextStyle(
                                color: Color(0xFFFFD166),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _weeklyAstroReading,
                              style: const TextStyle(
                                color: Colors.white,
                                height: 1.55,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ผลรวม 3 ใบ',
                        style: TextStyle(
                          color: Color(0xFFFFD166),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _readingSummary,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'ความหมายไพ่แต่ละใบ',
                        style: TextStyle(
                          color: Color(0xFFF2DFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ..._drawnCards.map((card) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                margin: const EdgeInsets.only(top: 8, right: 8),
                                decoration: BoxDecoration(
                                  color: card.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${card.name}: ${card.meaning}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _isShuffling ? null : _drawNewCards,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isShuffling
                        ? const Color(0xFF6B586F)
                        : const Color(0xFFB88CFF),
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  icon: Icon(
                    _isShuffling ? Icons.hourglass_top : Icons.refresh,
                    color: Colors.white,
                  ),
                  label: Text(
                    _isShuffling ? 'กำลังสุ่มไพ่...' : 'สุ่มกองไพ่ใหม่',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
