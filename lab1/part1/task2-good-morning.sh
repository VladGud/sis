#!/bin/bash

# Функция для вывода пожелания доброго утра
greet_user() {
    echo "Доброе утро!"
}

# Функция для вывода текущего времени
display_current_time() {
    echo "Текущее время: $(date +"%H:%M:%S")"
}

# Функция для вывода календаря на текущий месяц
display_calendar() {
    echo -e "\nКалендарь на текущий месяц:"
    ncal
}

# Функция для вывода списка дел из файла TODO в домашнем каталоге пользователя
display_todo_list() {
    home_dir=~
    todo_file="$home_dir/TODO"

    if [ -f "$todo_file" ]; then
        echo -e "\nСписок дел из файла TODO:"
        cat "$todo_file"
    else
        echo -e "\nФайл TODO не найден в вашем домашнем каталоге."
    fi
}

# Основная функция, вызывающая остальные функции по порядку
main() {
    greet_user
    display_current_time
    display_calendar
    display_todo_list
}

# Запуск основной функции
main
