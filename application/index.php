<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('Главная страница'); ?>
    <div class="container">

        <?php $APPLICATION->IncludeComponent("bitrix:news.list", "home-slider", Array(
            "COMPONENT_TEMPLATE" => ".default",
            "IBLOCK_TYPE" => "sliders",    // Тип информационного блока (используется только для проверки)
            "IBLOCK_ID" => "10",    // Код информационного блока
            "NEWS_COUNT" => "20",    // Количество новостей на странице
            "SORT_BY1" => "ID",    // Поле для первой сортировки новостей
            "SORT_ORDER1" => "ASC",    // Направление для первой сортировки новостей
            "SORT_BY2" => "SORT",    // Поле для второй сортировки новостей
            "SORT_ORDER2" => "ASC",    // Направление для второй сортировки новостей
            "FILTER_NAME" => "",    // Фильтр
            "FIELD_CODE" => array(    // Поля
                0 => "",
                1 => "",
            ),
            "PROPERTY_CODE" => array(    // Свойства
                0 => "",
                1 => "",
            ),
            "CHECK_DATES" => "Y",    // Показывать только активные на данный момент элементы
            "DETAIL_URL" => "",    // URL страницы детального просмотра (по умолчанию - из настроек инфоблока)
            "AJAX_MODE" => "N",    // Включить режим AJAX
            "AJAX_OPTION_JUMP" => "N",    // Включить прокрутку к началу компонента
            "AJAX_OPTION_STYLE" => "Y",    // Включить подгрузку стилей
            "AJAX_OPTION_HISTORY" => "N",    // Включить эмуляцию навигации браузера
            "AJAX_OPTION_ADDITIONAL" => "",    // Дополнительный идентификатор
            "CACHE_TYPE" => "A",    // Тип кеширования
            "CACHE_TIME" => "36000000",    // Время кеширования (сек.)
            "CACHE_FILTER" => "N",    // Кешировать при установленном фильтре
            "CACHE_GROUPS" => "Y",    // Учитывать права доступа
            "PREVIEW_TRUNCATE_LEN" => "",    // Максимальная длина анонса для вывода (только для типа текст)
            "ACTIVE_DATE_FORMAT" => "d.m.Y",    // Формат показа даты
            "SET_TITLE" => "N",    // Устанавливать заголовок страницы
            "SET_BROWSER_TITLE" => "N",    // Устанавливать заголовок окна браузера
            "SET_META_KEYWORDS" => "N",    // Устанавливать ключевые слова страницы
            "SET_META_DESCRIPTION" => "N",    // Устанавливать описание страницы
            "SET_LAST_MODIFIED" => "N",    // Устанавливать в заголовках ответа время модификации страницы
            "INCLUDE_IBLOCK_INTO_CHAIN" => "N",    // Включать инфоблок в цепочку навигации
            "ADD_SECTIONS_CHAIN" => "N",    // Включать раздел в цепочку навигации
            "HIDE_LINK_WHEN_NO_DETAIL" => "N",    // Скрывать ссылку, если нет детального описания
            "PARENT_SECTION" => "",    // ID раздела
            "PARENT_SECTION_CODE" => "",    // Код раздела
            "INCLUDE_SUBSECTIONS" => "Y",    // Показывать элементы подразделов раздела
            "STRICT_SECTION_CHECK" => "N",    // Строгая проверка раздела для показа списка
            "DISPLAY_DATE" => "Y",    // Выводить дату элемента
            "DISPLAY_NAME" => "Y",    // Выводить название элемента
            "DISPLAY_PICTURE" => "Y",    // Выводить изображение для анонса
            "DISPLAY_PREVIEW_TEXT" => "Y",    // Выводить текст анонса
            "PAGER_TEMPLATE" => ".default",    // Шаблон постраничной навигации
            "DISPLAY_TOP_PAGER" => "N",    // Выводить над списком
            "DISPLAY_BOTTOM_PAGER" => "Y",    // Выводить под списком
            "PAGER_TITLE" => "Новости",    // Название категорий
            "PAGER_SHOW_ALWAYS" => "N",    // Выводить всегда
            "PAGER_DESC_NUMBERING" => "N",    // Использовать обратную навигацию
            "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",    // Время кеширования страниц для обратной навигации
            "PAGER_SHOW_ALL" => "N",    // Показывать ссылку "Все"
            "PAGER_BASE_LINK_ENABLE" => "N",    // Включить обработку ссылок
            "SET_STATUS_404" => "N",    // Устанавливать статус 404
            "SHOW_404" => "N",    // Показ специальной страницы
            "MESSAGE_404" => "",    // Сообщение для показа (по умолчанию из компонента)
        ),
            false
        ); ?>


        <div class="home-short-phrase-container">
            <div class="home-short-phrase-logo"><img src="<?= ASSETS_PATH; ?>/images/logo.svg"></div>
            <?php $APPLICATION->IncludeComponent("bitrix:menu", "shorts", Array(
                "COMPONENT_TEMPLATE" => ".default",
                "ROOT_MENU_TYPE" => "short",    // Тип меню для первого уровня
                "MENU_CACHE_TYPE" => "N",    // Тип кеширования
                "MENU_CACHE_TIME" => "3600",    // Время кеширования (сек.)
                "MENU_CACHE_USE_GROUPS" => "Y",    // Учитывать права доступа
                "MENU_CACHE_GET_VARS" => "",    // Значимые переменные запроса
                "MAX_LEVEL" => "1",    // Уровень вложенности меню
                "CHILD_MENU_TYPE" => "left",    // Тип меню для остальных уровней
                "USE_EXT" => "N",    // Подключать файлы с именами вида .тип_меню.menu_ext.php
                "DELAY" => "N",    // Откладывать выполнение шаблона меню
                "ALLOW_MULTI_SELECT" => "N",    // Разрешить несколько активных пунктов одновременно
            ),
                false
            ); ?>
        </div>
    </div>

<?php $APPLICATION->IncludeComponent("bitrix:news.list", "home-statistic", Array(
    "COMPONENT_TEMPLATE" => ".default",
    "IBLOCK_TYPE" => "sliders",    // Тип информационного блока (используется только для проверки)
    "IBLOCK_ID" => "11",    // Код информационного блока
    "NEWS_COUNT" => "20",    // Количество новостей на странице
    "SORT_BY1" => "ID",    // Поле для первой сортировки новостей
    "SORT_ORDER1" => "ASC",    // Направление для первой сортировки новостей
    "SORT_BY2" => "SORT",    // Поле для второй сортировки новостей
    "SORT_ORDER2" => "ASC",    // Направление для второй сортировки новостей
    "FILTER_NAME" => "",    // Фильтр
    "FIELD_CODE" => array(    // Поля
        0 => "",
        1 => "",
    ),
    "PROPERTY_CODE" => array(    // Свойства
        0 => "",
        1 => "",
    ),
    "CHECK_DATES" => "Y",    // Показывать только активные на данный момент элементы
    "DETAIL_URL" => "",    // URL страницы детального просмотра (по умолчанию - из настроек инфоблока)
    "AJAX_MODE" => "N",    // Включить режим AJAX
    "AJAX_OPTION_JUMP" => "N",    // Включить прокрутку к началу компонента
    "AJAX_OPTION_STYLE" => "Y",    // Включить подгрузку стилей
    "AJAX_OPTION_HISTORY" => "N",    // Включить эмуляцию навигации браузера
    "AJAX_OPTION_ADDITIONAL" => "",    // Дополнительный идентификатор
    "CACHE_TYPE" => "A",    // Тип кеширования
    "CACHE_TIME" => "36000000",    // Время кеширования (сек.)
    "CACHE_FILTER" => "N",    // Кешировать при установленном фильтре
    "CACHE_GROUPS" => "Y",    // Учитывать права доступа
    "PREVIEW_TRUNCATE_LEN" => "",    // Максимальная длина анонса для вывода (только для типа текст)
    "ACTIVE_DATE_FORMAT" => "d.m.Y",    // Формат показа даты
    "SET_TITLE" => "N",    // Устанавливать заголовок страницы
    "SET_BROWSER_TITLE" => "N",    // Устанавливать заголовок окна браузера
    "SET_META_KEYWORDS" => "N",    // Устанавливать ключевые слова страницы
    "SET_META_DESCRIPTION" => "N",    // Устанавливать описание страницы
    "SET_LAST_MODIFIED" => "N",    // Устанавливать в заголовках ответа время модификации страницы
    "INCLUDE_IBLOCK_INTO_CHAIN" => "N",    // Включать инфоблок в цепочку навигации
    "ADD_SECTIONS_CHAIN" => "N",    // Включать раздел в цепочку навигации
    "HIDE_LINK_WHEN_NO_DETAIL" => "N",    // Скрывать ссылку, если нет детального описания
    "PARENT_SECTION" => "",    // ID раздела
    "PARENT_SECTION_CODE" => "",    // Код раздела
    "INCLUDE_SUBSECTIONS" => "Y",    // Показывать элементы подразделов раздела
    "STRICT_SECTION_CHECK" => "N",    // Строгая проверка раздела для показа списка
    "DISPLAY_DATE" => "Y",    // Выводить дату элемента
    "DISPLAY_NAME" => "Y",    // Выводить название элемента
    "DISPLAY_PICTURE" => "Y",    // Выводить изображение для анонса
    "DISPLAY_PREVIEW_TEXT" => "Y",    // Выводить текст анонса
    "PAGER_TEMPLATE" => ".default",    // Шаблон постраничной навигации
    "DISPLAY_TOP_PAGER" => "N",    // Выводить над списком
    "DISPLAY_BOTTOM_PAGER" => "Y",    // Выводить под списком
    "PAGER_TITLE" => "Новости",    // Название категорий
    "PAGER_SHOW_ALWAYS" => "N",    // Выводить всегда
    "PAGER_DESC_NUMBERING" => "N",    // Использовать обратную навигацию
    "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",    // Время кеширования страниц для обратной навигации
    "PAGER_SHOW_ALL" => "N",    // Показывать ссылку "Все"
    "PAGER_BASE_LINK_ENABLE" => "N",    // Включить обработку ссылок
    "SET_STATUS_404" => "N",    // Устанавливать статус 404
    "SHOW_404" => "N",    // Показ специальной страницы
    "MESSAGE_404" => "",    // Сообщение для показа (по умолчанию из компонента)
),
    false
); ?>
    <div class="container">
        <?php $APPLICATION->IncludeComponent(
            "bitrix:news.list",
            "for-parent",
            array(
                "COMPONENT_TEMPLATE" => "for-parent",
                "IBLOCK_TYPE" => "content",
                "IBLOCK_ID" => "12",
                "NEWS_COUNT" => "20",
                "SORT_BY1" => "ACTIVE_FROM",
                "SORT_ORDER1" => "DESC",
                "SORT_BY2" => "SORT",
                "SORT_ORDER2" => "ASC",
                "FILTER_NAME" => "",
                "FIELD_CODE" => array(
                    0 => "",
                    1 => "",
                ),
                "PROPERTY_CODE" => array(
                    0 => "FILES",
                    1 => "",
                ),
                "CHECK_DATES" => "Y",
                "DETAIL_URL" => "",
                "AJAX_MODE" => "N",
                "AJAX_OPTION_JUMP" => "N",
                "AJAX_OPTION_STYLE" => "Y",
                "AJAX_OPTION_HISTORY" => "N",
                "AJAX_OPTION_ADDITIONAL" => "",
                "CACHE_TYPE" => "A",
                "CACHE_TIME" => "36000000",
                "CACHE_FILTER" => "N",
                "CACHE_GROUPS" => "Y",
                "PREVIEW_TRUNCATE_LEN" => "",
                "ACTIVE_DATE_FORMAT" => "d.m.Y",
                "SET_TITLE" => "N",
                "SET_BROWSER_TITLE" => "N",
                "SET_META_KEYWORDS" => "N",
                "SET_META_DESCRIPTION" => "N",
                "SET_LAST_MODIFIED" => "N",
                "INCLUDE_IBLOCK_INTO_CHAIN" => "N",
                "ADD_SECTIONS_CHAIN" => "N",
                "HIDE_LINK_WHEN_NO_DETAIL" => "N",
                "PARENT_SECTION" => "",
                "PARENT_SECTION_CODE" => "",
                "INCLUDE_SUBSECTIONS" => "Y",
                "STRICT_SECTION_CHECK" => "N",
                "DISPLAY_DATE" => "Y",
                "DISPLAY_NAME" => "Y",
                "DISPLAY_PICTURE" => "Y",
                "DISPLAY_PREVIEW_TEXT" => "Y",
                "PAGER_TEMPLATE" => ".default",
                "DISPLAY_TOP_PAGER" => "N",
                "DISPLAY_BOTTOM_PAGER" => "Y",
                "PAGER_TITLE" => "Новости",
                "PAGER_SHOW_ALWAYS" => "N",
                "PAGER_DESC_NUMBERING" => "N",
                "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
                "PAGER_SHOW_ALL" => "N",
                "PAGER_BASE_LINK_ENABLE" => "N",
                "SET_STATUS_404" => "N",
                "SHOW_404" => "N",
                "MESSAGE_404" => ""
            ),
            false
        ); ?>

        <?php $APPLICATION->IncludeComponent(
            "bitrix:news.list",
            "eat",
            array(
                "COMPONENT_TEMPLATE" => "eat",
                "IBLOCK_TYPE" => "sliders",
                "IBLOCK_ID" => "13",
                "NEWS_COUNT" => "20",
                "SORT_BY1" => "ACTIVE_FROM",
                "SORT_ORDER1" => "DESC",
                "SORT_BY2" => "SORT",
                "SORT_ORDER2" => "ASC",
                "FILTER_NAME" => "",
                "FIELD_CODE" => array(
                    0 => "",
                    1 => "",
                ),
                "PROPERTY_CODE" => array(
                    0 => "",
                    1 => "",
                ),
                "CHECK_DATES" => "Y",
                "DETAIL_URL" => "",
                "AJAX_MODE" => "N",
                "AJAX_OPTION_JUMP" => "N",
                "AJAX_OPTION_STYLE" => "Y",
                "AJAX_OPTION_HISTORY" => "N",
                "AJAX_OPTION_ADDITIONAL" => "",
                "CACHE_TYPE" => "A",
                "CACHE_TIME" => "36000000",
                "CACHE_FILTER" => "N",
                "CACHE_GROUPS" => "Y",
                "PREVIEW_TRUNCATE_LEN" => "",
                "ACTIVE_DATE_FORMAT" => "d.m.Y",
                "SET_TITLE" => "N",
                "SET_BROWSER_TITLE" => "N",
                "SET_META_KEYWORDS" => "N",
                "SET_META_DESCRIPTION" => "N",
                "SET_LAST_MODIFIED" => "N",
                "INCLUDE_IBLOCK_INTO_CHAIN" => "N",
                "ADD_SECTIONS_CHAIN" => "N",
                "HIDE_LINK_WHEN_NO_DETAIL" => "N",
                "PARENT_SECTION" => "",
                "PARENT_SECTION_CODE" => "",
                "INCLUDE_SUBSECTIONS" => "Y",
                "STRICT_SECTION_CHECK" => "N",
                "DISPLAY_DATE" => "Y",
                "DISPLAY_NAME" => "Y",
                "DISPLAY_PICTURE" => "Y",
                "DISPLAY_PREVIEW_TEXT" => "Y",
                "PAGER_TEMPLATE" => ".default",
                "DISPLAY_TOP_PAGER" => "N",
                "DISPLAY_BOTTOM_PAGER" => "Y",
                "PAGER_TITLE" => "Новости",
                "PAGER_SHOW_ALWAYS" => "N",
                "PAGER_DESC_NUMBERING" => "N",
                "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
                "PAGER_SHOW_ALL" => "N",
                "PAGER_BASE_LINK_ENABLE" => "N",
                "SET_STATUS_404" => "N",
                "SHOW_404" => "N",
                "MESSAGE_404" => ""
            ),
            false
        ); ?>


    </div>
    <div class="container">
        <div class="common-info">
            <div class="common-info-title">Основаная<br>информация о комбинате</div>
            <div class="common-info-group">
                <div class="common-info-left"><img src="<?= ASSETS_PATH; ?>/images/common-info-left.png"></div>
                <div class="common-info-right">
                    <div class="common-info-text">
                        <div class="common-info-text__description">Для современного мира убеждённость некоторых оппонентов влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствующей насущным потребностям. Повседневная практика показывает, что начало повседневной.</div>
                        <a class="common-info-text__link" href="/">Подробнее</a></div>
                    <img src="<?= ASSETS_PATH; ?>/images/common-info-right.png"></div>
            </div>
        </div>
    </div>
    <div class="sticker">
        <div class="sticker-image"></div>
        <div class="sticker-image"></div>
    </div>
    <div class="container">
        <div class="dialog-us">
            <div class="dialog-us-image"><img src="<?= ASSETS_PATH; ?>/images/dialog.png"></div>
            <div class="dialog-us-container">
                <div class="dialog-us-title">Диалог с комбинатом</div>
                <div class="dialog-us-description">Cпециалисты нашего комбината с удовольствием ответят на вопросы! Заполните форму ниже, затем мы с Вами свяжемся и ответим на все Ваши вопросы.</div>
                <div class="dialog-us-form-container">
                    <form class="common-form dialog-us-form">
                        <div class="common-form-row grouped">
                            <div class="common-form-element"><input class="common-form-input" type="text" name="name" placeholder="Ваше имя*"></div>
                            <div class="common-form-element"><input class="common-form-input js-mask-ru" type="tel" name="phone" placeholder="Ваш телефон*"></div>
                        </div>
                        <div class="common-form-row">
                            <div class="common-form-element"><input class="common-form-input" type="email" name="email" placeholder="Ваш e-mail"></div>
                        </div>
                        <div class="common-form-row">
                            <div class="common-form-element"><textarea class="common-form-textarea" name="message" placeholder="Напишите ваш вопрос*"></textarea></div>
                        </div>
                        <div class="common-form-row grouped">
                            <div class="common-form-element radio"><input type="radio" id="type_contact_1" name="type_contact" checked="checked" value="1"><label for="type_contact_1">Перезвонить по телефон</label></div>
                            <div class="common-form-element radio"><input type="radio" id="type_contact_2" name="type_contact" value="2"><label for="type_contact_2">Ответить на email</label></div>
                        </div>
                        <div class="common-form-row grouped common-form-agree-container">
                            <div class="common-form-agree">Наживая на кнопку “отправить” вы даете согласие на обработку <a href="">персональных данных</a> и <a href="">соглашение о пользовании сайтом</a></div>
                            <button class="common-form-submit btn-main" type="submit">Отправить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="contragents">
            <div class="contragents-title">Кто с нами сотрудничает</div>
            <div class="contragents-filter">
                <div class="contragents-filter-item school">Школы</div>
                <div class="contragents-filter-item camp">Детские лагеря</div>
            </div>
            <div class="contragents-map">
                <script type="text/javascript" charset="utf-8" async="" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Aaa71dfd284efbb64a8522129cb56169226f88b4468db1d5f1aebeb5c978ee1a2&amp;width=100%25&amp;height=480&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
        </div>
        <div class="home-about-container">
            <div class="home-about">
                <div class="home-about-title">Столовая «Нива»</div>
                <div class="home-about-description">Для современного мира убеждённость некоторых оппонентов влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствующей насущным потребностям.</div>
                <a class="home-about-link btn-main" href="">Посетить</a></div>

            <?php $APPLICATION->IncludeComponent("bitrix:news.list", "cooking", Array(
                "COMPONENT_TEMPLATE" => ".default",
                "IBLOCK_TYPE" => "sliders",    // Тип информационного блока (используется только для проверки)
                "IBLOCK_ID" => "14",    // Код информационного блока
                "NEWS_COUNT" => "20",    // Количество новостей на странице
                "SORT_BY1" => "ACTIVE_FROM",    // Поле для первой сортировки новостей
                "SORT_ORDER1" => "DESC",    // Направление для первой сортировки новостей
                "SORT_BY2" => "SORT",    // Поле для второй сортировки новостей
                "SORT_ORDER2" => "ASC",    // Направление для второй сортировки новостей
                "FILTER_NAME" => "",    // Фильтр
                "FIELD_CODE" => array(    // Поля
                    0 => "",
                    1 => "",
                ),
                "PROPERTY_CODE" => array(    // Свойства
                    0 => "",
                    1 => "",
                ),
                "CHECK_DATES" => "Y",    // Показывать только активные на данный момент элементы
                "DETAIL_URL" => "",    // URL страницы детального просмотра (по умолчанию - из настроек инфоблока)
                "AJAX_MODE" => "N",    // Включить режим AJAX
                "AJAX_OPTION_JUMP" => "N",    // Включить прокрутку к началу компонента
                "AJAX_OPTION_STYLE" => "Y",    // Включить подгрузку стилей
                "AJAX_OPTION_HISTORY" => "N",    // Включить эмуляцию навигации браузера
                "AJAX_OPTION_ADDITIONAL" => "",    // Дополнительный идентификатор
                "CACHE_TYPE" => "A",    // Тип кеширования
                "CACHE_TIME" => "36000000",    // Время кеширования (сек.)
                "CACHE_FILTER" => "N",    // Кешировать при установленном фильтре
                "CACHE_GROUPS" => "Y",    // Учитывать права доступа
                "PREVIEW_TRUNCATE_LEN" => "",    // Максимальная длина анонса для вывода (только для типа текст)
                "ACTIVE_DATE_FORMAT" => "d.m.Y",    // Формат показа даты
                "SET_TITLE" => "N",    // Устанавливать заголовок страницы
                "SET_BROWSER_TITLE" => "N",    // Устанавливать заголовок окна браузера
                "SET_META_KEYWORDS" => "N",    // Устанавливать ключевые слова страницы
                "SET_META_DESCRIPTION" => "N",    // Устанавливать описание страницы
                "SET_LAST_MODIFIED" => "N",    // Устанавливать в заголовках ответа время модификации страницы
                "INCLUDE_IBLOCK_INTO_CHAIN" => "N",    // Включать инфоблок в цепочку навигации
                "ADD_SECTIONS_CHAIN" => "N",    // Включать раздел в цепочку навигации
                "HIDE_LINK_WHEN_NO_DETAIL" => "N",    // Скрывать ссылку, если нет детального описания
                "PARENT_SECTION" => "",    // ID раздела
                "PARENT_SECTION_CODE" => "",    // Код раздела
                "INCLUDE_SUBSECTIONS" => "Y",    // Показывать элементы подразделов раздела
                "STRICT_SECTION_CHECK" => "N",    // Строгая проверка раздела для показа списка
                "DISPLAY_DATE" => "Y",    // Выводить дату элемента
                "DISPLAY_NAME" => "Y",    // Выводить название элемента
                "DISPLAY_PICTURE" => "Y",    // Выводить изображение для анонса
                "DISPLAY_PREVIEW_TEXT" => "Y",    // Выводить текст анонса
                "PAGER_TEMPLATE" => ".default",    // Шаблон постраничной навигации
                "DISPLAY_TOP_PAGER" => "N",    // Выводить над списком
                "DISPLAY_BOTTOM_PAGER" => "Y",    // Выводить под списком
                "PAGER_TITLE" => "Новости",    // Название категорий
                "PAGER_SHOW_ALWAYS" => "N",    // Выводить всегда
                "PAGER_DESC_NUMBERING" => "N",    // Использовать обратную навигацию
                "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",    // Время кеширования страниц для обратной навигации
                "PAGER_SHOW_ALL" => "N",    // Показывать ссылку "Все"
                "PAGER_BASE_LINK_ENABLE" => "N",    // Включить обработку ссылок
                "SET_STATUS_404" => "N",    // Устанавливать статус 404
                "SHOW_404" => "N",    // Показ специальной страницы
                "MESSAGE_404" => "",    // Сообщение для показа (по умолчанию из компонента)
            ),
                false
            ); ?>


        </div>
    </div>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>