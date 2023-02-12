<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('Меню для школ'); ?>
<?php
$APPLICATION->IncludeComponent("bitrix:catalog.section.list", "menu-school", Array(
    "COMPONENT_TEMPLATE" => ".default",
    "IBLOCK_TYPE" => "documents",    // Тип инфоблока
    "IBLOCK_ID" => "6",    // Инфоблок
    "SECTION_ID" => $_REQUEST["SECTION_ID"],    // ID раздела
    "SECTION_CODE" => "",    // Код раздела
    "COUNT_ELEMENTS" => "Y",    // Показывать количество элементов в разделе
    "COUNT_ELEMENTS_FILTER" => "CNT_ACTIVE",    // Показывать количество
    "TOP_DEPTH" => "2",    // Максимальная отображаемая глубина разделов
    "SECTION_FIELDS" => array(    // Поля разделов
        0 => "",
        1 => "",
    ),
    "SECTION_USER_FIELDS" => array(    // Свойства разделов
        0 => "",
        1 => "",
    ),
    "FILTER_NAME" => "sectionsFilter",    // Имя массива со значениями фильтра разделов
    "VIEW_MODE" => "LINE",    // Вид списка подразделов
    "SHOW_PARENT_NAME" => "Y",    // Показывать название раздела
    "SECTION_URL" => "",    // URL, ведущий на страницу с содержимым раздела
    "CACHE_TYPE" => "A",    // Тип кеширования
    "CACHE_TIME" => "36000000",    // Время кеширования (сек.)
    "CACHE_GROUPS" => "Y",    // Учитывать права доступа
    "CACHE_FILTER" => "N",    // Кешировать при установленном фильтре
    "ADD_SECTIONS_CHAIN" => "N",    // Включать раздел в цепочку навигации
),
    false
);
?>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>