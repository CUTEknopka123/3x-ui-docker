# 3x-ui-docker
[![Docker Pulls](https://img.shields.io/docker/pulls/knopka123/3x-ui)](https://hub.docker.com/r/knopka123/3x-ui) [![Docker Image Size](https://img.shields.io/docker/image-size/knopka123/3x-ui/latest)](https://hub.docker.com/r/knopka123/3x-ui) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)  
Репозиторий **3x-ui-docker** предоставляет удобную среду для развертывания сервиса 3x-ui в Docker-контейнере. Этот проект предназначен для быстрого старта, настройки и управления 3x-ui с помощью Docker Compose, обеспечивая простоту использования и повторяемость развертываний.

---

## Содержание

- [Введение](#введение)
- [Требования](#требования)
- [Установка](#установка)
- [Использование](#использование)
- [Конфигурация](#конфигурация)
- [Лицензия](#лицензия)
- [Дополнительная информация](#дополнительная-информация)

---

## Введение

**3x-ui** — это веб-интерфейс для управления Xray/V2Ray прокси-серверами, позволяющий создавать, редактировать и удалять конфигурации пользователей и серверов. В данном репозитории содержатся необходимые файлы для развертывания 3x-ui через Docker. Используя контейнеризацию, вы получаете изолированную, простую в обслуживании и масштабируемую среду для работы с 3x-ui.

---

## Требования

Перед началом работы убедитесь, что на вашем сервере или локальной машине установлены следующие компоненты:

- Docker Engine (рекомендуется последняя стабильная версия)
- Docker Compose (версии 1.26 и выше)
- Права администратора (root) или возможность использовать `sudo`
- Доступ к интернету для загрузки необходимых образов

> [!IMPORTANT]
> Все команды необходимо выполнять из корневой директории репозитория.

---

## Установка

Следуйте данным шагам для развертывания 3x-ui в Docker-контейнере:

```steps
1. Клонирование репозитория | Склонируйте репозиторий с помощью команды: git clone https://github.com/CUTEknopka123/3x-ui-docker.git
2. Переход в директорию | Перейдите в папку проекта: cd 3x-ui-docker
3. Настройка переменных окружения | При необходимости создайте или отредактируйте файл .env для задания пользовательских параметров.
4. Запуск контейнера | Выполните запуск командой: docker-compose up -d
5. Проверка статуса | Проверьте работу контейнера: docker-compose ps
6. Доступ к интерфейсу | Откройте браузер и перейдите по адресу http://localhost:54321 (или используйте указанный в настройках порт)
```

> [!TIP]
> Для остановки контейнера используйте:  
> `docker-compose down`

---

## Использование

После запуска контейнера, веб-интерфейс 3x-ui будет доступен по адресу, указанному в настройках (по умолчанию: http://localhost:54321). Для входа используйте стандартные учетные данные: логин `admin`, пароль `admin`.

Дальнейшие шаги работы через браузер:

1. Откройте указанный URL в браузере и авторизуйтесь с логином и паролем `admin`.
2. После успешного входа перейдите на главный экран панели 3x-ui.
3. Используйте доступные разделы интерфейса для управления пользователями, серверами и параметрами панели.
4. При необходимости выполните перезапуск контейнера командой `docker-compose restart` из корневой директории репозитория.

- Управляйте пользователями, серверами и настройками через веб-интерфейс.
- Все изменения автоматически сохраняются в соответствующих томах Docker (volumes).

> [!NOTE]
> Если вы изменяли порт или другие параметры конфигурации, используйте актуальные значения для доступа.

---

## Конфигурация

Проект поддерживает настройку параметров контейнера через переменные окружения и конфигурационные файлы.

- **Файл .env**  
  В корне репозитория вы можете создать или отредактировать файл `.env` для указания пользовательских параметров (например, порт интерфейса, путь к данным).

- **docker-compose.yml**  
  Основные параметры контейнера (порты, тома, переменные) задаются в файле `docker-compose.yml`.

#### Пример настройки порта в .env:

```env
WEB_PORT=54321
```

#### Пример секции volumes в docker-compose.yml:

```yaml
volumes:
  - ./data:/etc/x-ui
```

<details>
<summary>Детали структуры проекта</summary>

- **docker-compose.yml** — основной файл описания сервисов и их параметров
- **data/** — директория для хранения пользовательских данных и конфигураций
- **.env** — файл переменных окружения (создаётся при необходимости)
</details>

> [!WARNING]
> Не удаляйте директорию данных, если хотите сохранить настройки и пользователей между перезапусками контейнера.

---

## Лицензия

Данный проект распространяется под лицензией MIT.

```text
MIT License

Copyright (c) 2024 CUTEknopka123

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## Дополнительная информация

- Для получения логов контейнера используйте:  
  `docker-compose logs -f`
- Для обновления образов выполните:  
  `docker-compose pull` и затем перезапустите контейнеры.

> [!CAUTION]
> Все действия с Docker рекомендуется выполнять от имени пользователя с правами администратора.

---

**3x-ui-docker** — простой способ быстро запустить 3x-ui с помощью Docker!
