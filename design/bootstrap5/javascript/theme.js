(function () {
  'use strict';

  var toTop = document.getElementById('scroll-to-top');
  if (toTop) {
    window.addEventListener('scroll', function () {
      toTop.style.display = window.scrollY > 400 ? 'block' : 'none';
    });
    toTop.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  // Bootstrap 5 has no native multi-level dropdown; open nested
  // .dropdown-submenu on hover/click of its parent <li>, closing siblings.
  document.querySelectorAll('.dropdown-submenu').forEach(function (submenu) {
    submenu.addEventListener('click', function (event) {
      if (event.target === submenu.querySelector(':scope > a')) {
        event.preventDefault();
        event.stopPropagation();
        submenu.classList.toggle('show');
        var menu = submenu.querySelector(':scope > .dropdown-menu');
        if (menu) menu.classList.toggle('show');
      }
    });
  });
})();
