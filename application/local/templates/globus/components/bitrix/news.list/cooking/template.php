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


<div class="home-about-slider swiper">
    <div class="jelly-slider-container home-about-wrapper swiper-wrapper">

        <? foreach ($arResult["ITEMS"] as $arItem): ?>
            <?
            $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
            $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
            ?>

            <div class="jelly-slider-box swiper-slide" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
                <img src="<?= $arItem['PREVIEW_PICTURE']['SRC'] ? $arItem['PREVIEW_PICTURE']['SRC'] : 'https://source.unsplash.com/1000x800' ?>">
            </div>
        <? endforeach; ?>


    </div>
    <div class="swiper-pagination"></div>
</div>
