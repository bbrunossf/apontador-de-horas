from PIL import Image

# Abrir a imagem original
img = Image.open("icone_fonte.png")  # Substitua pelo nome correto do arquivo

# Lista de tamanhos padrão para ícones (.ico)
icon_sizes = [(16, 16), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)]


# Salvar como arquivo .ico com múltiplos tamanhos
img.save("iconexx.ico", format='ICO', sizes=icon_sizes)

print("Ícone gerado com sucesso: icone.ico")
