import os

fixes = [
    (r"c:\Users\thelu\Desktop\4to Semestre\Topicos\1era unidad\Proyecto 1.0\veterinaria-ui-flutter\lib\screens\blog_page.dart", [417, 731]),
    (r"c:\Users\thelu\Desktop\4to Semestre\Topicos\1era unidad\Proyecto 1.0\veterinaria-ui-flutter\lib\screens\contacto_page.dart", [11, 517, 530]),
    (r"c:\Users\thelu\Desktop\4to Semestre\Topicos\1era unidad\Proyecto 1.0\veterinaria-ui-flutter\lib\screens\nosotros_page.dart", [319]),
    (r"c:\Users\thelu\Desktop\4to Semestre\Topicos\1era unidad\Proyecto 1.0\veterinaria-ui-flutter\lib\screens\servicios_page.dart", [441]),
    (r"c:\Users\thelu\Desktop\4to Semestre\Topicos\1era unidad\Proyecto 1.0\veterinaria-ui-flutter\lib\widgets\pie_de_pagina.dart", [104])
]

for filepath, lines in fixes:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.readlines()
    
    for l in lines:
        idx = l - 1
        # carefully replace the first occurrence of 'const ' (or ' const ')
        if ' const ' in content[idx]:
            content[idx] = content[idx].replace(' const ', ' ', 1)
        elif 'const ' in content[idx]:
            content[idx] = content[idx].replace('const ', '', 1)
        
    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(content)
