document.addEventListener("DOMContentLoaded", function() {
    // Obtener la ruta de la página actual, ej: "/settings-cuenta.html"
    const currentPage = window.location.pathname;

    // Obtener todos los enlaces de la barra de navegación
    const navLinks = document.querySelectorAll('.sidebar-nav a');

    navLinks.forEach(link => {
        // Obtener la ruta del enlace
        const linkPath = new URL(link.href).pathname;

        // Si la ruta del enlace coincide con la página actual
        if (currentPage === linkPath) {
            // Añadir la clase 'active' para resaltarlo
            link.classList.add('active');
        }
    });
});