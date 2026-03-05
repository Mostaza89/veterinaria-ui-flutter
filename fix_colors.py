import os
import re

lib_dir = r"c:\Users\thelu\Desktop\4to Semestre\Topicos\1era unidad\Proyecto 1.0\veterinaria-ui-flutter\lib"

# Replacements to apply
replacements = [
    (r'(?<!\.)Colors\.white', r'Theme.of(context).cardColor'),
    (r'(const\s+)?Color\(0xFFFAFAFA\)', r'Theme.of(context).scaffoldBackgroundColor'),
    (r'(const\s+)?Color\(0xFFEEEEEE\)', r'Theme.of(context).dividerColor'),
    (r'(const\s+)?Color\(0xFFE0E0E0\)', r'Theme.of(context).colorScheme.surfaceContainerHighest'),
    (r'(const\s+)?Color\(0xFFF1FBFF\)', r'Theme.of(context).colorScheme.surface'),
    (r'(const\s+)?Color\(0xFFE1F5FE\)', r'Theme.of(context).colorScheme.primaryContainer'),
    (r'(const\s+)?Color\(0xFF29B6F6\)', r'Theme.of(context).colorScheme.primary'),
    (r'(const\s+)?Color\(0xFF0288D1\)', r'Theme.of(context).colorScheme.onPrimaryContainer'),
    (r'(const\s+)?Color\(0xFF4FC3F7\)', r'Theme.of(context).colorScheme.secondary'),
    (r'Colors\.blueGrey\[900\]', r'Theme.of(context).textTheme.titleLarge?.color'),
    (r'Colors\.blueGrey\[800\]', r'Theme.of(context).textTheme.titleMedium?.color'),
    (r'Colors\.blueGrey\[700\]', r'Theme.of(context).textTheme.bodyLarge?.color'),
    (r'Colors\.blueGrey\[600\]', r'Theme.of(context).textTheme.bodyMedium?.color'),
    (r'Colors\.blueGrey\[500\]', r'Theme.of(context).textTheme.bodyMedium?.color'),
    (r'Colors\.blueGrey\[400\]', r'Theme.of(context).textTheme.bodySmall?.color'),
    (r'Colors\.blueGrey\[50\]', r'Theme.of(context).colorScheme.surfaceContainerHighest'),
    (r'Colors\.black87', r'Theme.of(context).iconTheme.color'),
    (r'Colors\.black38', r'Theme.of(context).disabledColor'),
]

# Need to fix 'const' arrays because of Theme.of(context)
const_patterns = [
    (r'children:\s*const\s*\[', r'children: ['),
    (r'child:\s*const\s*Row\(', r'child: Row('),
    (r'child:\s*const\s*Column\(', r'child: Column('),
    (r'(?<!=)\s*const\s+Icon\(', r' Icon('),
    (r'(?<!=)\s*const\s+Text\(', r' Text('),
    (r'(?<!=)\s*const\s+TextSpan\(', r' TextSpan('),
    (r'(?<!=)\s*const\s+BoxDecoration\(', r' BoxDecoration('),
    (r'(?<!=)\s*const\s+Border\.all\(', r' Border.all('),
]

for root, _, files in os.walk(lib_dir):
    for filename in files:
        if filename.endswith(".dart"):
            filepath = os.path.join(root, filename)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()

            new_content = content
            for p, r in replacements:
                new_content = re.sub(p, r, new_content)

            # If we replaced Colors with Theme.of(context), we almost certainly broke some const constructors
            # So let's strip const in those lines or comprehensively if Theme.of is in the statement
            if 'Theme.of(context)' in new_content and new_content != content:
                for p, r in const_patterns:
                    new_content = re.sub(p, r, new_content)
                new_content = new_content.replace('const _FacilityCard', '_FacilityCard')
                new_content = new_content.replace('const _PricingCard', '_PricingCard')
                new_content = new_content.replace('const _TestimonialCard', '_TestimonialCard')
                new_content = new_content.replace('const _ServiceDetailCard', '_ServiceDetailCard')
                new_content = new_content.replace('const _EmergencyCard', '_EmergencyCard')
                new_content = new_content.replace('const _DoctorProfile', '_DoctorProfile')
                new_content = new_content.replace('const _ServiceCard', '_ServiceCard')

            if new_content != content:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"Updated {filename}")
