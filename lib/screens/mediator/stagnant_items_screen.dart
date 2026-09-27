import 'package:flutter/material.dart';

class StagnantItemsScreen extends StatelessWidget {
  const StagnantItemsScreen({super.key});


  static const Color purple = Color(0xFF8B2CF5);
  static const Color darkText = Color(0xFF1E293B);
  static const Color greyText = Color(0xFF94A3B8);
  static const Color background = Color(0xFFF8F9FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      endDrawer: _buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildPageTitle(),
                    const SizedBox(height: 22),
                    _buildStatistics(),
                    const SizedBox(height: 20),
                    _buildQuickActions(context),
                    const SizedBox(height: 20),
                    _buildSearchSection(),
                    const SizedBox(height: 18),
                    _buildCategories(),
                    const SizedBox(height: 22),
                    _buildItemsTitle(),
                    const SizedBox(height: 12),

                    _buildItemCard(
                      name: 'فستان نسائي طويل',
                      category: 'ملابس نسائية',
                      store: 'SHEIN',
                      orderNumber: '#1042',
                      quantity: '1',
                      price: '85 ₪',
                      status: 'غير معروضة',
                    ),

                    _buildItemCard(
                      name: 'حذاء رياضي نسائي',
                      category: 'أحذية نسائية',
                      store: 'SHEIN',
                      orderNumber: '#1045',
                      quantity: '1',
                      price: '120 ₪',
                      status: 'معروضة للبيع',
                    ),

                    _buildItemCard(
                      name: 'مجموعة أقلام تلوين',
                      category: 'مستلزمات مكتبية',
                      store: 'Temu',
                      orderNumber: '#1058',
                      quantity: '3',
                      price: '16 ₪',
                      status: 'غير معروضة',
                    ),

                    _buildItemCard(
                      name: 'منظم أدراج',
                      category: 'أدوات المنزل',
                      store: 'SHEIN',
                      orderNumber: '#1060',
                      quantity: '2',
                      price: '35 ₪',
                      status: 'محجوزة',
                    ),

                    _buildItemCard(
                      name: 'سوار نسائي ذهبي',
                      category: 'مجوهرات وإكسسوارات',
                      store: 'SHEIN',
                      orderNumber: '#1062',
                      quantity: '1',
                      price: '25 ₪',
                      status: 'تم البيع',
                    ),

                    const SizedBox(height: 12),
                    _buildBottomAddCard(context),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8D9FF),
          ),
        ),
      ),
      child: Row(
        children: [
       Builder(
  builder: (context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.menu,
          size: 22,
          color: Color(0xFF64748B),
        ),
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
    );
  },
),
          const Spacer(),

          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications_none,
                color: Color(0xFF64748B),
                size: 24,
              ),
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: purple,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'س',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PAGE TITLE
  // ============================================================

  Widget _buildPageTitle() {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'القطع الراكدة',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'أديري القطع المتوفرة لديك واعرضي المناسب منها للبيع.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13,
              color: greyText,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATISTICS
  // ============================================================

  Widget _buildStatistics() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            number: '1',
            label: 'تم بيعها',
            numberColor: darkText,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            number: '1',
            label: 'معروضة\nللبيع',
            numberColor: Color(0xFF00A86B),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            number: '5',
            label: 'إجمالي\nالقطع',
            numberColor: purple,
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String number,
    required String label,
    required Color numberColor,
  }) {
    return Container(
      height: 225,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFEEEEF2),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: numberColor,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: greyText,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // QUICK ACTIONS
  // ============================================================

  Widget _buildQuickActions(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'إجراءات سريعة',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 18),

          _purpleButton(
  text: 'إضافة قطعة جديدة',
  icon: Icons.add,
  onTap: () {
    _showAddItemPanel(context);
  },
),

          const SizedBox(height: 10),

          _purpleButton(
            text: 'القطع المعروضة للبيع',
            icon: Icons.shopping_bag_outlined,
          ),

          const SizedBox(height: 10),

          _purpleButton(
            text: 'القطع المباعة',
            icon: Icons.star_border,
          ),
        ],
      ),
    );
  }
Widget _purpleButton({
  required String text,
  required IconData icon,
  VoidCallback? onTap,
}) {
  return Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(11),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF9C45FF),
              Color(0xFF7614EE),
            ],
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    ),
  );
}

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearchSection() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFE5E7EB),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'ابحثي باسم القطعة أو رقم الطلب...',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFB4BAC5),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _smallButton(
                  text: 'بحث',
                  icon: Icons.search,
                  selected: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _smallButton(
                  text: 'تصفية',
                  icon: Icons.filter_alt_outlined,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _smallButton(
                  text: 'الأحدث',
                  icon: Icons.keyboard_arrow_down,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallButton({
    required String text,
    required IconData icon,
    bool selected = false,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: selected ? purple : const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 17,
            color: selected ? Colors.white : const Color(0xFF64748B),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.white : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  Widget _buildCategories() {
    final categories = [
      'الكل',
      'ملابس',
      'أحذية',
      'حقائب',
      'إكسسوارات',
      'مجوهرات',
      'الجمال والعناية',
      'الصحة والعناية الشخصية',
      'أدوات المنزل',
      'لوازم مكتبية',
      'مستلزمات مدرسية',
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        spacing: 7,
        runSpacing: 8,
        children: categories.map((category) {
          final selected = category == 'الكل';

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: selected ? purple : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected
                    ? purple
                    : const Color(0xFFE1E4E8),
              ),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 11,
                color: selected
                    ? Colors.white
                    : const Color(0xFF64748B),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ============================================================
  // ITEMS
  // ============================================================

  Widget _buildItemsTitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '5 قطع',
          style: TextStyle(
            color: Color(0xFFB0B6C0),
            fontSize: 12,
          ),
        ),
        Text(
          'القطع الراكدة',
          style: TextStyle(
            color: darkText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard({
    required String name,
    required String category,
    required String store,
    required String orderNumber,
    required String quantity,
    required String price,
    required String status,
  }) {
    Color statusColor = const Color(0xFF64748B);
    Color statusBackground = const Color(0xFFF1F3F5);

    if (status == 'معروضة للبيع') {
      statusColor = const Color(0xFF12A66A);
      statusBackground = const Color(0xFFDDF8EA);
    } else if (status == 'محجوزة') {
      statusColor = const Color(0xFFE69A21);
      statusBackground = const Color(0xFFFFF1D7);
    } else if (status == 'تم البيع') {
      statusColor = purple;
      statusBackground = const Color(0xFFF0E4FF);
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFFB5BAC3),
                    size: 30,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'الفئة: $category',
                        style: const TextStyle(
                          fontSize: 11,
                          color: greyText,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'المتجر: $store',
                        style: const TextStyle(
                          fontSize: 11,
                          color: greyText,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '$orderNumber طلب     $quantity الكمية',
                        style: const TextStyle(
                          fontSize: 11,
                          color: greyText,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'السعر: $price',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM ADD CARD
  // ============================================================

Widget _buildBottomAddCard(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 25,
    ),
    decoration: _cardDecoration(),
    child: Column(
      children: [
        const Text(
          'هل لديك قطعة جديدة؟',
          style: TextStyle(
            color: darkText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          'أضيفي قطعتك وابدئي بالبيع الآن.',
          style: TextStyle(
            color: greyText,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 16),

        InkWell(
          onTap: () {
            _showAddItemPanel(context);
          },
          borderRadius: BorderRadius.circular(11),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF9C45FF),
                  Color(0xFF7614EE),
                ],
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 7),
                Text(
                  'إضافة قطعة جديدة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
  // ============================================================
// DRAWER
// ============================================================

Widget _buildDrawer(BuildContext context) {
  return Drawer(
    width: 285,
    backgroundColor: Colors.white,
    child: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'و',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'وساطة',
                        style: TextStyle(
                          color: darkText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'لوحة الوسيطة',
                        style: TextStyle(
                          color: Color(0xFFB48AFF),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1),

          const SizedBox(height: 18),

          _drawerItem(
            icon: Icons.home_outlined,
            title: 'الرئيسية',
          ),

          _drawerItem(
            icon: Icons.shopping_bag_outlined,
            title: 'الطلبات',
          ),

          _drawerItem(
            icon: Icons.inventory_2_outlined,
            title: 'القطع الراكدة',
            selected: true,
          ),

          _drawerItem(
            icon: Icons.local_shipping_outlined,
            title: 'الشحنات',
          ),

          _drawerItem(
            icon: Icons.star_border,
            title: 'التقييمات',
          ),

          const Spacer(),

          const Divider(height: 1),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: purple,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'س',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'سارة العلي',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: darkText,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'وسيطة معتمدة',
                        style: TextStyle(
                          fontSize: 10,
                          color: greyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _drawerItem({
  required IconData icon,
  required String title,
  bool selected = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 3,
    ),
    child: Container(
      height: 46,
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFF3ECFF)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            const SizedBox(width: 14),

            Icon(
              icon,
              size: 20,
              color: selected
                  ? purple
                  : const Color(0xFF94A3B8),
            ),

            const SizedBox(width: 13),

            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.w400,
                color: selected
                    ? purple
                    : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
// ============================================================
// ADD NEW ITEM PANEL
// ============================================================

void _showAddItemPanel(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'إضافة قطعة جديدة',
    barrierColor: Colors.black.withOpacity(0.45),
    transitionDuration: const Duration(milliseconds: 300),

    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerRight,
        child: Material(
          color: Colors.white,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.92,
            height: double.infinity,
            child: SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    // HEADER
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: purple,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'إضافة قطعة راكدة جديدة',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: darkText,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'أضيفي بيانات القطعة التي أصبحت متوفرة لديك.',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // FORM
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'معلومات القطعة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: darkText,
                              ),
                            ),

                            const SizedBox(height: 18),

                            _formLabel('اسم القطعة', required: true),

                            const SizedBox(height: 7),

                            _formField(
                              hint: 'مثال: فستان نسائي طويل',
                            ),

                            const SizedBox(height: 18),

                            _formLabel('الفئة', required: true),

                            const SizedBox(height: 7),

                            _formField(
                              hint: 'اختاري الفئة',
                              icon: Icons.keyboard_arrow_down,
                            ),

                            const SizedBox(height: 18),

                            _formLabel('المتجر', required: true),

                            const SizedBox(height: 7),

                            _formField(
                              hint: 'اختاري المتجر',
                              icon: Icons.keyboard_arrow_down,
                            ),

                            const SizedBox(height: 18),

                            _formLabel('رقم الطلب'),

                            const SizedBox(height: 7),

                            _formField(
                              hint: '#1042',
                            ),

                            const SizedBox(height: 28),

                            const Divider(
                              color: Color(0xFFEEEEF2),
                            ),

                            const SizedBox(height: 18),

                            const Text(
                              'تفاصيل القطعة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: darkText,
                              ),
                            ),

                            const SizedBox(height: 18),

                            _formLabel('وصف مختصر'),

                            const SizedBox(height: 7),

                            _formField(
                              hint: 'أضيفي وصفاً مختصراً للقطعة...',
                              height: 90,
                            ),

                            const SizedBox(height: 18),

                            _formLabel('الكمية', required: true),

                            const SizedBox(height: 7),

                            Container(
                              width: 135,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFAFC),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFE2E5EA),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 17,
                                    color: Color(0xFF64748B),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: darkText,
                                    ),
                                  ),
                                  Icon(
                                    Icons.remove,
                                    size: 17,
                                    color: Color(0xFF64748B),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 18),

                            _formLabel('السعر الأصلي', required: true),

                            const SizedBox(height: 7),

                            _formField(
                              hint: 'مثال: 85',
                            ),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),

                    // BOTTOM BUTTONS
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Color(0xFFEEEEF2),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF9C45FF),
                                      Color(0xFF7614EE),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'حفظ القطعة',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFE2E5EA),
                                  ),
                                ),
                                child: const Text(
                                  'إلغاء',
                                  style: TextStyle(
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },

    transitionBuilder:
        (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
      );

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

Widget _formLabel(
  String text, {
  bool required = false,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF475569),
        ),
      ),
      if (required)
        const Text(
          ' *',
          style: TextStyle(
            color: purple,
            fontSize: 13,
          ),
        ),
    ],
  );
}

Widget _formField({
  required String hint,
  IconData? icon,
  double height = 48,
}) {
  return Container(
    width: double.infinity,
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 14),
    decoration: BoxDecoration(
      color: const Color(0xFFFAFAFC),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color(0xFFE2E5EA),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Align(
            alignment: height > 50
                ? Alignment.topRight
                : Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: height > 50 ? 14 : 0,
              ),
              child: Text(
                hint,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB0B7C3),
                ),
              ),
            ),
          ),
        ),

        if (icon != null)
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF94A3B8),
          ),
      ],
    ),
  );
}
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: const Color(0xFFEEEEF2),
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0C000000),
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  );
}
}