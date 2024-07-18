#Скрипт очистки директорий

#!/bin/bash

# Проверка наличия аргумента - пути к директории
if [ $# -ne 1 ]; then
  echo "Необходимо указать путь к директории!"
  exit 1
fi

# Проверка существования директории
dir_path="$1"
if [ ! -d "$dir_path" ]; then
  echo "Директория '$dir_path' не существует!"
  exit 2
fi

# Поиск файлов с расширениями .bak, .tmp, .backup
find "$dir_path" -type f -name '*.bak' -o -name '*.tmp' -o -name '*.backup'

# Удаление найденных файлов
while read -r file; do
  rm -f "$file"
done

echo "Файлы с расширениями .bak, .tmp, .backup в директории '$dir_path' удалены."