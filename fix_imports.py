import os
import re

file_map = {
    "app_bottom_nav.dart": "package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart",
    "home_screen.dart": "package:clean_go_vendor_app/features/screens/home/screens/home_screen.dart",
    "delivery_app_bar.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/delivery/delivery_app_bar.dart",
    "delivery_qr_card.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/delivery/delivery_qr_card.dart",
    "pickup_screen.dart": "package:clean_go_vendor_app/features/screens/orders/screens/pickup_screen.dart",
    "seal_screen.dart": "package:clean_go_vendor_app/features/screens/orders/screens/seal_screen.dart",
    "filter_chip_widget.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/filter_chip_widget.dart",
    "order_card.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/order_card.dart",
    "stat_card.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/stat_card.dart",
    "notifications_screen.dart": "package:clean_go_vendor_app/features/screens/notifications/screens/notifications_screen.dart",
    "notification_model.dart": "package:clean_go_vendor_app/models/notification_model.dart",
    "step_indicator.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/step_indicator.dart",
    "damage_image_box.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/damage_image_box.dart",
    "damage_chip.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/damage_chip.dart",
    "otp_input_row.dart": "package:clean_go_vendor_app/features/screens/auth/widgets/otp_input_row.dart",
    "otp_verified_screen.dart": "package:clean_go_vendor_app/features/screens/orders/screens/otp_verified_screen.dart",
    "photo_section.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/photo_section.dart",
    "item_photo_grid.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/item_photo_grid.dart",
    "master_photo_box.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/master_photo_box.dart",
    "item_summary_card.dart": "package:clean_go_vendor_app/features/screens/orders/widegts/item_summary_card.dart",
    "delivery_qr_verified_screen.dart": "package:clean_go_vendor_app/features/screens/delivery/delivery_qr_verified_screen.dart"
}

analyze_file = "analyze2.txt"

# read errors
with open(analyze_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

changes = {}

for line in lines:
    if "uri_does_not_exist" in line:
        # Example: error - lib\core\widgets\app_bottom_nav.dart:2:8 - Target of URI doesn't exist: 'package:clean_go_vendor_app/features/screens/home/home_screen.dart'. ...
        # match file name
        match = re.search(r'error - (.*?\.dart):\d+:\d+ - .*Target of URI doesn\'t exist: \'(.*?)\'', line)
        if match:
            target_file = match.group(1)
            bad_import = match.group(2)
            
            # extract the filename from bad_import
            bad_filename = bad_import.split('/')[-1]
            if bad_filename in file_map:
                new_import = file_map[bad_filename]
                
                if target_file not in changes:
                    changes[target_file] = []
                # prepare replacement
                changes[target_file].append((bad_import, new_import))

for file_path, replacements in changes.items():
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    for bad, good in set(replacements): # Use set to avoid double replace
        content = content.replace(f"import '{bad}';", f"import '{good}';")
        content = content.replace(f'import "{bad}";', f'import "{good}";')
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
        print(f"Updated {file_path}")
