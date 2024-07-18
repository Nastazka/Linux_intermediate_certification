#Скрипт для сортировки файлов по владельцам

#!/bin/bash

# Проверка наличия аргумента - пути к директории
if [ $# -ne 1 ]; then
  echo "Необходимо указать путь к директории!"
  exit 1
fi

# Получение пути к директории
dir_path="$1"

# Проверка существования директории
if [ ! -d "$dir_path" ]; then
  echo "Директория '$dir_path' не существует!"
  exit 2
fi

# Цикл по файлам в директории
for file in "$dir_path"/*; do
  # Проверка, является ли файл обычным
  if [ ! -f "$file" ]; then
    continue
  fi

  # Получение имени владельца файла
  owner_name=$(stat -c "%U" "$file")

  # Создание директории с именем владельца, если она не существует
  owner_dir="$dir_path/$owner_name"
  if [ ! -d "$owner_dir" ]; then
    mkdir "$owner_dir"
  fi

  # Копирование файла в директорию владельца
  cp "$file" "$owner_dir"
done

echo "Файлы в директории '$dir_path' отсортированы и скопированы в директории по имени владельца."