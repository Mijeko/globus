<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('Контакты') ?>
    <div class="contacts-container">
        <div class="contact-block-container">
            <div class="contact-block --light">
                <div class="contact-block-item --phone">
                    <div class="contact-block-item__label">Приемная</div>
                    <a class="contact-block-item__link" href="tel:+73852423008">+7 (3852) 42-30-08</a></div>
                <div class="contact-block-item --phone">
                    <div class="contact-block-item__label">Производственный отдел</div>
                    <a class="contact-block-item__link" href="tel:+73852423008">+7 (3852) 42-63-78</a></div>
                <div class="contact-block-item --phone">
                    <div class="contact-block-item__label">Бухгалтерия</div>
                    <a class="contact-block-item__link" href="tel:+73852423008">+7 (3852) 47-20-39</a></div>
                <div class="contact-block-item --email">
                    <div class="contact-block-item__label">E-mail для обращения</div>
                    <a class="contact-block-item__link" href="mailto:info@кшп-глобус.рф">info@кшп-глобус.рф</a></div>
            </div>
            <div class="contacts-address --light">
                <div class="contacts-address-first">Столовая, кулинария,<br>администрация, склад<br><span class="big">г. Барнаул, 50 лет СССР, 29</span></div>
                <div class="contacts-address-second">Второй склад<br><span class="big">г. Барнаул, Глушкова, 48</span></div>
            </div>
        </div>
        <div class="contacts-map-container">
            <div class="contacts-map">
                <script type="text/javascript" charset="utf-8" async="" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A905e2330af59220818f94a17873c79846e726aadb40c4d84971d214434d60877&amp;width=835&amp;height=476&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
        </div>
    </div>
    <div class="contacts-requsites-container">
        <div class="contacts-requsites">
            <div class="contacts-title">Наши реквизиты</div>
            <div class="contacts-requsites-text"><p>Наименование организации:</p>
                <p>АО «КШП – Глобус»</p>
                <p>ИНН: 2222071373</p>
                <p>ОГРН: 1082222001762</p></div>
        </div>
        <div class="contacts-link-container">
            <div class="contacts-title">Полезные ссылки</div>
            <div class="contacts-link-list">
                <div class="contacts-link-item-wrapper">
                    <div class="contacts-link-item">
                        <div class="contacts-link-item-img-wrapper"><img class="contacts-link-item-img" src="<?= ASSETS_PATH; ?>/images/useful/1.png"></div>
                        <a class="contacts-link-item__title" href="https://www.google.com/" targe="_blank">Комитет по образованию</a></div>
                </div>
                <div class="contacts-link-item-wrapper">
                    <div class="contacts-link-item">
                        <div class="contacts-link-item-img-wrapper"><img class="contacts-link-item-img" src="<?= ASSETS_PATH; ?>/images/useful/2.png"></div>
                        <a class="contacts-link-item__title" href="https://www.google.com/" targe="_blank">Администрация г. Барнаула</a></div>
                </div>
                <div class="contacts-link-item-wrapper">
                    <div class="contacts-link-item">
                        <div class="contacts-link-item-img-wrapper"><img class="contacts-link-item-img" src="<?= ASSETS_PATH; ?>/images/useful/3.png"></div>
                        <a class="contacts-link-item__title" href="https://www.google.com/" targe="_blank">Управление муниципальной собственностью</a></div>
                </div>
            </div>
        </div>
    </div>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>