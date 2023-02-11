<!-- close .container -->
</div>

<?php if (canShowFooterContacts()): ?>
    <div class="home-contacts-wrapper">
        <div class="container">
            <div class="home-contacts-title">Контакты</div>
        </div>
        <div class="home-contacts-container container">
            <div class="home-contacts-contact-container">
                <div class="home-contacts-contact">
                    <div class="home-contacts-contact-item contact-block-item --phone">
                        <div class="home-contacts-contact-item__label">Приемная</div>
                        <a class="home-contacts-contact-item__link contact-block-item__link" href="tel:+73852423008">+7 (3852) 42-30-08</a></div>
                    <div class="home-contacts-contact-item contact-block-item --phone">
                        <div class="home-contacts-contact-item__label">Производственный отдел</div>
                        <a class="home-contacts-contact-item__link contact-block-item__link" href="tel:+73852423008">+7 (3852) 42-63-78</a></div>
                    <div class="home-contacts-contact-item contact-block-item --phone">
                        <div class="home-contacts-contact-item__label">Бухгалтерия</div>
                        <a class="home-contacts-contact-item__link contact-block-item__link" href="tel:+73852423008">+7 (3852) 47-20-39</a></div>
                    <div class="home-contacts-contact-item contact-block-item --email">
                        <div class="home-contacts-contact-item__label">E-mail для обращения</div>
                        <a class="home-contacts-contact-item__link contact-block-item__link" href="mailto:info@кшп-глобус.рф">info@кшп-глобус.рф</a></div>
                </div>
                <div class="contacts-address">
                    <div class="contacts-address-first">Столовая, кулинария,<br>администрация, склад<br><span class="big">г. Барнаул, 50 лет СССР, 29</span></div>
                    <div class="contacts-address-second">Второй склад<br><span class="big">г. Барнаул, Глушкова, 48</span></div>
                </div>
            </div>
            <div class="home-contacts-map-container">
                <div class="home-contacts-map">
                    <script type="text/javascript" charset="utf-8" async="" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A905e2330af59220818f94a17873c79846e726aadb40c4d84971d214434d60877&amp;width=100%&amp;height=476&amp;lang=ru_RU&amp;scroll=true"></script>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>


<!-- close .main-content -->
</div>

<div class="footer-wrapper">
    <footer class="footer container">
        <div class="footer-row">
            <div class="footer-logo"><img class="footer-logo-image" src="<?= ASSETS_PATH; ?>/images/logo-light.svg"></div>
            <?php $APPLICATION->IncludeComponent("bitrix:menu", "footer", Array(
                "COMPONENT_TEMPLATE" => ".default",
                "ROOT_MENU_TYPE" => "footer",    // Тип меню для первого уровня
                "MENU_CACHE_TYPE" => "N",    // Тип кеширования
                "MENU_CACHE_TIME" => "3600",    // Время кеширования (сек.)
                "MENU_CACHE_USE_GROUPS" => "Y",    // Учитывать права доступа
                "MENU_CACHE_GET_VARS" => "",    // Значимые переменные запроса
                "MAX_LEVEL" => "1",    // Уровень вложенности меню
                "CHILD_MENU_TYPE" => "left",    // Тип меню для остальных уровней
                "USE_EXT" => "N",    // Подключать файлы с именами вида .тип_меню.menu_ext.php
                "DELAY" => "N",    // Откладывать выполнение шаблона меню
                "ALLOW_MULTI_SELECT" => "N",    // Разрешить несколько активных пунктов одновременно
            ),
                false
            ); ?>
        </div>
    </footer>
</div>


<!-- close .main-wrapper -->
</div>


<script src="<?= ASSETS_PATH; ?>/bundle.js"></script>
</body>
</html>