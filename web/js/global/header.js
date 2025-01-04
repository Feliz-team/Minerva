function toggleScroll(block) {
    if (block) {
        document.body.style.overflow = "hidden";
    } else {
        document.body.style.overflow = "";
    }
}

const headerNavigationMenuItemContainer = document.querySelector(".header-navigation__menu-item-container");
const headerNavigationMenuItemDropdown = document.querySelector(".header-navigation__menu-item-dropdown");
const headerNavigationMenuArrow = document.querySelector(".header-navigation__menu-arrow");
const headerLine = document.querySelector(".header-navigation__decoration-line");

headerNavigationMenuItemContainer.addEventListener("click", () => {
    const isActive = headerNavigationMenuItemDropdown.classList.toggle("active");
    headerNavigationMenuArrow.classList.toggle("active");
});

const headerNavigationMenuBurgerIcon = document.querySelector(".header-navigation__menu-burger");
const headerNavigationMainDropMenu = document.querySelector(".header-navigation__main-drop-menu");

headerNavigationMenuBurgerIcon.addEventListener("click", () => {
    const isActive = headerNavigationMainDropMenu.classList.toggle("active");
    headerNavigationMenuBurgerIcon.classList.toggle("active");
    headerLine.classList.toggle("active");
    toggleScroll(isActive);
});

const headerNavigationMenuItemContainerComputer = document.querySelector(".header-navigation__menu-item-container-computer");
const headerNavigationMenuItemDropdownComputer = document.querySelector(".header-navigation__menu-item-dropdown-computer");
const headerComputerArrow = document.querySelector(".header-navigation__menu-arrow-computer");

headerNavigationMenuItemContainerComputer.addEventListener("click", () => {
    const isActive = headerNavigationMenuItemDropdownComputer.classList.toggle("active");
    headerComputerArrow.classList.toggle("active");
});
