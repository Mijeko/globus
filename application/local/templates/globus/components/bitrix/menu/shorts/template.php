<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>


<div class="home-short-phrase-list">
    <?php foreach ($arResult as $arItem): ?>
        <div class="home-short-phrase-list-item"><?= $arItem["TEXT"]; ?></div>
    <?php endforeach ?>
</div>
