import Swiper from 'swiper/bundle';

let homeStatisticSlider, menuSlider, homeAboutSlider, moreNews;

initMenuSlider();
initStatisticSlider();
initHomeAboutSlider();
initMoreNews();
window.addEventListener('resize', function (event) {

    initMenuSlider();
    initStatisticSlider();
    initHomeAboutSlider();
    initMoreNews();
}, true);

function windowWidth() {
    return window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
}

function initMoreNews() {

    if (windowWidth() > 1100) {

        if (moreNews) {
            moreNews.destroy();
        }

        return false;
    }


    moreNews = new Swiper(".more-news-slider", {
        slidesPerView: 2,
        breakpoints: {
            610: {
                slidesPerView: 3,
            },
        },
        pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
        },
    });

}

function initHomeAboutSlider() {
    let jelly = document.querySelector('.home-about-wrapper');

    if (windowWidth() > 610) {


        if (jelly) {
            if (!jelly.classList.contains('jelly-slider-container')) {
                jelly.classList.add('jelly-slider-container');
            }
        }


        if (homeAboutSlider) {
            homeAboutSlider.destroy();
        }

        return false;
    } else {
        if (jelly) {
            if (jelly.classList.contains('jelly-slider-container')) {
                jelly.classList.remove('jelly-slider-container');
            }
        }
    }


    homeAboutSlider = new Swiper(".home-about-slider", {
        slidesPerView: 4,
        loop: true,
        spaceBetween: 10,
        pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
        },
    });
}

function initStatisticSlider() {

    if (windowWidth() > 610) {

        if (homeStatisticSlider) {
            homeStatisticSlider.destroy();
        }

        return false;
    }

    homeStatisticSlider = new Swiper(".home-statistic-slider", {
        slidesPerView: 1.2,
        pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
        },
    });
}

function initMenuSlider() {

    if (windowWidth() > 1263) {

        if (menuSlider) {
            menuSlider.destroy();
        }

        return false;
    }

    menuSlider = new Swiper(".menu-slider", {
        slidesPerView: 2.5,
        breakpoints: {
            470: {
                slidesPerView: 4.5,
            },
        }
    });
}

const homeSliderImages = new Swiper(".home-slider-images", {
    loop: true,
    effect: 'fade',
    spaceBetween: 10,
});

const fraction = document.getElementById("pagination-control-fraction");
const homeSliderText = new Swiper(".home-slider-text", {
    loop: true,
    effect: 'fade',
    spaceBetween: 10,
    pagination: {
        el: ".swiper-pagination",
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    on: {
        init: (swiper) => {
            fraction.innerHTML = renderFraction(swiper);
        },
        slideChange: (swiper) => {
            fraction.innerHTML = renderFraction(swiper);
        }
    }
});

const eatSlider = new Swiper(".eat-slider", {
    slidesPerView: 'auto',
    pagination: {
        el: ".swiper-pagination",
        type: "progressbar",
    },
});

function renderFraction(swiper) {

    let all = swiper.slides.length - 2;
    let pos = swiper.realIndex + 1;
    let htmlPos = pos;
    let htmlAll = all;

    if (pos < 10) {
        htmlPos = `0${pos}`;
    }

    if (all < 10) {
        htmlAll = `0${all}`;
    }
    return `<span class="current">${htmlPos}</span><span class="split">/</span><span class="all">${htmlAll}</span>`;
}


homeSliderText.controller.control = homeSliderImages;
homeSliderImages.controller.control = homeSliderText;