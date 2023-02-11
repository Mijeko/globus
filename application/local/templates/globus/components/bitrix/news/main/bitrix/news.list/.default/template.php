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
<div class="news-list">
    <?php if ($arParams["DISPLAY_TOP_PAGER"]): ?>
        <?= $arResult["NAV_STRING"] ?><br/>
    <?php endif; ?>

    <?php foreach ($arResult["ITEMS"] as $arItem): ?>
        <?php

        $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
        $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
        ?>

        <div class="news-list-item" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
            <div class="news-list-item-image"><img src="<?= $arItem['PREVIEW_PICTURE']['SRC']; ?>"></div>
            <div class="news-list-item-info">
                <div class="news-list-item-info__date">
                    <?php if ($arParams["DISPLAY_DATE"] != "N" && $arItem["DISPLAY_ACTIVE_FROM"]): ?>
                        <?= $arItem["DISPLAY_ACTIVE_FROM"] ?>
                    <?php endif ?>
                </div>
                <a class="news-list-item-info__title" href="<?= $arItem['DETAIL_PAGE_URL']; ?>"><?= $arItem["NAME"] ?></a>
                <div class="news-list-item-info__description">
                    <?= $arItem['PREVIEW_TEXT']; ?>
                </div>
            </div>
            <div class="news-list-item-action"><a class="news-list-item-action__view" href="<?= $arItem['DETAIL_PAGE_URL']; ?>">Прочитать</a></div>
        </div>

    <?php endforeach; ?>


    <?php if ($arParams["DISPLAY_BOTTOM_PAGER"]): ?>
        <br/><?= $arResult["NAV_STRING"] ?>
    <?php endif; ?>
</div>
