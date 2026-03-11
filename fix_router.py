import os
import re

lib_dir = r"c:/Users/rishi/flutter_projects/clean_go_vendor_app/lib"

replacements = {
    # 1. Login to OTP
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*OtpScreen\(phoneNumber:\s*"\+91 9347830977"\),\s*\),\s*\);': "context.push('/otp', extra: '+91 9347830977');",
    
    # 2. OTP to Home
    r'Navigator\.pushReplacement\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*const\s*HomeScreen\(\)\),\s*\);': "context.go('/home');",

    # 3. Home to Notifications
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*NotificationsScreen\(\),\s*\),\s*\);': "context.push('/notifications');",

    # 4. Auth/Delivery/Damage -> HomeScreen (Without extra)
    r'Navigator\.pushAndRemoveUntil\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*HomeScreen\(\)\),\s*\(route\)\s*=>\s*false,\s*\);': "context.go('/home');",
    r'Navigator\.pushAndRemoveUntil\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*HomeScreen\(\)\),\s*\(route\)\s*=>\s*false,\s*\);': "context.go('/home');",
    r'Navigator\.pushReplacement\(\s*context,\s*MaterialPageRoute\(builder:\s*\(context\)\s*=>\s*const\s*HomeScreen\(\)\),\s*\);': "context.go('/home');",
    r'Navigator\.pushReplacement\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*HomeScreen\(\)\),\s*\);': "context.go('/home');",

    # 5. OTP Verified to Home (with extra)
    r'Navigator\.pushAndRemoveUntil\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*HomeScreen\(showPickupBanner:\s*true\),\s*\),\s*\(route\)\s*=>\s*false,\s*\);': "context.go('/home', extra: true);",

    # 6. Basic Navigator Pushes
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder:\s*\(context\)\s*=>\s*const\s*DamageScreen\(\)\),\s*\);': "context.push('/damage');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder:\s*\(context\)\s*=>\s*SealScreen\(\)\),\s*\);': "context.push('/seal');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*PickupScreen\(\)\),\s*\);': "context.push('/pickup');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*SealScreen\(\)\),\s*\);': "context.push('/seal');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*PickupOtpScreen\(\),\s*\),\s*\);': "context.push('/pickup-otp');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*OtpVerifiedScreen\(\),\s*\),\s*\);': "context.push('/otp-verified');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*DeliveryChecklistScreen\(\)\),\s*\);': "context.push('/delivery-checklist');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*DeliveryOtpScreen\(\),\s*\),\s*\);': "context.push('/delivery-otp');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*DeliveryOtpVerificationScreen\(\),\s*\),\s*\);': "context.push('/delivery-otp-verification');",
    r'Navigator\.pushReplacement\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*DeliveryOtpVerifiedScreen\(\),\s*\),\s*\);': "context.replace('/delivery-otp-verified');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*DeliveryQrVerifiedScreen\(\),\s*\),\s*\);': "context.push('/delivery-qr-verified');",
    r'Navigator\.pushAndRemoveUntil\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\(_\)\s*=>\s*const\s*DeliveryCompletedScreen\(\),\s*\),\s*\(route\)\s*=>\s*false,\s*\);': "context.go('/delivery-completed');",
    r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*DeliveryQrVerifiedScreen\(\)\),\s*\);': "context.push('/delivery-qr-verified');",

    # Bottom Nav
    r'Navigator\.pushReplacement\(\s*context,\s*MaterialPageRoute\(builder:\s*\(_\)\s*=>\s*screen\),\s*\);': "if (screen is HomeScreen) {\n          context.go('/home');\n        } else if (screen is ProcessingScreen) {\n          context.go('/processing');\n        } else if (screen is DeliveryScreen) {\n          context.go('/delivery');\n        } else if (screen is HistoryScreen) {\n          context.go('/history');\n        }"

}

import_statement = "import 'package:go_router/go_router.dart';\n"

for root, dirs, files in os.walk(lib_dir):
    for file in files:
        if file.endswith('.dart') and file != 'app_router.dart':
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()

            new_content = content
            for old, new in replacements.items():
                new_content = re.sub(old, new, new_content)

            if new_content != content:
                # Add go_router import if missing
                if "import 'package:go_router/go_router.dart';" not in new_content:
                    lines = new_content.splitlines()
                    last_import_idx = 0
                    for i, line in enumerate(lines):
                        if line.startswith('import '):
                            last_import_idx = i
                    lines.insert(last_import_idx + 1, "import 'package:go_router/go_router.dart';")
                    new_content = "\n".join(lines) + "\n"

                with open(filepath, 'w', encoding='utf-8') as fh:
                    fh.write(new_content)
