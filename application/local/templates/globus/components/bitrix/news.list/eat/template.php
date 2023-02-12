<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
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




<div class="eat-slider-container">
    <div class="eat-slider-title">Блюда, которые едят ваши дети</div>
    <div class="swiper eat-slider">
        <div class="swiper-wrapper eat-slider-wrapper">
            <? foreach ($arResult["ITEMS"] as $arItem): ?>
                <?
                $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
                $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
                ?>
                <div id="<?= $this->GetEditAreaId($arItem['ID']); ?>" class="swiper-slide eat-slider-slide"><img src="<?=$arItem['PREVIEW_PICTURE']['SRC'];?>"></div>
            <? endforeach; ?>

        </div>
        <div class="swiper-pagination"></div>
    </div>
</div>