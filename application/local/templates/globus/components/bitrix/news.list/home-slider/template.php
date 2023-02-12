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


<div class="home-slider-container">
    <div class="swiper home-slider-text">
        <div class="swiper-wrapper">
            <?php foreach ($arResult["ITEMS"] as $arItem): ?>
                <?
                $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
                $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
                ?>
                <div class="swiper-slide" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
                    <div class="home-slider-title"><?= $arItem['NAME']; ?></div>
                    <div class="home-slider-description"><?= $arItem['PREVIEW_TEXT']; ?></div>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="home-slider-pagination-control">
            <div class="home-slider-pagination-control-fraction" id="pagination-control-fraction"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="swiper home-slider-images">
        <div class="swiper-wrapper">
            <?php foreach ($arResult["ITEMS"] as $arItem): ?>
                <div class="swiper-slide"><img alt="<?= $arItem['NAME']; ?>" src="<?= $arItem['PREVIEW_PICTURE']['SRC']; ?>"></div>
            <?php endforeach; ?>
        </div>
    </div>
</div>