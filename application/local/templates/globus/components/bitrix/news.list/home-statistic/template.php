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


<div class="home-statistic-container home-statistic-slider">
    <div class="home-statistic container swiper-wrapper">

        <?php foreach ($arResult["ITEMS"] as $arItem): ?>
            <?
            $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
            $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
            ?>
            <div class="home-statistic-item swiper-slide" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
                <div class="home-statistic-item__number"><?= $arItem['PREVIEW_TEXT']; ?></div>
                <div class="home-statistic-item__label"><?= $arItem['DETAIL_TEXT']; ?></div>
            </div>
        <?php endforeach; ?>

    </div>
    <div class="swiper-pagination"></div>
</div>