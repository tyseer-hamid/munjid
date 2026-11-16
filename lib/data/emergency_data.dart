import '../models/emergency_item.dart';

class EmergencyData {
  static List<EmergencyCategory> categories = [
    EmergencyCategory(name: 'الحروق والجروح', iconName: 'burn'),
    EmergencyCategory(name: 'الاختناق والتنفس', iconName: 'choking'),
    EmergencyCategory(name: 'التسمم واللسعات', iconName: 'poisoning'),
    EmergencyCategory(name: 'الكسور والإصابات', iconName: 'fracture'),
    EmergencyCategory(name: 'الإغماء والدوخة', iconName: 'fainting'),
  ];

  static final List<EmergencyItem> items = [
    // ── الحروق والجروح (3 حالات) ──
    EmergencyItem(
      id: 'burn_1',
      category: 'الحروق والجروح',
      title: 'حرق بسيط (من الدرجة الأولى)',
      warning: 'لا تضع معجون أسنان أو زبدة أو ثلج مباشرة على الحرق. لا تفقأ الفقاعات.',
      steps: [
        EmergencyStep(order: 1, text: 'أبعد المصاب عن مصدر الحرق فوراً.'),
        EmergencyStep(order: 2, text: 'ضع المنطقة المحروقة تحت ماء بارد جارٍ لمدة 10-20 دقيقة.'),
        EmergencyStep(order: 3, text: 'غطِّ الحرق بضمادة نظيفة غير لاصقة أو قماش قطني.'),
        EmergencyStep(order: 4, text: 'أعطِ مسكناً للألم عند الحاجة (باراسيتامول).'),
        EmergencyStep(order: 5, text: 'راجع الطبيب إذا كان الحرق أكبر من كف اليد أو في الوجه أو المفاصل.'),
      ],
      videoAsset: 'assets/videos/burn.mp4',
    ),
    EmergencyItem(
      id: 'burn_2',
      category: 'الحروق والجروح',
      title: 'جرح سطحي (خدش أو قطع صغير)',
      warning: 'لا تستخدم القطن مباشرة على الجرح (تترك أليافاً). لا تغسل الجرح بالكحول مباشرة.',
      steps: [
        EmergencyStep(order: 1, text: 'اغسل يديك جيداً بالماء والصابون.'),
        EmergencyStep(order: 2, text: 'اغسل الجرح بماء جارٍ نظيف لمدة 5 دقائق.'),
        EmergencyStep(order: 3, text: 'جفف المنطقة المحيطة بلطف باستخدام شاش نظيف.'),
        EmergencyStep(order: 4, text: 'ضع ضمادة لاصقة أو شاشاً معقماً على الجرح.'),
        EmergencyStep(order: 5, text: 'غيّر الضمادة يومياً وراقب علامات العدوى (احمرار، تورم، صديد).'),
      ],
      videoAsset: 'assets/videos/cut.mp4',
    ),
    EmergencyItem(
      id: 'burn_3',
      category: 'الحروق والجروح',
      title: 'نزيف من جرح قطعي',
      warning: 'لا تحاول إزالة أي جسم غريب مغروس في الجرح. لا ترفع الضغط فجأة.',
      steps: [
        EmergencyStep(order: 1, text: 'ارتدِ قفازات إن أمكن، واضغط مباشرة على الجرح بضمادة نظيفة أو قماش.'),
        EmergencyStep(order: 2, text: 'اضغط بقوة وثبات لمدة 10 دقائق دون رفع الضمادة.'),
        EmergencyStep(order: 3, text: 'إذا تشبعت الضمادة بالدم، أضف ضمادة أخرى فوقها دون إزالة الأولى.'),
        EmergencyStep(order: 4, text: 'ارفع العضو المصاب أعلى من مستوى القلب إن أمكن.'),
        EmergencyStep(order: 5, text: 'اتصل بالإسعاف إذا استمر النزيف أو كان غزيراً.'),
      ],
      videoAsset: 'assets/videos/cut.mp4',
    ),

    // ── الاختناق والتنفس (3 حالات) ──
    EmergencyItem(
      id: 'choking_1',
      category: 'الاختناق والتنفس',
      title: 'اختناق بالطعام (انسداد مجرى الهواء)',
      warning: 'لا تضرب ظهر المصاب إذا كان يسعل بقوة (السعال الفعال يطرد الجسم). لا تدخل إصبعك في الفم بشكل أعمى.',
      steps: [
        EmergencyStep(order: 1, text: 'اسأل المصاب: "هل تختنق؟" إذا لم يستطع الكلام أو السعال، ابدأ فوراً.'),
        EmergencyStep(order: 2, text: 'قف خلف المصاب وأمِل جسمه قليلاً إلى الأمام.'),
        EmergencyStep(order: 3, text: 'اضرب بين كتفيه 5 ضربات قوية بكعب يدك.'),
        EmergencyStep(order: 4, text: 'إذا لم يخرج الجسم، طبق مناورة هيمليك: اضغط على بطنه 5 ضغطات للأعلى.'),
        EmergencyStep(order: 5, text: 'كرر 5 ضربات + 5 ضغطات حتى يخرج الجسم أو يفقد الوعي (حينها ابدأ الإنعاش).'),
      ],
      videoAsset: 'assets/videos/choking.mp4',
    ),
    EmergencyItem(
      id: 'choking_2',
      category: 'الاختناق والتنفس',
      title: 'نوبة ربو (ضيق تنفس حاد)',
      warning: 'لا تجبر المصاب على الاستلقاء. لا تعطه أي دواء غير بخاخه المعتاد.',
      steps: [
        EmergencyStep(order: 1, text: 'أجلس المصاب في وضع مستقيم مع الميل قليلاً إلى الأمام.'),
        EmergencyStep(order: 2, text: 'ساعده على استخدام بخاخ الربو (الموسع للشعب) حسب تعليمات طبيبه.'),
        EmergencyStep(order: 3, text: 'هدّئ المصاب واطلب منه التنفس ببطء وعمق.'),
        EmergencyStep(order: 4, text: 'إذا لم يتحسن خلال 5-10 دقائق، اتصل بالإسعاف فوراً.'),
        EmergencyStep(order: 5, text: 'إذا فقد الوعي، ابدأ الإنعاش القلبي الرئوي إن كنت مدرباً.'),
      ],
      videoAsset: 'assets/videos/choking.mp4',
    ),
    EmergencyItem(
      id: 'choking_3',
      category: 'الاختناق والتنفس',
      title: 'غرق (إنقاذ من الماء)',
      warning: 'لا تقفز في الماء إذا لم تكن سباحاً ماهراً. لا تحاول إخراج الماء من الرئتين بضغط البطن.',
      steps: [
        EmergencyStep(order: 1, text: 'أخرج المصاب من الماء بأمان (استخدم حبلاً أو عصا إن أمكن).'),
        EmergencyStep(order: 2, text: 'تحقق من التنفس والنبض. إذا لم يتنفس، ابدأ الإنعاش فوراً.'),
        EmergencyStep(order: 3, text: 'اتصل بالإسعاف حتى لو بدا المصاب بخير (قد تتأخر مضاعفات الغرق).'),
        EmergencyStep(order: 4, text: 'دثر المصاب ببطانية وأبقه مستلقياً على جانبه.'),
        EmergencyStep(order: 5, text: 'راقب التنفس باستمرار حتى وصول المساعدة.'),
      ],
      videoAsset: 'assets/videos/choking.mp4',
    ),

    // ── التسمم واللسعات (3 حالات) ──
    EmergencyItem(
      id: 'poison_1',
      category: 'التسمم واللسعات',
      title: 'تسمم عن طريق الفم (مواد كيميائية أو أدوية)',
      warning: 'لا تحفّز القيء أبداً إذا كان المادة كاوية أو بترولية. لا تعطِ حليباً أو ماءً دون استشارة.',
      steps: [
        EmergencyStep(order: 1, text: 'حدد المادة التي ابتلعها المصاب وكميتها ووقت تناولها.'),
        EmergencyStep(order: 2, text: 'اتصل بمركز السموم أو الإسعاف فوراً واتبع تعليماتهم.'),
        EmergencyStep(order: 3, text: 'لا تحفّز القيء إلا إذا طلب منك الطبيب أو مركز السموم ذلك.'),
        EmergencyStep(order: 4, text: 'إذا كان المصاب فاقد الوعي، ضعه على جانبه وتأكد من تنفسه.'),
        EmergencyStep(order: 5, text: 'خذ عبوة المادة معك إلى المستشفى إن أمكن.'),
      ],
      videoAsset: 'assets/videos/poisoning.mp4',
    ),
    EmergencyItem(
      id: 'poison_2',
      category: 'التسمم واللسعات',
      title: 'لسعة عقرب',
      warning: 'لا تشق الجرح ولا تمص السم بفمك. لا تضع ثلجاً مباشرة على الجلد.',
      steps: [
        EmergencyStep(order: 1, text: 'أبعد المصاب عن مكان العقرب وابقِه هادئاً.'),
        EmergencyStep(order: 2, text: 'اغسل مكان اللسعة بالماء والصابون.'),
        EmergencyStep(order: 3, text: 'ضع كمادة باردة (منشفة مبللة) على مكان اللسعة لتخفيف الألم.'),
        EmergencyStep(order: 4, text: 'ثبّت العضو المصاب في وضع مريح وأزل أي خواتم أو ضاغطات.'),
        EmergencyStep(order: 5, text: 'اتصل بالإسعاف فوراً إذا كان المصاب طفلاً أو ظهرت أعراض (تعرق، قيء، صعوبة تنفس).'),
      ],
      videoAsset: 'assets/videos/poisoning.mp4',
    ),
    EmergencyItem(
      id: 'poison_3',
      category: 'التسمم واللسعات',
      title: 'لدغة أفعى',
      warning: 'لا تضع رباطاً ضاغطاً قوياً (يضر أكثر مما ينفع). لا تحاول مص السم أو كيّ الجرح.',
      steps: [
        EmergencyStep(order: 1, text: 'أبعد المصاب عن الأفعى وابقِه ساكناً قدر الإمكان (الحركة تسرّع السم).'),
        EmergencyStep(order: 2, text: 'أزل أي حلي أو ملابس ضيقة قرب مكان اللدغة قبل التورم.'),
        EmergencyStep(order: 3, text: 'ثبّت العضو المصاب في مستوى أقل من القلب إن أمكن.'),
        EmergencyStep(order: 4, text: 'اتصل بالإسعاف فوراً واذكر وصف الأفعى إن استطعت.'),
        EmergencyStep(order: 5, text: 'غطِّ اللدغة بضمادة نظيفة جافة وراقب علامات الحياة.'),
      ],
      videoAsset: 'assets/videos/poisoning.mp4',
    ),

    // ── الكسور والإصابات (3 حالات) ──
    EmergencyItem(
      id: 'fracture_1',
      category: 'الكسور والإصابات',
      title: 'كسر في أحد الأطراف',
      warning: 'لا تحاول تقويم العظم أو تحريك العضو المصاب. لا تضع كمادات ساخنة.',
      steps: [
        EmergencyStep(order: 1, text: 'ثبّت العضو المصاب في الوضع الذي وجدته عليه دون تحريك.'),
        EmergencyStep(order: 2, text: 'ضع كمادة باردة (ملفوفة بقماش) على المنطقة لتخفيف التورم.'),
        EmergencyStep(order: 3, text: 'استخدم جبيرة مؤقتة (خشبة، كرتون مقوى) وثبّتها برباط دون ضغط شديد.'),
        EmergencyStep(order: 4, text: 'ارفع العضو المصاب إن أمكن وابقِ المصاب هادئاً.'),
        EmergencyStep(order: 5, text: 'اتصل بالإسعاف أو انقل المصاب إلى المستشفى.'),
      ],
      videoAsset: 'assets/videos/fracture.mp4',
    ),
    EmergencyItem(
      id: 'fracture_2',
      category: 'الكسور والإصابات',
      title: 'التواء الكاحل أو الرسغ',
      warning: 'لا تضع الوزن على العضو المصاب مباشرة بعد الإصابة. لا تستخدم الكمادات الساخنة في أول 48 ساعة.',
      steps: [
        EmergencyStep(order: 1, text: 'أرح العضو المصاب وتجنب تحريكه.'),
        EmergencyStep(order: 2, text: 'ضع كمادة باردة لمدة 15-20 دقيقة كل ساعتين.'),
        EmergencyStep(order: 3, text: 'ارفع العضو المصاب أعلى من مستوى القلب لتقليل التورم.'),
        EmergencyStep(order: 4, text: 'اربط رباطاً ضاغطاً (مرناً) حول المفصل دون إحكام مفرط.'),
        EmergencyStep(order: 5, text: 'راجع الطبيب إذا استمر الألم أو التورم بعد 48 ساعة.'),
      ],
      videoAsset: 'assets/videos/fracture.mp4',
    ),
    EmergencyItem(
      id: 'fracture_3',
      category: 'الكسور والإصابات',
      title: 'إصابة الرأس (ارتجاج محتمل)',
      warning: 'لا تسمح للمصاب بالنوم فوراً دون مراقبة. لا تعطه مسكناً قوياً دون استشارة طبية.',
      steps: [
        EmergencyStep(order: 1, text: 'أبقِ المصاب مستلقياً وثابتاً، وراقب وعيه وتنفسه.'),
        EmergencyStep(order: 2, text: 'ضع كمادة باردة على مكان الإصابة إن لم يكن هناك جرح مفتوح.'),
        EmergencyStep(order: 3, text: 'راقب علامات الخطر: قيء متكرر، تشوش، نعاس شديد، عدم اتزان، اتساع حدقة عين واحدة.'),
        EmergencyStep(order: 4, text: 'اتصل بالإسعاف فوراً إذا ظهرت أي علامة من علامات الخطر.'),
        EmergencyStep(order: 5, text: 'حتى بدون أعراض، يُنصح بمراجعة الطبيب بعد أي إصابة في الرأس.'),
      ],
      videoAsset: 'assets/videos/fracture.mp4',
    ),

    // ── الإغماء والدوخة (3 حالات) ──
    EmergencyItem(
      id: 'faint_1',
      category: 'الإغماء والدوخة',
      title: 'إغماء بسيط (فقدان وعي مؤقت)',
      warning: 'لا تصب الماء على وجه المصاب. لا تحاول إجباره على الوقوف بسرعة بعد الإفاقة.',
      steps: [
        EmergencyStep(order: 1, text: 'ضع المصاب مستلقياً على ظهره وارفع ساقيه قليلاً (حوالي 30 سم).'),
        EmergencyStep(order: 2, text: 'تأكد من أن مجرى التنفس مفتوح وافتح النوافذ للتهوية.'),
        EmergencyStep(order: 3, text: 'فكّ أي ملابس ضيقة (ربطة عنق، حزام).'),
        EmergencyStep(order: 4, text: 'إذا لم يستعد وعيه خلال دقيقة، اتصل بالإسعاف وتأكد من تنفسه.'),
        EmergencyStep(order: 5, text: 'بعد الإفاقة، أبقِه مستلقياً لبضع دقائق ثم اجعله ينهض ببطء.'),
      ],
      videoAsset: 'assets/videos/fainting.mp4',
    ),
    EmergencyItem(
      id: 'faint_2',
      category: 'الإغماء والدوخة',
      title: 'هبوط سكر (نقص سكر الدم)',
      warning: 'لا تعطِ طعاماً أو شراباً لمصاب فاقد الوعي (خطر الاختناق).',
      steps: [
        EmergencyStep(order: 1, text: 'إذا كان المصاب واعياً، أعطِه سكريات سريعة (عصير، عسل، سكر).'),
        EmergencyStep(order: 2, text: 'اتركه يرتاح لمدة 10-15 دقيقة بعد تناول السكر.'),
        EmergencyStep(order: 3, text: 'إذا لم يتحسن، كرر إعطاء السكر وأعد الفحص.'),
        EmergencyStep(order: 4, text: 'إذا فقد الوعي، ضعه على جانبه واتصل بالإسعاف فوراً.'),
        EmergencyStep(order: 5, text: 'لا تحقن الأنسولين أبداً في حالة هبوط السكر.'),
      ],
      videoAsset: 'assets/videos/fainting.mp4',
    ),
    EmergencyItem(
      id: 'faint_3',
      category: 'الإغماء والدوخة',
      title: 'ضربة شمس أو إنهاك حراري',
      warning: 'لا تعطِ مشروبات كحولية أو منبهة. لا تترك المصاب في الشمس.',
      steps: [
        EmergencyStep(order: 1, text: 'انقل المصاب إلى مكان بارد وظليل وجيد التهوية.'),
        EmergencyStep(order: 2, text: 'فكّ الملابس الزائدة ورشّ جسمه بالماء البارد.'),
        EmergencyStep(order: 3, text: 'استخدم مروحة أو كمادات باردة على الرقبة والإبطين.'),
        EmergencyStep(order: 4, text: 'إذا كان واعياً، أعطِه ماءً بارداً للشرب ببطء.'),
        EmergencyStep(order: 5, text: 'اتصل بالإسعاف إذا ارتفعت حرارته أو فقد الوعي أو تشوش.'),
      ],
      videoAsset: 'assets/videos/fainting.mp4',
    ),
  ];

  static List<EmergencyItem> getByCategory(String category) {
    return items.where((e) => e.category == category).toList();
  }

  static List<EmergencyItem> search(String query) {
    if (query.trim().isEmpty) return [];
    final q = query.trim();
    return items.where((e) => e.title.contains(q)).toList();
  }

  static EmergencyItem? getById(String id) {
    try {
      return items.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }
}
