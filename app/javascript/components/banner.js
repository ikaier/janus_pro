import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Compare Prices From The Leading Stores", "Save Up To 80%"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
