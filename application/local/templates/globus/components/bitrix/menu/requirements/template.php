<?php if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>

<?php if (!empty($arResult)): ?>
    <ol class="requirements-list">
        <?php foreach ($arResult as $arItem): ?>
            <li class="requirements-list-item"><a class="requirements-list-link" href="<?= $arItem['LINK']; ?>"><?= $arItem['TEXT']; ?></a></li>
        <?php endforeach ?>
    </ol>
<?php endif ?>