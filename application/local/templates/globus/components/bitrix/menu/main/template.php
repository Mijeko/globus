<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<?php if (!empty($arResult)): ?>

    <div class="swiper menu-slider">
        <div class="swiper-wrapper menu">

            <?php foreach ($arResult as $arItem): ?>
                <?php if ($arParams["MAX_LEVEL"] == 1 && $arItem["DEPTH_LEVEL"] > 1): ?>
                    <?php continue; ?>
                <?php endif ?>


                <?php if ($arItem["SELECTED"]): ?>
                    <div class="menu-item-wrapper swiper-slide"><a class="menu-item active" href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a></div>
                <?php else: ?>
                    <div class="menu-item-wrapper swiper-slide"><a class="menu-item" href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a></div>
                <?php endif ?>

            <?php endforeach ?>

        </div>
    </div>

<?php endif ?>
