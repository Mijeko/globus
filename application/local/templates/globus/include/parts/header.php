<?php $APPLICATION->IncludeComponent("bitrix:menu", "upper", Array(
    "COMPONENT_TEMPLATE" => ".default",
    "ROOT_MENU_TYPE" => "upper",    // Тип меню для первого уровня
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

<div class="container">
    <header class="header-mobile">
        <div class="header-mobile-logo"><img src="<?= ASSETS_PATH; ?>/images/logo.svg"></div>
        <div class="hamburger-wrap">
            <div class="hamburger-wrap js-show-hamburger">
                <div class="hamburger-line"></div>
                <div class="hamburger-line"></div>
                <div class="hamburger-line"></div>
            </div>
            <div class="header-mobile-layer">
                <div class="header-mobile-layer-header">
                    <div class="hamburger-close js-hide-hamburger">
                        <div class="hamburger-close-line"></div>
                        <div class="hamburger-close-line"></div>
                    </div>
                </div>
                <div class="header-mobile-layer-content">
                    <?php $APPLICATION->IncludeComponent("bitrix:menu", "upper-mobile", Array(
                        "COMPONENT_TEMPLATE" => "upper-mobile",
                        "ROOT_MENU_TYPE" => "upper",    // Тип меню для первого уровня
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
                    <?php $APPLICATION->IncludeComponent(
                        "bitrix:menu",
                        "header-phone",
                        array(
                            "COMPONENT_TEMPLATE" => "header-phone",
                            "ROOT_MENU_TYPE" => "header-phones",
                            "MENU_CACHE_TYPE" => "N",
                            "MENU_CACHE_TIME" => "3600",
                            "MENU_CACHE_USE_GROUPS" => "Y",
                            "MENU_CACHE_GET_VARS" => array(),
                            "MAX_LEVEL" => "1",
                            "CHILD_MENU_TYPE" => "left",
                            "USE_EXT" => "N",
                            "DELAY" => "N",
                            "ALLOW_MULTI_SELECT" => "N"
                        ),
                        false
                    ); ?>
                </div>
            </div>
        </div>
    </header>
    <header class="header">
        <div class="header-address-container">
            <?php $APPLICATION->IncludeComponent("bitrix:menu", "header-addr", Array(
                "COMPONENT_TEMPLATE" => "header-addr",
                "ROOT_MENU_TYPE" => "header-addr",    // Тип меню для первого уровня
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
        <div class="logo-container"><a class="logo" href="/"><img src="<?= ASSETS_PATH; ?>/images/logo.svg"></a></div>
        <div class="header-contacts-container">
            <?php $APPLICATION->IncludeComponent(
                "bitrix:menu",
                "header-phone",
                array(
                    "COMPONENT_TEMPLATE" => "header-phone",
                    "ROOT_MENU_TYPE" => "header-phones",
                    "MENU_CACHE_TYPE" => "N",
                    "MENU_CACHE_TIME" => "3600",
                    "MENU_CACHE_USE_GROUPS" => "Y",
                    "MENU_CACHE_GET_VARS" => array(),
                    "MAX_LEVEL" => "1",
                    "CHILD_MENU_TYPE" => "left",
                    "USE_EXT" => "N",
                    "DELAY" => "N",
                    "ALLOW_MULTI_SELECT" => "N"
                ),
                false
            ); ?>
        </div>
    </header>

    <?php $APPLICATION->IncludeComponent("bitrix:menu", "main", array(
        "COMPONENT_TEMPLATE" => ".default",
        "ROOT_MENU_TYPE" => "top",    // Тип меню для первого уровня
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

    <?php $APPLICATION->IncludeComponent("bitrix:breadcrumb", "main", Array(), false); ?>
</div>