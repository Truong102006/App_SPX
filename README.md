# SPX Express — Delayed Parcel Support (Flutter Windows App)

Ứng dụng **SPX Express** được phát triển bằng **Flutter** với kiến trúc phân tầng Clean Feature-First, thiết kế giao diện chuẩn 100% theo 5 màn hình mẫu (Parcel Tracking, Delayed Parcel Support, Confirm Support Request Modal, Track Support Request, Resolution Update) và tích hợp sẵn quy trình **CI/CD GitHub Actions** tự động đóng gói bản **Windows Release (`App.exe`)**.

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
├── main.dart                                      # Entry point của ứng dụng
├── core/                                          # Design System, Theme & Shared Widgets
│   ├── constants/
│   │   ├── app_colors.dart                        # Bảng màu chuẩn theo 5 màn hình mẫu
│   │   └── app_text_styles.dart                   # Typography chuẩn
│   ├── theme/
│   │   └── app_theme.dart                         # Cấu hình ThemeData toàn cục
│   └── widgets/
│       ├── iphone_mockup_frame.dart               # Khung iPhone + Status Bar + SPX Header + Bottom Nav
│       ├── spx_common_widgets.dart                # Primary/Secondary Buttons, Section Eyebrows
│       └── spx_custom_icons.dart                  # Custom Vector Icons (Parcel Box, Search Box, Truck, Route...)
├── data/
│   └── models/
│       └── parcel_sample_data.dart                # Dữ liệu mẫu (SPXVN-DEMO-261102-0042, DR-261102-0482)
└── features/                                      # Chia module theo từng tính năng để dễ mở rộng
    ├── parcel_tracking/
    │   └── presentation/screens/
    │       └── parcel_delayed_screen.dart         # Màn hình 01/06: Your parcel may be delayed
    ├── support/
    │   └── presentation/screens/
    │       ├── delayed_parcel_support_screen.dart # Màn hình 04/06: How can I help you?
    │       ├── confirm_support_request_screen.dart# Màn hình Modal: Submit Support Request?
    │       └── track_support_request_screen.dart  # Màn hình 05/06: Track Support Request
    ├── resolution/
    │   └── presentation/screens/
    │       └── resolution_update_screen.dart      # Màn hình 06/06: Resolution Update
    └── showcase/
        └── presentation/screens/
            └── screen_showcase_page.dart          # Màn hình tổng hợp xem cả 5 màn hình hoặc từng màn hình
```
