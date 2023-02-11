<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>
<?php $APPLICATION->SetTitle('Главная страница'); ?>
    <div class="container">
        <div class="home-slider-container">
            <div class="swiper home-slider-text">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="home-slider-title">«КШП – Глобус» берет на себя ответственность</div>
                        <div class="home-slider-description">За реализацию Политики в области качества и безопасности пищевой продукции.<br>Обеспечиваем сбалансированное питание для детей: соблюдаем все нормы по содержанию белков, жиров, углеводов в наших блюдах.</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="home-slider-title">Реагируем на все обращения граждан</div>
                        <div class="home-slider-description">Проводим встречи с родителями, разъясняем информацию по возникающим вопросам, принимаем гостей в наших столовых, открыты к обратной связи.</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="home-slider-title">Контролируем санитарные нормы</div>
                        <div class="home-slider-description">Проверяем состояние производственных помещений, инвентаря, посуды, а также проводим регулярные проверки работников на соблюдение правил личной гигиены.</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="home-slider-title">Производим контроль при закупках сырья</div>
                        <div class="home-slider-description">Контролируем правильность закладки продуктов и соблюдения параметров технологических процессов при приготовлении блюд.</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="home-slider-title">Прививаем ответственность сотрудникам</div>
                        <div class="home-slider-description">За обеспечение безопасности пищевой продукции и соблюдением требований нормативной документации.</div>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="home-slider-pagination-control">
                    <div class="home-slider-pagination-control-fraction" id="pagination-control-fraction"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="swiper home-slider-images">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/home/1.png"></div>
                    <div class="swiper-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/home/2.png"></div>
                    <div class="swiper-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/home/3.png"></div>
                    <div class="swiper-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/home/4.png"></div>
                    <div class="swiper-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/home/5.png"></div>
                </div>
            </div>
        </div>
        <div class="home-short-phrase-container">
            <div class="home-short-phrase-logo"><img src="<?= ASSETS_PATH; ?>/images/logo.svg"></div>
            <div class="home-short-phrase-list">
                <div class="home-short-phrase-list-item">Вкусное и здоровое питание в школах и детских лагерях</div>
                <div class="home-short-phrase-list-item">Свежие продукты от проверенных поставщиков</div>
                <div class="home-short-phrase-list-item">Наличие всех документов и сертификатов</div>
            </div>
        </div>
    </div>
    <div class="home-statistic-container home-statistic-slider">
        <div class="home-statistic container swiper-wrapper">
            <div class="home-statistic-item swiper-slide">
                <div class="home-statistic-item__number">590</div>
                <div class="home-statistic-item__label">Работников в школьных<br>столовых</div>
            </div>
            <div class="home-statistic-item swiper-slide">
                <div class="home-statistic-item__number">80</div>
                <div class="home-statistic-item__label">Довольных школ с вкусным<br>и правильным питанием</div>
            </div>
            <div class="home-statistic-item swiper-slide">
                <div class="home-statistic-item__number">1000</div>
                <div class="home-statistic-item__label">Сытых школьников<br>и довольных родителей</div>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="container">
        <div class="important-parent">
            <div class="important-parent-title">Важно для родителей</div>
            <div class="important-parent-list-wrppaer">
                <div class="important-parent-list">
                    <div class="important-parent-list-item"><a class="important-parent-list-item__title" href="/">Наша еда не бывает холодной</a>
                        <div class="important-parent-list-item__description">Во всех школах регулируется температура подачи блюд, также она измеряется термометрами. Готовят еду при температуре 180-250 С. Пища, комфортная для приема - не более 40 С.<br>Линии раздачи оснащены подогревом: электрическим или водяным, чтобы поддерживать температуру готовых блюд. Пища подается комнатной температуры для здоровья детей.<br>Также у всех плит и холодильников соблюдаются температурные режимы.</div>
                        <div class="important-parent-gallery"><a href="<?= ASSETS_PATH; ?>/images/important-parent/1/1.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/1/1.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/1/2.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/1/2.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/1/3.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/1/3.png"></a></div>
                    </div>
                    <div class="important-parent-list-item"><a class="important-parent-list-item__title" href="/">Блюда готовятся в школе</a>
                        <div class="important-parent-list-item__description">Приготовление питания происходит на месте в школьных столовых. Столовые устроены таким образом, что процесс приготовления пищи виден полностью.</div>
                        <div class="important-parent-gallery"><a href="<?= ASSETS_PATH; ?>/images/important-parent/2/1.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/2/1.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/2/2.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/2/2.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/2/3.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/2/3.png"></a></div>
                    </div>
                    <div class="important-parent-list-item"><a class="important-parent-list-item__title" href="/">Многоступенчатый контроль за качеством продуктов</a>
                        <div class="important-parent-list-item__description">
                            <div>При приеме продуктов используется система пищевой безопасности ХАССП. Также на предприятии у каждого работника есть памятки по проверке качества продукции.</div>
                            <div class='b'>Сырье проходит 3 уровня проверки:</div>
                            <div class='p'>1. При приеме в «КШП – Глобус»</div>
                            <div>Проходит тщательный отбор поставщиков и входной контроль сырья: проводим тестирования, анализы в лаборатории Россельхознадзора, собираем комиссию по документам (производится проверка соответствия нормативам для школьных комбинатов, проверяются сертификаты соответствия и сертификаты государственных регистраций), подписываются акты тестирования на пригодность. Продукты взвешивают, осматривают на вкус, цвет, запах (органолептика). Только после всего перечисленного сырье идет в работу.</div>
                            <div class='p'>2. Заведующей столовой</div>
                            <div>На точках заведующие столовых проверяют продукцию по счету, по весу, по органолептике (визуально, по вкусу, по обонянию и осязанию) и другим характеристикам.</div>
                            <div class='p'>3. Поваром при непосредственной готовке</div>
                            Проводится повторная проверка продукции по всем вышеперечисленным характеристикам.
                        </div>
                        <div class="important-parent-gallery"><a href="<?= ASSETS_PATH; ?>/images/important-parent/3/1.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/3/1.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/3/2.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/3/2.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/3/3.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/3/3.png"></a></div>
                    </div>
                    <div class="important-parent-list-item"><a class="important-parent-list-item__title" href="/">Открытая кухня</a>
                        <div class="important-parent-list-item__description">Приглашаем родителей в наши столовые, чтобы убедиться в качестве блюд, которые их дети едят в школе каждый день.</div>
                        <div class="important-parent-gallery"><a href="<?= ASSETS_PATH; ?>/images/important-parent/4/1.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/4/1.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/4/2.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/4/2.png"></a><a href="<?= ASSETS_PATH; ?>/images/important-parent/4/3.png" data-lightbox="roadtrip"><img class="important-parent-gallery-item" src="<?= ASSETS_PATH; ?>/images/important-parent/4/3.png"></a></div>
                    </div>
                </div>
                <div class="important-parent-note">
                    <div class="important-parent-note__title">Требования к питанию</div>
                    <div class="important-parent-note__description">Основные трбования к качеству питания в АО «КШП – Глобус»</div>
                    <ol class="requirements-list">
                        <li class="requirements-list-item"><a class="requirements-list-link" href="">Сан.Пин 2.3/2.4.3590-20 «Санитарно-эпидемиологические требования к организации общественного питания»</a></li>
                        <li class="requirements-list-item"><a class="requirements-list-link" href="">МР 2.4.0179-20 «Рекомендации по организации питания для обучающихся образовательных организаций»</a></li>
                        <li class="requirements-list-item"><a class="requirements-list-link" href="">Приложение №6 к СанПиН 2.3/2.4.3590-20 «Перечень пищевой продукции, которая не допускается при организации питания детей»</a></li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="eat-slider-container">
            <div class="eat-slider-title">Блюда, которые едят ваши дети</div>
            <div class="swiper eat-slider">
                <div class="swiper-wrapper eat-slider-wrapper">
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/1.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/2.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/3.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/4.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/1.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/2.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/3.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/4.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/1.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/2.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/3.png"></div>
                    <div class="swiper-slide eat-slider-slide"><img src="<?= ASSETS_PATH; ?>/images/slider/eat/4.png"></div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="common-info">
            <div class="common-info-title">Основаная<br>информация о комбинате</div>
            <div class="common-info-group">
                <div class="common-info-left"><img src="<?= ASSETS_PATH; ?>/images/common-info-left.png"></div>
                <div class="common-info-right">
                    <div class="common-info-text">
                        <div class="common-info-text__description">Для современного мира убеждённость некоторых оппонентов влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствующей насущным потребностям. Повседневная практика показывает, что начало повседневной.</div>
                        <a class="common-info-text__link" href="/">Подробнее</a></div>
                    <img src="<?= ASSETS_PATH; ?>/images/common-info-right.png"></div>
            </div>
        </div>
    </div>
    <div class="sticker">
        <div class="sticker-image"></div>
        <div class="sticker-image"></div>
    </div>
    <div class="container">
        <div class="dialog-us">
            <div class="dialog-us-image"><img src="<?= ASSETS_PATH; ?>/images/dialog.png"></div>
            <div class="dialog-us-container">
                <div class="dialog-us-title">Диалог с комбинатом</div>
                <div class="dialog-us-description">Cпециалисты нашего комбината с удовольствием ответят на вопросы! Заполните форму ниже, затем мы с Вами свяжемся и ответим на все Ваши вопросы.</div>
                <div class="dialog-us-form-container">
                    <form class="common-form dialog-us-form">
                        <div class="common-form-row grouped">
                            <div class="common-form-element"><input class="common-form-input" type="text" name="name" placeholder="Ваше имя*"></div>
                            <div class="common-form-element"><input class="common-form-input js-mask-ru" type="tel" name="phone" placeholder="Ваш телефон*"></div>
                        </div>
                        <div class="common-form-row">
                            <div class="common-form-element"><input class="common-form-input" type="email" name="email" placeholder="Ваш e-mail"></div>
                        </div>
                        <div class="common-form-row">
                            <div class="common-form-element"><textarea class="common-form-textarea" name="message" placeholder="Напишите ваш вопрос*"></textarea></div>
                        </div>
                        <div class="common-form-row grouped">
                            <div class="common-form-element radio"><input type="radio" id="type_contact_1" name="type_contact" checked="checked" value="1"><label for="type_contact_1">Перезвонить по телефон</label></div>
                            <div class="common-form-element radio"><input type="radio" id="type_contact_2" name="type_contact" value="2"><label for="type_contact_2">Ответить на email</label></div>
                        </div>
                        <div class="common-form-row grouped common-form-agree-container">
                            <div class="common-form-agree">Наживая на кнопку “отправить” вы даете согласие на обработку <a href="">персональных данных</a> и <a href="">соглашение о пользовании сайтом</a></div>
                            <button class="common-form-submit btn-main" type="submit">Отправить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="contragents">
            <div class="contragents-title">Кто с нами сотрудничает</div>
            <div class="contragents-filter">
                <div class="contragents-filter-item school">Школы</div>
                <div class="contragents-filter-item camp">Детские лагеря</div>
            </div>
            <div class="contragents-map">
                <script type="text/javascript" charset="utf-8" async="" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Aaa71dfd284efbb64a8522129cb56169226f88b4468db1d5f1aebeb5c978ee1a2&amp;width=100%25&amp;height=480&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
        </div>
        <div class="home-about-container">
            <div class="home-about">
                <div class="home-about-title">Столовая «Нива»</div>
                <div class="home-about-description">Для современного мира убеждённость некоторых оппонентов влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствующей насущным потребностям.</div>
                <a class="home-about-link btn-main" href="">Посетить</a></div>
            <div class="home-about-slider swiper">
                <div class="jelly-slider-container home-about-wrapper swiper-wrapper">
                    <div class="jelly-slider-box swiper-slide"><img src="https://source.unsplash.com/1000x800"></div>
                    <div class="jelly-slider-box swiper-slide"><img src="https://source.unsplash.com/1000x802"></div>
                    <div class="jelly-slider-box swiper-slide"><img src="https://source.unsplash.com/1000x804"></div>
                    <div class="jelly-slider-box swiper-slide"><img src="https://source.unsplash.com/1000x806"></div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>