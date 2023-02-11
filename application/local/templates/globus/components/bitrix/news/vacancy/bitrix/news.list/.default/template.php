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
<div class="vacancy-list">
    <?php if ($arParams["DISPLAY_TOP_PAGER"]): ?>
        <?= $arResult["NAV_STRING"] ?><br/>
    <?php endif; ?>

    <?php foreach ($arResult["ITEMS"] as $arItem): ?>
        <?php
        $this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
        $this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
        ?>
        <div class="vacancy-item" id="<?= $this->GetEditAreaId($arItem['ID']); ?>">
            <div class="vacancy-item__title"><?= $arItem['NAME']; ?></div>
            <div class="vacancy-item__money"><?= $arItem['PROPERTIES']['MONEY']['VALUE']; ?></div>
            <div class="vacancy-item__description"><?= $arItem['DETAIL_TEXT']; ?></div>

            <?php if ($arItem['PROPERTIES']['REQUIRED']): ?>
                <div class="vacancy-marks-title">Обязанности</div>
                <div class="vacancy-marks">
                    <?php foreach ($arItem['PROPERTIES']['REQUIRED']['VALUE'] as $row): ?>
                        <div class="vacancy-marks-item"><?= $row; ?>;</div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>



            <?php if ($arItem['PROPERTIES']['REQUIREMENTS'] || $arItem['PROPERTIES']['RULES']): ?>
                <div class="collapse" id="collapseExample">
            <?php endif; ?>
                    <?php if ($arItem['PROPERTIES']['REQUIREMENTS']): ?>
                        <div class="vacancy-marks-title">Требования</div>
                        <div class="vacancy-marks">
                            <?php foreach ($arItem['PROPERTIES']['REQUIREMENTS']['VALUE'] as $row): ?>
                                <div class="vacancy-marks-item"><?= $row; ?>;</div>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>


                    <?php if ($arItem['PROPERTIES']['RULES']): ?>
                        <div class="vacancy-marks-title">Условия</div>
                        <div class="vacancy-marks">
                            <?php foreach ($arItem['PROPERTIES']['RULES']['VALUE'] as $row): ?>
                                <div class="vacancy-marks-item"><?= $row; ?>;</div>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>
            <?php if ($arItem['PROPERTIES']['REQUIREMENTS'] || $arItem['PROPERTIES']['RULES']): ?>
                </div>
            <?php endif; ?>


            <div class="vacancy-item-actions">
                <div class="vacancy-item-actions-item btn-light" data-toggle="collapse" data-target="#collapseExample">Подробнее</div>
                <div class="vacancy-item-actions-item btn-main" data-fancybox data-src="/ajax/index.php?action=form_vacancy&vacancy_id=1" data-type="ajax">Откликнуться</div>
            </div>
        </div>
    <?php endforeach; ?>


    <?php if ($arParams["DISPLAY_BOTTOM_PAGER"]): ?>
        <br/><?= $arResult["NAV_STRING"] ?>
    <?php endif; ?>
</div>
