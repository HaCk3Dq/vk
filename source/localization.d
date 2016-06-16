/*
Copyright 2016 HaCk3D, substanceof

https://github.com/HaCk3Dq
https://github.com/substanceof

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

module localization;

import std.stdio, std.conv, std.string, std.process, utils;

struct lang {
  string en;
  string ru;
}

const int
  En = 0,
  Ru = 1;
  Ua = 2;

__gshared {
  private lang[string] local;
  private int currentLang = 0;
}

void setEnvLanguage() {
  string output = environment["LANG"];
  currentLang = output.indexOf("RU") != -1 ? Ru : En;
}

void localize() {
  local["e_start_browser"] = lang("You need to copy access token from your web browser. Would you like to launch it now? [Y/n]", "Необходимо скопировать ваш access token из веб-браузера. Хотите запустить его сейчас? [Y/n]", "Вам потрібно скопіювати ваш access token з вашого веб браузеру. Ви хочеше запустити його зараз ? [Y/n]");
  local["e_token_link"] = lang("Follow this link to get your access_token: ", "Перейдите по следующей ссылке, чтобы получить ваш access_token: ", "Перейдіть за наступним посиланням задля отримання вашого access_token:");
  local["e_token_info"] = lang("Please allow access to your data and then copy link from the address bar.", "Пожалуйста, разрешите приложению доступ к вашим данным, а затем скопируйте содержимое адресной строки.", "Будь ласка дозвольте додатку доступ до ваших данних, а потім скопіюйте вміст адресної стрічки.");
  local["e_input_token"] = lang("Insert your link here: ", "Вставьте адрес из браузера сюда:  ", "Вставте адресу з браузера сюди: ");
  local["e_wrong_token"] = lang("Wrong token, try again\n", "Неверный access token, попробуйте еще раз", "Невірний access token, спробуйте ще");
  local["m_friends"] = lang("Friends", "Друзья", "Друзі");
  local["m_conversations"] = lang("Conversations", "Диалоги", "Діалоги");
  local["m_music"] = lang("Music", "Музыка", "Музика");
  local["m_help"] = lang("Help", "Помощь", "Допомога");
  local["m_settings"] = lang("Settings", "Настройки", "Налаштування");
  local["m_exit"] = lang("Exit", "Выход", "Вихід");
  local["main_color"] = lang("Main color = ", "Основной цвет = ", "Остновний колір = ");
  local["second_color"] = lang("Second color = ", "Дополнительный цвет = ", "Додатковий колір = ");
  local["color0"] = lang("White", "Белый", "Білий");
  local["color1"] = lang("Red", "Красный", "Червоний");
  local["color2"] = lang("Green", "Зеленый", "Зелений");
  local["color3"] = lang("Yellow", "Желтый", "Жовтий");
  local["color4"] = lang("Blue", "Синий", "Синій");
  local["color5"] = lang("Pink", "Розовый","Рожевий");
  local["color6"] = lang("Mint", "Мятный", "М'ятний");
  local["color7"] = lang("Gray", "Серый", "Сірий");
  local["lang"] = lang("Language = English", "Язык = Русский", "Мова = Українська");
  local["display_settings"] = lang("[ Display Settings ]", "[ Настройки отображения ]", "[ Налаштування відображення ]");
  local["convers_settings"] = lang("[ Conversations Settings ]", "[ Настройки диалогов ]", "[ Налаштування діалогів ]");
  local["msg_setting_info"] = lang("How to draw conversations list: ", "Как отображать список диалогов: ", "Як відображати діалоги: ");
  local["msg_setting0"] = lang("show everything", "показывать всё", "показувати все");
  local["msg_setting1"] = lang("show the selected text only", "текст только выделенного диалога", "текст тільки виділеного діалогу");
  local["msg_setting2"] = lang("show the selected text and unread ones", "текст выделенного диалога и всех непрочитанных", "текст виділеного діалогу і всіх непрочитаних");
  local["loading"] = lang("Loading", "Загрузка", "Завантаження");
  local["general_navig"] = lang("[ General navigation ]", "[ Общее управление ]", "[ Загальне управління ]");
  local["help_move"]   = lang("Arrow keys, WASD, HJKL         ->   Move cursor", "Стрелки, WASD, HJKL           ->   Двигать курсор", "Стрілки, WASD, HJKL      ->   Переміщати курсор");
  local["help_select"] = lang("Enter, right arrow key, D, L   ->   Select item", "Enter, стрелка вправо, D, L   ->   Выбрать элемент", "Enter, стрілка вправо, D, L      ->   Вибрати елемент");
  local["help_jump"]   = lang("Page Up/Down                   ->   Scroll up/down for a half of screen", "Page Up/Down                  ->   Прокрутить вверх/вниз на половину экрана", "Page Up/Down      ->   Прокрутити вверх/вниз на половину екрану");
  local["help_homend"] = lang("Home/End                       ->   Jump to the beginning/end", "Home/End                      ->   Прыгнуть в начало/конец", "Home/End      ->   Перейти в початок/кінець");
  local["help_exit"]   = lang("Q                              ->   Exit", "Q                             ->   Выход", "Q      ->   Вихід");
  local["help_refr"]   = lang("R                              ->   Refresh window", "R                             ->   Обновить окно", "R      ->   Обновити вікно");
  local["help_pause"]   = lang("P                              ->   Pause music", "P                             ->   Остановить музыку", "P      ->   Зупинити музику");
  local["help_loop"]   = lang("O                              ->   Toggle looping", "O                             ->   Поставить на повтор", "O      ->   Поставити на повтор");
  local["help_mix"]   = lang("M                              ->   Shuffle tracks", "M                             ->   Перемешать треки", "M      ->   Перемішати треки");
  local["help_123"]   = lang("1-3                            ->   Friends, Chats, Music", "1-3                           ->   Друзья, Сообщения, Музыка", "1-3      ->    Друзі, Повідомлення, Музика");
  local["rainbow"] = lang("Render rainbow in chat: ", "Рисовать радугу в диалогах: ", "Малювати радугу в діалогах: ");
  local["unicode_chars"] = lang("Use unicode characters: ", "Использовать символы Unicode: ", "Використовувати символи Unicode: ");
  local["true"] = lang("On", "Да", "Так");
  local["false"] = lang("Off", "Нет", "Ні");
  local["rainbow_in_chat"] = lang("Color only in group chats: ", "Выделять цветом только конференции: ", "Виділяти кольором тільки конференції: ");
  local["sending"] = lang("Sending", "Отправка", "Відправлення");
  local["sendfailed"] = lang("Failed", "Ошибка", "Помилка");
  local["show_typing"] = lang("Show that you are typing a message: ", "Показывать, что вы набираете сообщение: ", "Показувати що ви набираєте повідомлення: ");
  local["show_conv_notif"] = lang("Show notifications from conferences: ", "Показывать уведомления из конференций: ", "Показувати сповіщення з конференції: ");
  local["send_online"] = lang("Send that you are online: ", "Показывать, что вы онлайн: ", "Показувати, що ви онлайн: ");
  local["banned"] = lang("banned", "заблокирован", "заблокований");
  local["general_settings"] = lang("[ General Settings ]", "[ Общие настройки ]", "[ Загальні налаштування ]");
  local["no_connection"] = lang("No connection", "Нет соединения", "Відусутнє з'єднання");
  local["err_noplayer"] = lang("mpv is not installed or not working properly", "mpv не установлен или работает неверно", "mpv не встановленей або працює неправильно");
  local["music_settings"] = lang("[ Music Settings ]", "[ Настройки музыки ]", "[ Налаштування музики ]");
  local["seek_percent_or_value"] = lang("Rewind track by: ", "Перематывать трек по: ", " Перемотувати трек по: ");
  local["seek_true"] = lang("2 %", "2 %", "2 %");
  local["seek_false"] = lang("15 sec", "15 сек", "15 сек");
  local["help_rewind"]   = lang("< >                            ->   Rewind track", "< >                           ->   Перематывать трек", "<,>      ->   Перемотувати трек");
}

void swapLang() {
  currentLang = (currentLang == En) ? Ru : En;
}

string getLang() {
  return currentLang.to!string;
}

string getLocal(string id) {
  return currentLang == En ? local[id].en : local[id].ru;
}
