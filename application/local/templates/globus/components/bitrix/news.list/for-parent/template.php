<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);
?>


<div class="important-parent">
    <div class="important-parent-title">Важно для родителей</div>
    <div class="important-parent-list-wrppaer">
        <div class="important-parent-list">

            <?php foreach ($arResult["ITEMS"] as $arItem): ?>
                <?php
                $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
                $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
                ?>
                <div id="<?= $this->GetEditAreaId($arItem['ID']); ?>" class="important-parent-list-item">
                    <a class="important-parent-list-item__title" href="/"><?= $arItem['NAME']; ?></a>
                    <div class="important-parent-list-item__description"><?= $arItem['PREVIEW_TEXT']; ?></div>

                    <?php if ($arItem['DISPLAY_PROPERTIES']['FILES']): ?>

                        <div class="important-parent-gallery">
                            <?php foreach ($arItem['DISPLAY_PROPERTIES']['FILES']['FILE_VALUE'] as $file): ?>
                                <a href="<?= $file['SRC']; ?>" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= $file['SRC']; ?>"></a>
                            <?php endforeach; ?>
                        </div>

                    <?php endif; ?>

                </div>
            <?php endforeach; ?>

        </div>
        <div class="important-parent-note">
            <div class="important-parent-note__title">Требования к питанию</div>
            <div class="important-parent-note__description">Основные трбования к качеству питания в АО «КШП – Глобус»</div>
                <?php $APPLICATION->IncludeComponent("bitrix:menu", "requirements", Array(
                    "COMPONENT_TEMPLATE" => ".default",
                    "ROOT_MENU_TYPE" => "requirements",    // Тип меню для первого уровня
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
</div>