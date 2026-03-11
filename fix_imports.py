import os
import re

lib_dir = r"c:/Users/rishi/flutter_projects/clean_go_vendor_app/lib"

features = ['auth', 'history', 'home', 'notifications', 'orders']

for root, dirs, files in os.walk(lib_dir):
    for file in files:
        if file.endswith('.dart'):
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()

            new_content = content
            for feature in features:
                new_content = re.sub(
                    rf'package:clean_go_vendor_app/features/{feature}/screens/',
                    f'package:clean_go_vendor_app/features/{feature}/presentation/screens/',
                    new_content
                )
                new_content = re.sub(
                    rf'package:clean_go_vendor_app/features/{feature}/widgets/',
                    f'package:clean_go_vendor_app/features/{feature}/presentation/widgets/',
                    new_content
                )
                new_content = re.sub(
                    rf'package:clean_go_vendor_app/features/{feature}/providers/',
                    f'package:clean_go_vendor_app/features/{feature}/presentation/providers/',
                    new_content
                )
                new_content = re.sub(
                    rf'package:clean_go_vendor_app/features/{feature}/models/',
                    f'package:clean_go_vendor_app/features/{feature}/domain/models/',
                    new_content
                )
                
            if new_content != content:
                with open(filepath, 'w', encoding='utf-8') as fh:
                    fh.write(new_content)
