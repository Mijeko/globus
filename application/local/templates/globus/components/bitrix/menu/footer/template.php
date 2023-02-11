<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<? if (!empty($arResult)): ?>

    <div class="footer-menu">

        <?php foreach ($arResult as $arItem): ?>
            <?php if ($arParams["MAX_LEVEL"] == 1 && $arItem["DEPTH_LEVEL"] > 1): ?>
                <?php continue; ?>
            <?php endif; ?>

            <? if ($arItem["SELECTED"]): ?>
                <div class="footer-menu-item"><a class="footer-menu-item-link" href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a></div>
            <? else: ?>
                <div class="footer-menu-item"><a class="footer-menu-item-link" href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a></div>
            <? endif ?>

        <? endforeach ?>
    </div>

<? endif ?>