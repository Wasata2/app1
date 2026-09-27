import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
class MediatorProfileScreen extends StatelessWidget {
  const MediatorProfileScreen({super.key});

  static const Color purple = Color(0xFFB600E8);
  static const Color darkPurple = Color(0xFF4C3B83);
  static const Color lightPurple = Color(0xFFFBF2FF);
  static const Color background = Color(0xFFF8F8F8);
  static const Color greyText = Color(0xFF8D8A99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      endDrawer: _buildDrawer(context),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 30),
                child: Column(
                  children: [
                    _buildPageTitle(),
                    const SizedBox(height: 18),
                    _buildProfileCard(),
                    const SizedBox(height: 16),
                    _buildAccountCard(),
                    const SizedBox(height: 16),
                    _buildPublicInfoCard(),
                    const SizedBox(height: 16),
                    _buildServicesCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context) {
  return Container(
    height: 66,
    padding: const EdgeInsets.symmetric(horizontal: 18),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Color(0xFFEEEEEE),
        ),
      ),
    ),
    child: Row(
      children: [
        // زر القائمة
        Builder(
          builder: (context) {
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.menu,
                  size: 22,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            );
          },
        ),

        const Spacer(),

        // اسم وساطة + الشعار
       Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    const Text(
      'وساطة',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: darkPurple,
      ),
    ),

    const SizedBox(width: 10),

    Container(
  width: 48,
  height: 32,
  color: Colors.yellow,
  child: SvgPicture.asset(
    'assets/images/wasata_symbol_flutter.svg',
    fit: BoxFit.contain,
  ),
),
  ],
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
            'الملف الشخصي',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF17141F),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'أجري المعلومات التي تظهر للزبائن وتابعي أداء حسابك.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              color: greyText,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROFILE CARD
  // ============================================================

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // الغلاف البنفسجي
              Container(
                height: 105,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xFF51428B),
                      Color(0xFFA50A93),
                    ],
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
              ),

              // صورة الوسيطة
              Positioned(
                right: 16,
                bottom: -31,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: lightPurple,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x18000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: purple,
                      ),
                    ),

                    // Online dot
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00C98D),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              43,
              16,
              16,
            ),
            child: Column(
              children: [
                // الاسم + وسيطة
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: lightPurple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'وسيطة',
                        style: TextStyle(
                          color: purple,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      'نور أحمد',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // التقييم والموقع
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 6),

                    Text(
                      '★★★★★',
                      style: TextStyle(
                        color: Color(0xFFFFB400),
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                    ),

                    SizedBox(width: 12),

                    Icon(
                      Icons.location_on,
                      size: 13,
                      color: Color(0xFFE55766),
                    ),

                    SizedBox(width: 4),

                    Text(
                      'غزة',
                      style: TextStyle(
                        fontSize: 11,
                        color: greyText,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // العمولة
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: lightPurple,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: const Color(0xFFEFD8FA),
                      ),
                    ),
                    child: const Text(
                      'عمولة 8%',
                      style: TextStyle(
                        color: purple,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACCOUNT CARD
  // ============================================================

  Widget _buildAccountCard() {
    return _baseCard(
      child: Column(
        children: [
          _sectionHeader(
            'بيانات الحساب',
            'تعديل',
          ),

          const Divider(height: 1),

          const SizedBox(height: 8),

          _infoRow(
            'الاسم الكامل',
            'نور أحمد',
          ),

          _infoRow(
            'البريد الإلكتروني',
            'ned@example.com',
          ),

          _infoRow(
            'رقم الهاتف',
            '+970 59 123 4567',
          ),

          _infoRow(
            'المنطقة',
            'غزة-الرمال',
            showDivider: false,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PUBLIC INFORMATION
  // ============================================================

  Widget _buildPublicInfoCard() {
    return _baseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _sectionHeader(
            'معلومات تظهر للزبائن',
            'تعديل',
          ),

          const Divider(height: 1),

          const SizedBox(height: 15),

          const Text(
            'نبذة عني',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              color: greyText,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'وسيطة SHEIN أساعد الزبائن في تنفيذ ومتابعة طلباتهم بسهولة وبأسعار معقولة. خبرة أكثر من سنتين في مجال الوساطة التجارية.',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Color(0xFF383441),
              ),
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _statusBox(
                  title: 'تستقبل\nطلبات',
                  subtitle: 'حالة الاستقبال',
                  showDot: true,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _statusBox(
                  title: '8%',
                  subtitle: 'نسبة العمولة',
                  purpleTitle: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICES
  // ============================================================

  Widget _buildServicesCard() {
    return _baseCard(
      child: Column(
        children: [
          _sectionHeader(
            'الخدمات المتاحة',
            'إدارة',
          ),

          const Divider(height: 1),

          const SizedBox(height: 14),

          _service(
            '🏠',
            'التوصيل إلى المنزل',
          ),

          _service(
            '📦',
            'الاستلام من نقطة',
          ),

          _service(
            '🔄',
            'الإرجاع أو الاستبدال',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CARD DECORATION
  // ============================================================

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: const Color(0xFFEAEAEA),
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  Widget _baseCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: _cardDecoration(),
      child: child,
    );
  }

  // ============================================================
  // SECTION HEADER
  // ============================================================

  Widget _sectionHeader(
    String title,
    String action,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 30),
            ),
            child: Text(
              action,
              style: const TextStyle(
                color: purple,
                fontSize: 12,
              ),
            ),
          ),

          const Spacer(),

          Text(
            title,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACCOUNT ROW
  // ============================================================

  Widget _infoRow(
    String label,
    String value, {
    bool showDivider = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
      ),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(
                  color: Color(0xFFF3F3F3),
                ),
              )
            : null,
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: 115,
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                color: greyText,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF252230),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATUS BOX
  // ============================================================

  Widget _statusBox({
    required String title,
    required String subtitle,
    bool purpleTitle = false,
    bool showDot = false,
  }) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showDot) ...[
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00C98D),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 7),
              ],

              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: purpleTitle ? 19 : 12,
                  height: 1.1,
                  color:
                      purpleTitle ? purple : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: greyText,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICE
  // ============================================================

  Widget _service(
    String emoji,
    String title,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: lightPurple,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFEFD9FA),
          ),
        ),
        child: Text(
          '$emoji  $title',
          style: const TextStyle(
            color: purple,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DRAWER
  // ============================================================

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.78,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Drawer header
            Container(
              height: 72,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F7),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 21,
                      ),
                    ),
                  ),

                  const Spacer(),

               SizedBox(
  width: 110,
  height: 38,
  child: Image.asset(
    'assets/images/wasata_symbol.png',
    width: 110,
    height: 38,
    fit: BoxFit.contain,
  ),
),
                ],
              ),
            ),

            const SizedBox(height: 15),

            _drawerItem(
              Icons.home,
              'الرئيسية',
            ),

            _drawerItem(
              Icons.grid_view_outlined,
              'لوحة التحكم',
            ),

            _drawerItem(
              Icons.receipt_long_outlined,
              'الطلبات',
            ),

            _drawerItem(
              Icons.inventory_2_outlined,
              'الخدمات',
            ),

            _drawerItem(
              Icons.star,
              'التقييمات',
            ),

            _drawerItem(
              Icons.person,
              'الملف الشخصي',
              selected: true,
            ),

            const Spacer(),

            const Divider(height: 1),

            // User bottom
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: lightPurple,
                    child: Icon(
                      Icons.person,
                      color: purple,
                    ),
                  ),

                  SizedBox(width: 12),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'نور أحمد',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'وسيطة',
                        style: TextStyle(
                          fontSize: 11,
                          color: greyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DRAWER ITEM
  // ============================================================

  Widget _drawerItem(
    IconData icon,
    String title, {
    bool selected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 3,
      ),
      child: Material(
        color:
            selected ? purple : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          dense: true,
          visualDensity:
              const VisualDensity(vertical: -1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          leading: Icon(
            icon,
            size: 19,
            color: selected
                ? Colors.white
                : Colors.black87,
          ),

          title: Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13,
              color: selected
                  ? Colors.white
                  : const Color(0xFF45404E),
            ),
          ),

          onTap: () {},
        ),
      ),
    );
  }
}