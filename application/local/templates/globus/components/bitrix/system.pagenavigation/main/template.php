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

if (!$arResult["NavShowAlways"]) {
    if ($arResult["NavRecordCount"] == 0 || ($arResult["NavPageCount"] == 1 && $arResult["NavShowAll"] == false))
        return;
}

$strNavQueryString = ($arResult["NavQueryString"] != "" ? $arResult["NavQueryString"] . "&amp;" : "");
$strNavQueryStringFull = ($arResult["NavQueryString"] != "" ? "?" . $arResult["NavQueryString"] : "");
?>


<?php if ($arResult["bDescPageNumbering"] === true): ?>


<?php else: ?>

<div class="pagination">

    <?php if ($arResult["NavPageNomer"] > 1): ?>

        <?php if ($arResult["bSavePage"]): ?>
            <a href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>PAGEN_<?= $arResult["NavNum"] ?>=1">>></a>
            <a href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>PAGEN_<?= $arResult["NavNum"] ?>=<?= ($arResult["NavPageNomer"] - 1) ?>"><<</a>
        <?php else: ?>
            <?php /*<a href="<?= $arResult["sUrlPath"] ?><?= $strNavQueryStringFull ?>">>></a>*/ ?>
            <?php if ($arResult["NavPageNomer"] > 2): ?>
                <div class="pagination-item"><a href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>PAGEN_<?= $arResult["NavNum"] ?>=<?= ($arResult["NavPageNomer"] - 1) ?>" class="pagination-link"><img src="<?= ASSETS_PATH; ?>/images/arrow-left.svg"></a></div>
            <?php else: ?>
                <div class="pagination-item"><a href="<?= $arResult["sUrlPath"] ?><?= $strNavQueryStringFull ?>" class="pagination-link"><img src="<?= ASSETS_PATH; ?>/images/arrow-left.svg"></a></div>
            <?php endif ?>
        <?php endif ?>
    <?php endif ?>

    <?php while ($arResult["nStartPage"] <= $arResult["nEndPage"]): ?>

        <?php if ($arResult["nStartPage"] == $arResult["NavPageNomer"]): ?>
            <div class="pagination-item active"><a class="pagination-link"><?= $arResult["nStartPage"] ?></a></div>
        <?php elseif ($arResult["nStartPage"] == 1 && $arResult["bSavePage"] == false): ?>
            <div class="pagination-item"><a class="pagination-link" href="<?= $arResult["sUrlPath"] ?><?= $strNavQueryStringFull ?>"><?= $arResult["nStartPage"] ?></a></div>
        <?php else: ?>
            <div class="pagination-item"><a class="pagination-link" href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>PAGEN_<?= $arResult["NavNum"] ?>=<?= $arResult["nStartPage"] ?>"><?= $arResult["nStartPage"] ?></a></div>
        <?php endif ?>
        <?php $arResult["nStartPage"]++ ?>
    <?php endwhile ?>

    <?php if ($arResult["NavPageNomer"] < $arResult["NavPageCount"]): ?>
        <div class="pagination-item"><a class="pagination-link" href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>PAGEN_<?= $arResult["NavNum"] ?>=<?= ($arResult["NavPageNomer"] + 1) ?>"><img src="<?= ASSETS_PATH; ?>/images/arrow-right.svg"></a></div>
    <?php endif ?>

    <?php endif ?>


    <?php if ($arResult["bShowAll"]): ?>
        <noindex>
            <?php if ($arResult["NavShowAll"]): ?>
                <a href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>SHOWALL_<?= $arResult["NavNum"] ?>=0" rel="nofollow"><?= GetMessage("nav_paged") ?></a>
            <?php else: ?>
                <a href="<?= $arResult["sUrlPath"] ?>?<?= $strNavQueryString ?>SHOWALL_<?= $arResult["NavNum"] ?>=1" rel="nofollow"><?= GetMessage("nav_all") ?></a>
            <?php endif ?>
        </noindex>
    <?php endif ?>

</div>