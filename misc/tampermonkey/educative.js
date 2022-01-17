// ==UserScript==
// @name         educative shortcuts
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.educative.io/*
// @grant        none
// ==/UserScript==

(function () {
    'use strict';

    function isInViewport(el) {
        const rect = el.getBoundingClientRect();
        return (
            rect.top >= 0 && rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    window.addEventListener('keydown', (event) => {
        event.preventDefault();
        switch (event.code) {
            case 'F1':
                [...document.querySelectorAll('button')].filter((e) => e.innerText === 'Next')[0].click()
                break;
            case 'F2':
                [...document.querySelectorAll('button')].filter((e) => e.innerText === 'Back')[0].click()
                break;
            case 'F3':
                var runButton = [...document.querySelectorAll('button')]
                    .filter((e) => e.innerText === 'Run')
                    .filter((e) => isInViewport(e))[0];
                runButton.click()
                break;
            case 'F4':
                var testButton = [...document.querySelectorAll('button')]
                    .filter((e) => e.innerText === 'Test')
                    .filter((e) => isInViewport(e))[0];
                testButton.click()
                break;
        }
    }, false);
})();
