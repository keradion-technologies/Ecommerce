document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('menu-search-input');
    const navbarNav = document.getElementById('navbar-nav');

    if (!searchInput || !navbarNav) return;

    const inputLi = searchInput.closest('.nav-item');
    const menuItems = Array.from(navbarNav.querySelectorAll('.nav-item')).slice(1); // Exclude the first (input) li
    const clearButton = document.createElement('button');
    clearButton.id = 'clear-search';
    clearButton.className = 'btn btn-sm btn-secondary mt-2';
    clearButton.textContent = 'Clear Search';
    clearButton.style.display = 'none';
    inputLi.insertAdjacentElement('afterend', clearButton); // Place clear button right after input's li

    // Store original HTML content for each menu item
    const originalContent = new Map();
    
    // Initialize original content storage
    menuItems.forEach(item => {
        const link = item.querySelector('.nav-link');
        if (link) {
            originalContent.set(link, link.innerHTML);
        }
        
        // Also store sub-menu items
        const subItems = item.querySelectorAll('.collapse .nav-item .nav-link');
        subItems.forEach(subLink => {
            originalContent.set(subLink, subLink.innerHTML);
        });
    });

    searchInput.addEventListener('input', handleSearch);
    clearButton.addEventListener('click', resetMenu);

    function handleSearch(event) {
        const searchTerm = event.target.value.toLowerCase().trim();
        let hasMatch = false;

        // Ensure clear button visibility
        clearButton.style.display = searchTerm.length >= 2 ? '' : 'none';

        if (searchTerm.length < 2) {
            resetDisplay();
            return;
        }

        menuItems.forEach(item => {
            const link = item.querySelector('.nav-link');
            const text = link ? getTextContent(link).toLowerCase() : '';
            const collapse = item.querySelector('.collapse');
            const isParent = collapse !== null;

            if (text.includes(searchTerm)) {
                item.style.display = '';
                if (isParent) collapse.classList.add('show');
                highlightMatch(link, searchTerm);
                hasMatch = true;
            } else if (isParent && collapse) {
                let subMatch = false;
                const subItems = collapse.getElementsByClassName('nav-item');
                Array.from(subItems).forEach(subItem => {
                    const subLink = subItem.querySelector('.nav-link');
                    const subText = subLink ? getTextContent(subLink).toLowerCase() : '';
                    if (subText.includes(searchTerm)) {
                        subItem.style.display = '';
                        highlightMatch(subLink, searchTerm);
                        subMatch = true;
                        hasMatch = true;
                    } else {
                        subItem.style.display = 'none';
                    }
                });
                if (subMatch) {
                    item.style.display = '';
                    collapse.classList.add('show');
                } else {
                    item.style.display = 'none';
                }
            } else {
                item.style.display = 'none';
            }
        });

        if (!hasMatch) {
            menuItems.forEach(item => item.style.display = 'none');
        }
    }

    function getTextContent(element) {
        if (!element) return '';
        // Get only the direct text content, excluding nested elements like badges and icons
        let text = '';
        for (let node of element.childNodes) {
            if (node.nodeType === Node.TEXT_NODE) {
                text += node.textContent;
            } else if (node.tagName === 'SPAN' && !node.classList.contains('badge')) {
                // Include span content but exclude badges
                text += getTextContent(node);
            }
        }
        return text.trim();
    }

    function highlightMatch(element, term) {
        if (!element) return;
        
        const originalHTML = originalContent.get(element);
        if (!originalHTML) return;

        // Create a temporary element to work with
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = originalHTML;
        
        // Function to highlight text in text nodes only
        function highlightTextNodes(node) {
            if (node.nodeType === Node.TEXT_NODE) {
                const text = node.textContent;
                if (text.toLowerCase().includes(term)) {
                    const regex = new RegExp(`(${escapeRegExp(term)})`, 'gi');
                    const highlightedText = text.replace(regex, '<span class="sidebar-search-highlight" style="background-color: yellow; color: black;">$1</span>');
                    if (highlightedText !== text) {
                        const wrapper = document.createElement('span');
                        wrapper.innerHTML = highlightedText;
                        node.parentNode.replaceChild(wrapper, node);
                    }
                }
            } else if (node.nodeType === Node.ELEMENT_NODE && 
                      !node.classList.contains('badge') && 
                      !node.classList.contains('las') && 
                      !node.classList.contains('bx') &&
                      !node.classList.contains('ri')) {
                // Recursively process child nodes, but skip badges and icons
                const childNodes = Array.from(node.childNodes);
                childNodes.forEach(child => highlightTextNodes(child));
            }
        }
        
        highlightTextNodes(tempDiv);
        element.innerHTML = tempDiv.innerHTML;
    }

    function escapeRegExp(string) {
        return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    }

    function resetDisplay() {
        menuItems.forEach(item => {
            item.style.display = '';
            const link = item.querySelector('.nav-link');
            if (link && originalContent.has(link)) {
                link.innerHTML = originalContent.get(link); // Restore original HTML
            }
            
            // Reset sub-menu items
            const subItems = item.querySelectorAll('.collapse .nav-item .nav-link');
            subItems.forEach(subLink => {
                if (originalContent.has(subLink)) {
                    subLink.innerHTML = originalContent.get(subLink);
                }
                subLink.closest('.nav-item').style.display = '';
            });
            
            const collapse = item.querySelector('.collapse');
            if (collapse) collapse.classList.remove('show');
        });
    }

    function resetMenu() {
        searchInput.value = '';
        clearButton.style.display = 'none'; // Explicitly hide clear button
        resetDisplay();
    }

    // Reset on input clear
    searchInput.addEventListener('search', resetMenu);
});