import 'package:flutter/material.dart';

enum AppLanguage { english, vietnamese }

/// Language is shared by every screen for the lifetime of the app session.
class AppLanguageScope extends InheritedWidget {
  final AppLanguage language;
  final ValueChanged<AppLanguage> onChanged;

  const AppLanguageScope(
      {super.key,
      required this.language,
      required this.onChanged,
      required super.child});

  static AppLanguageScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppLanguageScope>();

  static String translate(BuildContext context, String text) =>
      maybeOf(context)?.language == AppLanguage.vietnamese
          ? translateVietnamese(text)
          : text;

  @override
  bool updateShouldNotify(AppLanguageScope oldWidget) =>
      language != oldWidget.language;
}

/// Keeps const screen layouts possible while subscribing each label to language changes.
class LocalizedText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  const LocalizedText(this.data,
      {super.key, this.style, this.textAlign, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) =>
      Text(AppLanguageScope.translate(context, data),
          style: style,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow);
}

String translateVietnamese(String text) {
  if (_vietnamese.containsKey(text)) return _vietnamese[text]!;
  // Only descriptive phrases and explicit label prefixes participate in composed
  // messages. Short labels such as "Sorting" must never alter address data.
  return text.replaceAllMapped(
      _composedPattern, (match) => _vietnamese[match.group(0)]!);
}

final _phrases = _vietnamese.entries.toList()
  ..sort((a, b) => b.key.length.compareTo(a.key.length));
final _composedPattern = RegExp(_phrases
    .where((entry) =>
        entry.key.length >= 20 ||
        entry.key == 'Awaiting sorting' ||
        entry.key == 'sorting backlog.' ||
        entry.key.endsWith(': ') ||
        const ['To ', 'Left ', 'Before ', '\non '].contains(entry.key))
    .map((entry) => RegExp.escape(entry.key))
    .join('|'));

const Map<String, String> _vietnamese = {
  'Delivery service: SPX Instant (Express)':
      'Hình thức giao hàng: SPX Instant (Giao hỏa tốc)',
  'My Promo Codes': 'Mã ưu đãi',
  'Voucher received!': 'Nhận voucher thành công!',
  'A gift from SPX': 'Quà xin lỗi từ SPX',
  'Demo vouchers • Not redeemable':
      'Voucher demo • Không có giá trị sử dụng thực tế',
  'Saved to My Promo Codes.': 'Voucher đã được lưu vào Mã ưu đãi.',
  'SPX apologizes for the delay. Please choose one complimentary demo voucher.':
      'SPX xin lỗi bạn vì đơn hàng giao chậm. Xin gửi tặng bạn một voucher demo, vui lòng chọn một trong hai ưu đãi bên dưới.',
  'Demo data only. Valid for 15 days from receipt.':
      'Dữ liệu mẫu. Có hiệu lực 15 ngày kể từ lúc nhận.',
  'Shopee: 10% off': 'Shopee: giảm 10%',
  'SPX: shipping discount': 'SPX: giảm phí vận chuyển',
  '10% off, no order value limit or discount cap.':
      'Giảm 10%, không giới hạn giá trị đơn hàng và số tiền giảm.',
  'Save up to 30,000 VND on one SPX shipment.':
      'Giảm phí vận chuyển tối đa 30.000đ cho một đơn SPX.',
  'Choose Shopee voucher': 'Chọn voucher Shopee',
  'Choose SPX voucher': 'Chọn voucher SPX',
  'Expires': 'Hạn dùng',
  'Done': 'Hoàn tất',
  "Pending Orders (Delayed Parcels)": "Đơn đang xử lý (giao chậm)",
  "STUDENT PROJECT · SAMPLE DATA · UNOFFICIAL":
      "DỰ ÁN SINH VIÊN · DỮ LIỆU MẪU · KHÔNG CHÍNH THỨC",
  "Closed · 08:00, 03/11/2026 ICT": "Đã đóng · 08:00, 03/11/2026 ICT",
  "Sorting delay resolved. Your parcel is on its\nway to the next facility, not yet delivered.\nRequest DR-261102-0482 closed at 08:00,\n03/11/2026 ICT.":
      "Đã xử lý chậm phân loại. Đơn hàng đang\nđến cơ sở tiếp theo, chưa giao đến bạn.\nYêu cầu DR-261102-0482 đã đóng lúc 08:00,\n03/11/2026 ICT.",
  "Local hub delay resolved. Your parcel has been\nprioritized for SPX Instant delivery today.\nRequest DR-261102-0819 closed at 08:00,\n03/11/2026 ICT.":
      "Đã xử lý chậm tại kho khu vực. Đơn hàng\nđược ưu tiên giao qua SPX Instant hôm nay.\nYêu cầu DR-261102-0819 đã đóng lúc 08:00,\n03/11/2026 ICT.",
  "Linehaul delay resolved. Your parcel has docked\nat the destination hub, not yet delivered.\nRequest DR-261102-0954 closed at 08:00,\n03/11/2026 ICT.":
      "Đã xử lý chậm vận chuyển liên kho. Đơn\nđã đến kho đích, chưa giao đến bạn.\nYêu cầu DR-261102-0954 đã đóng lúc 08:00,\n03/11/2026 ICT.",
  "Local hub hold resolved. Assigned to SPX Instant\ncourier for priority drop-off today.\nRequest DR-261102-1102 closed at 08:00,\n03/11/2026 ICT.":
      "Đã xử lý lưu kho. Đơn đã được giao cho\nnhân viên SPX Instant để ưu tiên giao hôm nay.\nYêu cầu DR-261102-1102 đã đóng lúc 08:00,\n03/11/2026 ICT.",
  "Connecting to live SPX Support Agent for ":
      "Đang kết nối nhân viên SPX để hỗ trợ đơn ",
  "Eligible! Your parcel has been at ": "Đủ điều kiện! Đơn hàng đã ở ",
  " for 1–2 days. Upgraded to SPX Instant (Express) delivery!":
      " trong 1–2 ngày. Đã nâng cấp sang giao SPX Instant (Hỏa tốc)!",
  "Note: Parcel ": "Lưu ý: Đơn hàng ",
  " is currently at ": " hiện đang ở ",
  ". Urgent SPX Instant support applies once it reaches your local area hub for 1–2 days without update (try order #0189 or #0527).":
      ". Hỗ trợ giao gấp SPX Instant áp dụng khi đơn ở kho khu vực 1–2 ngày chưa cập nhật (thử đơn #0189 hoặc #0527).",
  "Settings": "Cài đặt",
  "Language": "Ngôn ngữ",
  "Close": "Đóng",
  "Tier": "Hạng",
  "Member": "Thành viên",
  "My Points": "Điểm của tôi",
  "0 Points": "0 điểm",
  "Order Statistics": "Thống kê đơn hàng",
  "Data from the last 7 days": "Dữ liệu trong 7 ngày qua",
  "Processing": "Đang xử lý",
  "Completed": "Hoàn tất",
  "Exceptions/Other": "Sự cố/Khác",
  "My Utilities": "Tiện ích của tôi",
  "Pending\nOrders": "Đơn hàng\nđang xử lý",
  "Delayed Parcel\nSupport": "Hỗ trợ đơn\ngiao chậm",
  "My Promo\nCodes": "Mã\nưu đãi",
  "Print\nWaybill": "In\nvận đơn",
  "Product\nList": "Danh sách\nsản phẩm",
  "Order\nSettings": "Cài đặt\nđơn hàng",
  "Address\nBook": "Sổ\nđịa chỉ",
  "Staff\nManagement": "Quản lý\nnhân viên",
  "Support\nCenter": "Trung tâm\nhỗ trợ",
  "NEW": "MỚI",
  "Home": "Trang chủ",
  "Parcels": "Đơn hàng",
  "Support": "Hỗ trợ",
  "Account": "Tài khoản",
  "Pending Orders": "Đơn hàng đang xử lý",
  "At local hub (1–2 days)": "Tại kho khu vực (1–2 ngày)",
  "Delayed in transit": "Chậm vận chuyển",
  "Location: ": "Vị trí: ",
  "Destination: ": "Nơi nhận: ",
  "Delay reason: ": "Lý do chậm: ",
  "Track & Support Delayed Parcel →": "Theo dõi và hỗ trợ đơn giao chậm →",
  "PARCEL TRACKING": "THEO DÕI ĐƠN HÀNG",
  "Your parcel may be delayed": "Đơn hàng có thể giao chậm",
  "Copied tracking ID: ": "Đã sao chép mã vận đơn: ",
  "Your parcel may arrive later than\nexpected.":
      "Đơn hàng có thể đến muộn hơn\ndự kiến.",
  "Verified reason: ": "Lý do đã xác minh: ",
  "LAST RECORDED LOCATION": "VỊ TRÍ GHI NHẬN GẦN NHẤT",
  "Updated: ": "Cập nhật: ",
  "View parcel details": "Xem chi tiết đơn hàng",
  "Delivery progress": "Tiến trình giao hàng",
  "Next Status Update: ": "Cập nhật trạng thái tiếp theo: ",
  "Delay alert: ": "Cảnh báo giao chậm: ",
  "Enter tracking ID (e.g., 0042, 0189)...":
      "Nhập mã vận đơn (VD: 0042, 0189)...",
  "Search": "Tìm kiếm",
  "Orders": "Đơn hàng",
  "Picked up": "Đã lấy hàng",
  "Sorting": "Phân loại",
  "In transit": "Đang vận chuyển",
  "Delivered": "Đã giao",
  "REASON FOR THE DELAY": "LÝ DO GIAO CHẬM",
  "Why is my parcel delayed?": "Vì sao đơn hàng giao chậm?",
  "To ": "Đến ",
  "SAMPLE": "MẪU",
  "Verified": "Đã xác minh",
  "Processing stage: ": "Giai đoạn xử lý: ",
  "DELAY REASON (HIGHLIGHTED)": "LÝ DO GIAO CHẬM",
  "Verified: ": "Xác minh: ",
  "Sample verification for this project;\nnot a direct confirmation from SPX.":
      "Xác minh mẫu cho dự án này;\nkhông phải xác nhận trực tiếp từ SPX.",
  "No need to resubmit your request yet.\nCheck the next update for the latest information.":
      "Chưa cần gửi lại yêu cầu.\nVui lòng xem thông tin cập nhật tiếp theo.",
  "View update time": "Xem thời gian cập nhật",
  "Updates are provided even if the status is unchanged.":
      "Vẫn cập nhật khi trạng thái không thay đổi.",
  "TWO DIFFERENT TIMEFRAMES": "HAI MỐC THỜI GIAN KHÁC NHAU",
  "Delivery time and\nstatus updates":
      "Thời gian giao hàng và\ncập nhật trạng thái",
  "Estimated Delivery Time": "Thời gian giao hàng dự kiến",
  "When your parcel is expected to arrive.\nThis is an estimate and may change.":
      "Thời điểm đơn hàng dự kiến đến.\nThời gian này có thể thay đổi.",
  "Next Status Update": "Cập nhật trạng thái tiếp theo",
  "When SPX expects to share a status update.\nThis is not the delivery time.":
      "Thời điểm SPX dự kiến cập nhật trạng thái.\nĐây không phải thời gian giao hàng.",
  "Delayed Parcel Support": "Hỗ trợ đơn giao chậm",
  "Review parcel details": "Xem lại chi tiết đơn hàng",
  "All times use Vietnam time · ICT (UTC+7).":
      "Tất cả theo giờ Việt Nam · ICT (UTC+7).",
  "DELAYED PARCEL SUPPORT": "HỖ TRỢ ĐƠN GIAO CHẬM",
  "How can I help you?": "Bạn cần hỗ trợ gì?",
  "Check your parcel status": "Kiểm tra trạng thái đơn hàng",
  "Recorded: ": "Ghi nhận: ",
  "Verified in this sample scenario\n": "Đã xác minh trong tình huống mẫu\n",
  "Estimated delivery: ": "Giao hàng dự kiến: ",
  "View details and Next Status Update":
      "Xem chi tiết và lần cập nhật tiếp theo",
  "Or speak with a support agent": "Hoặc trao đổi với nhân viên hỗ trợ",
  "Contact a support agent": "Liên hệ nhân viên hỗ trợ",
  "Request a callback": "Yêu cầu gọi lại",
  "Callback scheduled! An SPX specialist will call you within 15 minutes.":
      "Đã hẹn gọi lại! Nhân viên SPX sẽ gọi trong 15 phút.",
  "Submit Support Request": "Gửi yêu cầu hỗ trợ",
  "Request urgent delivery support": "Yêu cầu hỗ trợ giao gấp",
  "ELIGIBLE": "ĐỦ ĐIỀU KIỆN",
  "Only supported when your parcel has reached your local area hub for 1–2 days without delivery or status updates; your parcel will be delivered via SPX Instant (Express).":
      "Áp dụng khi đơn hàng đã ở kho khu vực 1–2 ngày mà chưa giao hoặc cập nhật trạng thái; đơn sẽ được giao qua SPX Instant (Hỏa tốc).",
  "CONFIRM REQUEST - SAMPLE DATA": "XÁC NHẬN YÊU CẦU - DỮ LIỆU MẪU",
  "Submit Support Request?": "Gửi yêu cầu hỗ trợ?",
  "Parcel details and tracking history will be included.\nYou can go back if you are not ready to submit.":
      "Yêu cầu gồm chi tiết và lịch sử đơn hàng.\nBạn có thể quay lại nếu chưa sẵn sàng gửi.",
  "Confirm and submit": "Xác nhận và gửi",
  "Go back without submitting": "Quay lại, chưa gửi",
  "Once submitted, track it under Support Request.":
      "Sau khi gửi, theo dõi tại Yêu cầu hỗ trợ.",
  "Student project · Sample data · Unofficial":
      "Dự án sinh viên · Dữ liệu mẫu · Không chính thức",
  "SUPPORT REQUEST PROGRESS": "TIẾN TRÌNH YÊU CẦU HỖ TRỢ",
  "Track Support Request": "Theo dõi yêu cầu hỗ trợ",
  "This tracks your support request, not delivery progress.":
      "Đây là tiến trình hỗ trợ, không phải giao hàng.",
  "RELATED PARCEL": "ĐƠN HÀNG LIÊN QUAN",
  "In transit · Not yet delivered": "Đang vận chuyển · Chưa giao",
  "Left ": "Đã rời ",
  "SUPPORT REQUEST ID": "MÃ YÊU CẦU HỖ TRỢ",
  "Closed": "Đã đóng",
  "Request received": "Đã nhận yêu cầu",
  "In progress": "Đang xử lý",
  "Awaiting an update": "Chờ cập nhật",
  "View Resolution Update": "Xem kết quả xử lý",
  "Support update: ": "Cập nhật hỗ trợ: ",
  "No further updates: request closed.": "Không còn cập nhật: yêu cầu đã đóng.",
  "Callback requested (within 15m)": "Đã yêu cầu gọi lại (trong 15 phút)",
  "Support case closed; parcel not yet delivered.":
      "Đã đóng yêu cầu; đơn hàng chưa được giao.",
  "RESOLUTION UPDATE · 03/11/2026": "KẾT QUẢ XỬ LÝ · 03/11/2026",
  "Resolution Update": "Kết quả xử lý",
  "Your parcel status has been updated.\n":
      "Trạng thái đơn hàng đã được cập nhật.\n",
  "VERIFIED · IN TRANSIT": "ĐÃ XÁC MINH · ĐANG VẬN CHUYỂN",
  "Est. delivery · Subject to change": "Giao dự kiến · Có thể thay đổi",
  "Support Request resolved": "Yêu cầu hỗ trợ đã được xử lý",
  "Back to parcel tracking": "Quay lại theo dõi đơn hàng",
  "Contact support again": "Liên hệ hỗ trợ lần nữa",
  "Awaiting sorting": "Chờ phân loại",
  "sorting backlog.": "tồn đọng phân loại.",
  "A hub backlog is delaying sorting.\nYour parcel cannot move to the next\nfacility until sorting is complete.":
      "Kho đang tồn đọng nên phân loại chậm.\nĐơn hàng sẽ chuyển tới cơ sở tiếp theo\nkhi phân loại xong.",
  "Left the sorting hub": "Đã rời kho phân loại",
  "At local hub (2 days without update)":
      "Tại kho khu vực (2 ngày chưa cập nhật)",
  "local courier shortage (held 2 days at local hub).":
      "thiếu nhân viên giao hàng (lưu kho 2 ngày).",
  "Your parcel arrived at your local delivery hub\n2 days ago, but dispatch is delayed due to high\ncourier volume in your area.":
      "Đơn đã đến kho khu vực 2 ngày trước,\nnhưng xuất kho chậm do lượng hàng\ncần giao trong khu vực tăng cao.",
  "Dispatched via SPX Instant": "Đã chuyển giao SPX Instant",
  "Linehaul transit delay": "Chậm vận chuyển liên kho",
  "linehaul truck congestion.": "ùn tắc xe vận chuyển liên kho.",
  "Heavy traffic on the inter-hub route is delaying\nlinehaul arrival. Your parcel will be scanned as\nsoon as the transport truck docks.":
      "Ùn tắc trên tuyến liên kho làm xe đến chậm.\nĐơn hàng sẽ được quét ngay khi\nxe vận chuyển tới kho.",
  "Arrived at District 7 Hub": "Đã đến kho Quận 7",
  "At local hub (1 day without update)":
      "Tại kho khu vực (1 ngày chưa cập nhật)",
  "oversized parcel awaiting local dispatch (1 day).":
      "hàng cồng kềnh chờ xuất kho (1 ngày).",
  "Your parcel has reached your local hub for over\n24 hours without delivery update while awaiting\na dedicated vehicle for bulky items.":
      "Đơn đã ở kho khu vực hơn 24 giờ\nchưa có cập nhật giao hàng do đang chờ\nxe chuyên chở hàng cồng kềnh.",
  "Out for delivery (SPX Instant)": "Đang giao hàng (SPX Instant)",
  "Before ": "Trước ",
  "\non ": "\nngày ",
  "0. Account & Utilities": "0. Tài khoản và tiện ích",
  "1. Parcel Tracking (01/06)": "1. Theo dõi đơn hàng (01/06)",
  "2. Reason for Delay (02/06)": "2. Lý do giao chậm (02/06)",
  "3. Delivery Timeframes (03/06)": "3. Thời gian giao hàng (03/06)",
  "4. Delayed Support (04/06)": "4. Hỗ trợ giao chậm (04/06)",
  "5. Confirm Request Modal": "5. Xác nhận yêu cầu",
  "6. Track Request (05/06)": "6. Theo dõi yêu cầu (05/06)",
  "7. Resolution Update (06/06)": "7. Kết quả xử lý (06/06)",
  "Express UI Showcase": "Trình diễn giao diện Express",
  "All 8 Screens (Account + 01/06 → 06/06)":
      "Tất cả 8 màn hình (Tài khoản + 01/06 → 06/06)",
  "SPX Express · Student Project Demo": "SPX Express · Bản mẫu dự án sinh viên",
};
