<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<?php if (!empty($arResult)): ?>

    <div class="upper-header ">

        <?php foreach ($arResult as $arItem): ?>
            <?php if ($arParams["MAX_LEVEL"] == 1 && $arItem["DEPTH_LEVEL"] > 1): ?>
                <?php continue; ?>
            <?php endif ?>


            <a class="upper-header-link <?= ($iterator == 1 ? 'btn-filled' : 'btn-light'); ?>" href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a>

        <?php endforeach ?>
    </div>

<?php endif ?>