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
<div class="recipes-list">

    <?php foreach ($arResult["ITEMS"] as $arItem): ?>

        <?
        $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
        $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
        ?>


        <div class="recipes-item" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">


            <div class="recipes-item-title" data-toggle="collapse" data-target="#collapseExample-<?= $arItem['ID']; ?>"><?= $arItem['NAME']; ?></div>
            <div class="collapse recipes-item-content" id="collapseExample-<?= $arItem['ID']; ?>">

                <div class="recipes-item-ingredients">

                    <?php foreach ($arItem['PROPERTIES']['INGREDIENTS']['VALUE'] as $indi): ?>
                        <div class="recipes-item-ingredient"><?= $indi; ?></div>
                    <?php endforeach; ?>

                </div>


                <ol class="recipes-item-steps">

                    <?php foreach ($arItem['PROPERTIES']['STEPS']['VALUE'] as $step): ?>
                        <li class="recipes-item-step"><?= $step; ?></li>
                    <?php endforeach; ?>

                </ol>
            </div>
        </div>

    <?php endforeach; ?>

</div>