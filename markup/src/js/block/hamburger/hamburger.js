export class Hamburger {

    selectorButton = '.js-show-hamburger';
    selectorHideButton = '.js-hide-hamburger';
    selectorLayer = '.header-mobile-layer';

    constructor() {

        this.button = document.querySelector(this.selectorButton);
        this.buttonHide = document.querySelector(this.selectorHideButton);
        this.layer = document.querySelector(this.selectorLayer);

        this.init();
    }

    init() {
        if (this.button) {
            this.button.onclick = this.handleClick;
        }

        if (this.buttonHide) {
            this.buttonHide.onclick = this.handleHide;
        }
    }

    handleClick = () => {
        if (!this.layer.classList.contains('active')) {
            this.layer.classList.add('active');
        }
    };

    handleHide = () => {
        if (this.layer.classList.contains('active')) {
            this.layer.classList.remove('active');
        }
    };
}