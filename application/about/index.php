<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('О комбинате'); ?>
    <div class="about-banner">
        <div class="about-banner-text">
            <?php $APPLICATION->IncludeComponent(
                "bitrix:main.include",
                ".default",
                array(
                    "COMPONENT_TEMPLATE" => ".default",
                    "AREA_FILE_SHOW" => "file",
                    "PATH" => "/local/include/about-letter.php",
                    "EDIT_TEMPLATE" => ""
                ),
                false
            ); ?>
        </div>
        <div class="about-banner-sign">
            <?php $APPLICATION->IncludeComponent(
                "bitrix:main.include",
                ".default",
                array(
                    "COMPONENT_TEMPLATE" => ".default",
                    "AREA_FILE_SHOW" => "file",
                    "PATH" => "/local/include/about-sign.php",
                    "EDIT_TEMPLATE" => ""
                ),
                false
            ); ?>
        </div>
        <div class="about-banner-image"><img src="<?= ASSETS_PATH; ?>/images/director.png"></div>
    </div>

<?php $APPLICATION->IncludeComponent(
    "bitrix:news.list",
    "history-combinate",
    array(
        "COMPONENT_TEMPLATE" => "history-combinate",
        "IBLOCK_TYPE" => "content",
        "IBLOCK_ID" => "4",
        "NEWS_COUNT" => "20",
        "SORT_BY1" => "ID",
        "SORT_ORDER1" => "ASC",
        "SORT_BY2" => "SORT",
        "SORT_ORDER2" => "ASC",
        "FILTER_NAME" => "",
        "FIELD_CODE" => array(
            0 => "NAME",
            1 => "DETAIL_TEXT",
            2 => "DETAIL_PICTURE",
            3 => "",
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

    <div class="page">
        <div class="page-title">Все наши направления</div>
        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>
            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</p></div>
        <div class="menu-index-list">
            <div class="menu-index-list-item-wrapper">
                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">
                    <div class="menu-index-list-item__title">Меню для школ</div>
                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>
            </div>
            <div class="menu-index-list-item-wrapper">
                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">
                    <div class="menu-index-list-item__title">Столовая Нива</div>
                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>
            </div>
            <div class="menu-index-list-item-wrapper">
                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">
                    <div class="menu-index-list-item__title">Кулинария</div>
                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="page-title">Производство</div>
        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>
            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений</p></div>


        <?php $APPLICATION->IncludeComponent("bitrix:news.list", "manufactory", Array(
            "COMPONENT_TEMPLATE" => ".default",
            "IBLOCK_TYPE" => "content",    // Тип информационного блока (используется только для проверки)
            "IBLOCK_ID" => "5",    // Код информационного блока
            "NEWS_COUNT" => "20",    // Количество новостей на странице
            "SORT_BY1" => "ACTIVE_FROM",    // Поле для первой сортировки новостей
            "SORT_ORDER1" => "DESC",    // Направление для первой сортировки новостей
            "SORT_BY2" => "SORT",    // Поле для второй сортировки новостей
            "SORT_ORDER2" => "ASC",    // Направление для второй сортировки новостей
            "FILTER_NAME" => "",    // Фильтр
            "FIELD_CODE" => array(    // Поля
                0 => "NAME",
                1 => "DETAIL_TEXT",
                2 => "DETAIL_PICTURE",
                3 => "",
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
            "SET_META_KEYWORDS" => "Y",    // Устанавливать ключевые слова страницы
            "SET_META_DESCRIPTION" => "Y",    // Устанавливать описание страницы
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
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>