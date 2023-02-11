<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php");
$APPLICATION->SetTitle('Услуги');
?>

    <div class="menu-index-list">
        <div class="menu-index-list-item-wrapper">
            <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">
                <div class="menu-index-list-item__title">Столовая Нива</div>
                <a class="menu-index-list-item__link" href="eat/">Подробнее</a></div>
        </div>
        <div class="menu-index-list-item-wrapper">
            <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">
                <div class="menu-index-list-item__title">Кулинария</div>
                <a class="menu-index-list-item__link" href="cook/">Подробнее</a></div>
        </div>
    </div>

<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>