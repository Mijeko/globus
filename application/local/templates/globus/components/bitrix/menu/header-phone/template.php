<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<?php if (!empty($arResult)): ?>
    <div class="header-contacts">

        <?php foreach ($arResult as $arItem): ?>
            <a class="header-contacts-link" href="<?= $arItem['LINK']; ?>"><?= $arItem['TEXT']; ?></a>
        <? endforeach ?>

    </div>
<? endif ?>