<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<? if (!empty($arResult)): ?>
    <div class="header-address">
        <?php foreach ($arResult as $arItem): ?>
            <div class="header-address-item"><?= $arItem['TEXT']; ?></div>
        <?php endforeach ?>
    </div>
<?php endif ?>