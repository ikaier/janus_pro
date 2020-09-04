import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {

    strings: ["Save on Millions of Products", "Discounts Up To 80%!"],
    typeSpeed: 100,

    loop: true
  });
}

export { loadDynamicBannerText };
