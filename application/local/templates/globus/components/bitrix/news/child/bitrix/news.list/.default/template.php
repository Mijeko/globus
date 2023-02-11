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


<div class="for-child-container">
    <? if ($arParams["DISPLAY_TOP_PAGER"]): ?>
        <?= $arResult["NAV_STRING"] ?><br/>
    <? endif; ?>
    <div class="for-child-list">

        <? foreach ($arResult["ITEMS"] as $arItem): ?>
            <?
            $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
            $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
            ?>
            <div class="for-child-item-wrapper" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
                <div class="for-child-item">
                    <div class="for-child-item-content">
                        <div class="for-child-item-preview" data-fancybox href="<?= $arItem['PROPERTIES']['LINK']['VALUE']; ?>"><img src="<?= $arItem['PREVIEW_PICTURE']['SRC']; ?>"></div>
                        <div class="for-child-item-title"><?= $arItem['NAME']; ?></div>
                        <div class="for-child-item-description"><?= $arItem['PREVIEW_TEXT']; ?></div>
                        <div class="for-child-item-view btn-main" data-fancybox href="<?= $arItem['PROPERTIES']['LINK']['VALUE']; ?>">Смотреть</div>
                    </div>
                </div>
            </div>
        <? endforeach; ?>

    </div>

    <? if ($arParams["DISPLAY_BOTTOM_PAGER"]): ?>
        <br/><?= $arResult["NAV_STRING"] ?>
    <? endif; ?>
</div>
