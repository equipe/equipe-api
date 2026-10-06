(function () {
  // The code blocks that follow each other at the top of a section become
  // one viewer, with a tab for each block's title. A block alone keeps its
  // title as a label over it.
  document.querySelectorAll(".doc > section").forEach(function (section) {
    var first = section.querySelector(":scope > div");

    if (!first || !first.classList.contains("highlighter-rouge")) {
      return;
    }

    var blocks = [first],
      next = first.nextElementSibling;

    while (next && next.matches("div.highlighter-rouge")) {
      blocks.push(next);
      next = next.nextElementSibling;
    }

    var titles = blocks.map(function (block) {
      var title = block.getAttribute("title");
      block.removeAttribute("title");
      return title;
    });

    if (!titles.some(Boolean)) {
      return;
    }

    var viewer = document.createElement("div");
    viewer.className = "code-viewer";
    first.before(viewer);

    if (blocks.length === 1) {
      var label = document.createElement("p");
      label.className = "code-title";
      label.textContent = titles[0];
      viewer.append(label, first);
      return;
    }

    var tabs = document.createElement("div");
    tabs.className = "code-tabs";
    tabs.setAttribute("role", "tablist");
    viewer.append(tabs);

    blocks.forEach(function (block, i) {
      var tab = document.createElement("button");
      tab.type = "button";
      tab.setAttribute("role", "tab");
      tab.textContent = titles[i] || "Example " + (i + 1);
      tabs.append(tab);
      viewer.append(block);

      tab.addEventListener("click", function () {
        blocks.forEach(function (other, j) {
          other.hidden = j !== i;
          tabs.children[j].setAttribute("aria-selected", j === i);
        });
      });
    });

    tabs.firstChild.click();
  });

  // A table scrolls sideways in a box of its own when it is wider than the
  // column.
  document.querySelectorAll(".left-docs table").forEach(function (table) {
    var wrap = document.createElement("div");
    wrap.className = "table-wrap";
    table.before(wrap);
    wrap.append(table);
  });

  // The contents open over the page on a narrow window, and close when a
  // page is picked or the page behind them is pressed.
  var body = document.body,
    openNav = document.getElementById("open-nav"),
    sidebar = document.getElementById("sidebar");

  function setNav(open) {
    body.classList.toggle("nav-open", open);
    openNav.setAttribute("aria-expanded", open);
  }

  openNav.addEventListener("click", function () {
    setNav(!body.classList.contains("nav-open"));
  });

  sidebar.addEventListener("click", function (event) {
    if (event.target.closest("a")) {
      setNav(false);
    }
  });

  body.addEventListener("click", function (event) {
    if (event.target === body) {
      setNav(false);
    }
  });

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape" && body.classList.contains("nav-open")) {
      setNav(false);
      openNav.focus();
    }
  });

  // A fence on the course plan and its step in the key light up together.
  document.querySelectorAll(".hero [data-step]").forEach(function (el) {
    var step = el.getAttribute("data-step"),
      all = document.querySelectorAll('.hero [data-step="' + step + '"]');

    function light(on) {
      all.forEach(function (other) {
        other.classList.toggle("is-lit", on);
      });
    }

    el.addEventListener("mouseenter", function () { light(true); });
    el.addEventListener("mouseleave", function () { light(false); });
    el.addEventListener("focusin", function () { light(true); });
    el.addEventListener("focusout", function () { light(false); });
  });

  // The contents mark the section being read.
  var links = Array.prototype.slice.call(sidebar.querySelectorAll("a[href*='#']")),
    targets = links.map(function (link) {
      return document.getElementById(decodeURIComponent(link.hash.slice(1)));
    });

  if (!targets.some(Boolean)) {
    return;
  }

  var active = null,
    ticking = false;

  function setActive() {
    ticking = false;

    var line = window.innerHeight * 0.25,
      index = 0;

    targets.forEach(function (target, i) {
      if (target && target.getBoundingClientRect().top <= line) {
        index = i;
      }
    });

    if (window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 2) {
      index = links.length - 1;
    }

    var link = links[index];

    if (link === active) {
      return;
    }

    if (active) {
      active.classList.remove("active");
      active.removeAttribute("aria-current");
    }

    active = link;
    link.classList.add("active");
    link.setAttribute("aria-current", "location");

    // Keep the marked link in sight in the contents.
    var top = link.offsetTop,
      bottom = top + link.offsetHeight;

    if (top < sidebar.scrollTop + 48) {
      sidebar.scrollTop = top - 48;
    } else if (bottom > sidebar.scrollTop + sidebar.clientHeight - 48) {
      sidebar.scrollTop = bottom - sidebar.clientHeight + 48;
    }
  }

  window.addEventListener("scroll", function () {
    if (!ticking) {
      ticking = true;
      window.requestAnimationFrame(setActive);
    }
  }, { passive: true });

  setActive();
})();
