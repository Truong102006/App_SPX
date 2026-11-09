# SPX Express — Delayed Parcel Support (Flutter Windows App)

Ứng dụng **SPX Express** được phát triển bằng **Flutter** với kiến trúc phân tầng Clean Feature-First, thiết kế giao diện chuẩn 100% theo trọn bộ **7 màn hình mẫu (`01 / 06` đến `06 / 06` + `Confirm Support Request Modal`)** và tích hợp sẵn quy trình **CI/CD GitHub Actions** tự động đóng gói bản **Windows Release (`App.exe`)**.

---

## Quy trình Build & Phát hành tự động (GitHub Actions)

1. **Push code lên GitHub** (`main` branch).
2. **GitHub Actions** (`.github/workflows/build_windows.yml`) tự động khởi chạy máy ảo `windows-latest`, cài đặt Flutter SDK và chạy lệnh:
   ```bash
   flutter build windows --release
   ```
3. Tự động tạo file thực thi **`App.exe`** trong thư mục `build/windows/x64/runner/Release` và lưu toàn bộ thư mục `Release` thành **Artifact ZIP** (`SPX-Express-Windows-Release`).
4. **Khách hàng tải file ZIP** từ mục **Actions → Artifacts**, giải nén và mở trực tiếp **`App.exe`** (không cần cài đặt Flutter).

---

## Cấu trúc thư mục (Scalable Feature-First Architecture)

```text
lib/
├── main.dart                                           # Entry point của ứng dụng
├── core/                                               # Design System, Theme & Shared Widgets
│   ├── constants/
│   │   ├── app_colors.dart                             # Bảng màu chuẩn theo 7 màn hình mẫu
│   │   └── app_text_styles.dart                        # Typography chuẩn
│   ├── theme/
│   │   └── app_theme.dart                              # Cấu hình ThemeData toàn cục
│   └── widgets/
│       ├── iphone_mockup_frame.dart                    # Khung iPhone + Status Bar + SPX Header + Bottom Nav
│       ├── spx_common_widgets.dart                     # Primary/Secondary Buttons, Section Eyebrows
│       └── spx_custom_icons.dart                       # Custom Vector Icons (Parcel Box, Warehouse, Calendar, Speech Bubble, Truck, Route...)
├── data/
│   └── models/
│       └── parcel_sample_data.dart                     # Dữ liệu mẫu (SPXVN-DEMO-261102-0042, DR-261102-0482)
└── features/                                           # Chia module theo từng tính năng để dễ mở rộng
    ├── parcel_tracking/
    │   └── presentation/screens/
    │       ├── parcel_delayed_screen.dart              # Màn hình 01/06: Your parcel may be delayed
    │       ├── reason_for_delay_screen.dart            # Màn hình 02/06: Why is my parcel delayed?
    │       └── delivery_time_updates_screen.dart       # Màn hình 03/06: Delivery time and status updates
    ├── support/
    │   └── presentation/screens/
    │       ├── delayed_parcel_support_screen.dart      # Màn hình 04/06: How can I help you?
    │       ├── confirm_support_request_screen.dart     # Màn hình Modal: Submit Support Request?
    │       └── track_support_request_screen.dart       # Màn hình 05/06: Track Support Request
    ├── resolution/
    │   └── presentation/screens/
    │       └── resolution_update_screen.dart           # Màn hình 06/06: Resolution Update
    └── showcase/
        └── presentation/screens/
            └── screen_showcase_page.dart               # Màn hình tổng hợp xem cả 7 màn hình hoặc từng màn hình
```

## Chuyển ngôn ngữ

Web demo công khai: https://spx-express-demo.pages.dev — mở trực tiếp bằng trình duyệt, không cần chạy mã nguồn. Hướng dẫn cập nhật: [docs/deployment.md](docs/deployment.md).


Bấm biểu tượng cài đặt (hình lục giác) ở góc trên bên phải màn hình tài khoản, sau đó chọn **English** hoặc **Tiếng Việt**. Giao diện cập nhật ngay và giữ lựa chọn khi chuyển màn hình trong phiên sử dụng. Mở lại ứng dụng sẽ dùng tiếng Anh mặc định. Mã vận đơn, tên sản phẩm và dữ liệu địa chỉ được giữ nguyên.

## Luồng giao hỏa tốc và voucher demo

Chọn **Yêu cầu hỗ trợ giao gấp** để xem xác nhận có nhãn giao hỏa tốc. Sau khi gửi, màn hình theo dõi hiển thị quà xin lỗi: chọn voucher Shopee giảm 10% không giới hạn giá trị đơn/số tiền giảm, hoặc SPX giảm phí vận chuyển tối đa 30.000đ cho một đơn. Voucher có hiệu lực 15 ngày từ lúc nhận, được lưu trong **Mã ưu đãi** cùng các voucher mẫu. Dữ liệu chỉ lưu trong phiên chạy, không có giá trị sử dụng thực tế. Luồng gửi yêu cầu thông thường vẫn hoạt động riêng.

## Bản Windows portable

Sau khi build, mở `Release_App/App.exe`. Khi gửi ứng dụng sang máy khác, gửi file `SPX-Express-Windows-Release.zip`, giải nén toàn bộ và giữ `App.exe`, `flutter_windows.dll` cùng thư mục `data` cạnh nhau.

Build lại trên Windows:

```powershell
flutter pub get
flutter test
flutter build windows --release
```
