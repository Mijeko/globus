<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('Меню'); ?>
    <div class="menu-index-list">
        <div class="menu-index-list-item-wrapper">
            <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">
                <div class="menu-index-list-item__title">Меню для школ</div>
                <a class="menu-index-list-item__link" href="school/">Подробнее</a></div>
        </div>
        <div class="menu-index-list-item-wrapper">
            <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">
                <div class="menu-index-list-item__title">Меню для лагерей<br>(сезонное)</div>
                <a class="menu-index-list-item__link" href="camp/">Подробнее</a></div>
        </div>
        <div class="menu-index-list-item-wrapper">
            <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/3.png);">
                <div class="menu-index-list-item__title">Рецепты</div>
                <a class="menu-index-list-item__link" href="cooking/">Подробнее</a></div>
        </div>
    </div>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>