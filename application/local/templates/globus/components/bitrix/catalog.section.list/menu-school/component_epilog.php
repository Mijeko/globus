<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<div class="menu-catalog-container">

    <?php foreach ($arResult['SECTIONS'] as &$arSection) : ?>
        <?php $this->AddEditAction($arSection['ID'], $arSection['EDIT_LINK'], $strSectionEdit); ?>
        <?php $this->AddDeleteAction($arSection['ID'], $arSection['DELETE_LINK'], $strSectionDelete, $arSectionDeleteParams); ?>


        <div class="menu-catalog-title"><?= $arSection['NAME']; ?></div>

        <?php $APPLICATION->IncludeComponent(
            "bitrix:news.list",
            "catalog-menu",
            array(
                "COMPONENT_TEMPLATE" => "catalog-menu",
                "IBLOCK_TYPE" => "documents",
                "IBLOCK_ID" => "6",
                "NEWS_COUNT" => "300",
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
                    0 => "FILE",
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
                "PARENT_SECTION" => $arSection['ID'],
                "PARENT_SECTION_CODE" => "",
                "INCLUDE_SUBSECTIONS" => "Y",
                "STRICT_SECTION_CHECK" => "N",
                "DISPLAY_DATE" => "Y",
                "DISPLAY_NAME" => "Y",
                "DISPLAY_PICTURE" => "Y",
                "DISPLAY_PREVIEW_TEXT" => "Y",
                "PAGER_TEMPLATE" => "",
                "DISPLAY_TOP_PAGER" => "N",
                "DISPLAY_BOTTOM_PAGER" => "N",
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

    <?php endforeach; ?>
</div>


<div class="requirements">
    <div class="requirements-title">Требования к питанию</div>
    <div class="requirements-desc">Основные требования к качеству питания в КШП «Глобус»</div>
    <ol class="requirements-list">
        <li class="requirements-list-item"><a class="requirements-list-link" href="">Сан.Пин 2.3/2.4.3590-20 «Санитарно-эпидемиологические требования к организации общественного питания»</a></li>
        <li class="requirements-list-item"><a class="requirements-list-link" href="">МР 2.4.0179-20 «Рекомендации по организации питания для обучающихся образовательных организаций»</a></li>
        <li class="requirements-list-item"><a class="requirements-list-link" href="">Приложение №6 к СанПиН 2.3/2.4.3590-20 «Перечень пищевой продукции, которая не допускается при организации питания детей»</a></li>
    </ol>
</div>
