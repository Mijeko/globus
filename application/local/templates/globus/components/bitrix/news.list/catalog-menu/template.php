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
<div class="menu-catalog">

    <?php foreach ($arResult["ITEMS"] as $arItem): ?>

        <?
        $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
        $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
        ?>

        <div class="menu-catalog-item-wrapper" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
            <div class="menu-catalog-item">
                <div class="menu-catalog-item__date"><span>Дата:</span> <?= $arItem['ACTIVE_FROM']; ?></div>
                <a href="<?= $arItem['DISPLAY_PROPERTIES']['FILE']['FILE_VALUE']['SRC'] ?>" target="_blank">
                    <img class="menu-catalog-item__image" src="<?= $arItem['PREVIEW_PICTURE']['SRC'] ?>">
                </a>
            </div>
        </div>
    <?php endforeach; ?>

</div>