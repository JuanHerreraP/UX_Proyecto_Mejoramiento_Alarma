const backgroundColor = localStorage.getItem('background-color');
const textPrimary = localStorage.getItem('text-primary');
const accentColor = localStorage.getItem('accent-color')

if (backgroundColor) {
    document.documentElement.style.setProperty('--background-color', backgroundColor);
    document.documentElement.style.setProperty('--text-primary', textPrimary);
}

if (accentColor) {
    document.documentElement.style.setProperty('--primary-color', accentColor);
}

document.addEventListener('DOMContentLoaded', () => {
    // --- SELECTORES GLOBALES ---
    const body = document.body;
    const root = document.querySelector(':root');
    const themeSelect = document.getElementById('theme-select');
    const colorSelector = document.getElementById('colorSelector');
    const colorRadios = document.querySelectorAll('input[name="colorTheme"]');

    // --- LÓGICA DE APARIENCIA (TEMA Y COLOR) ---

    if (themeSelect) {
        themeSelect.addEventListener('change', () => {
            if (themeSelect.value === "light") {
                root.style.setProperty('--background-color', '#FFFFFF');
                localStorage.setItem('background-color', '#FFFFFF');
                root.style.setProperty('--text-primary', '#2c3e50');
                localStorage.setItem('text-primary', '#2c3e50');
            } else if (themeSelect.value === "dark") {
                root.style.setProperty('--background-color', '#1e1e1e');
                localStorage.setItem('background-color', '#1e1e1e');
                root.style.setProperty('--text-primary', '#FFFFFF');
                localStorage.setItem('text-primary', '#FFFFFF');
            }
        });
    }

    if (colorSelector) {
        for (const colorRadio of colorRadios) {
            colorRadio.addEventListener('change', function (e) {
                if (this.checked) {
                    const val = this.value;
                    root.style.setProperty('--primary-color', val);
                    localStorage.setItem('accent-color', val);
                    console.log(`Selected value: ${val}`);
                }
            });
        }
    }


    // --- LÓGICA DE DÍAS (PANTALLA ADD-ALARM) ---
    const daySelectors = document.querySelectorAll('.day-selector .day');
    daySelectors.forEach(day => {
        day.addEventListener('click', () => {
            day.classList.toggle('active');
        });
    });

    // --- LÓGICA DE ALERTA PERSONALIZADA (PANTALLA ADD-ALARM) ---
    const addAlarmBtn = document.getElementById('addAlarmBtn');
    const modalOverlay = document.getElementById('modalOverlay');
    const saveBtn = document.getElementById('save-alarm-btn');
    const customAlert = document.getElementById('custom-alert');
    const closeAlertBtn = document.getElementById('close-alert-btn');

    /*if (saveBtn && customAlert && closeAlertBtn) {
        saveBtn.addEventListener('click', (e) => {
            e.preventDefault(); // Previene que el formulario se envíe (si lo estuviera)
            customAlert.style.display = 'flex';
            setTimeout(() => {
                customAlert.style.display = 'none';
            }, 3000);
        });

        closeAlertBtn.addEventListener('click', () => {
            customAlert.style.display = 'none';
        });
    } */

    if (addAlarmBtn && modalOverlay && closeAlertBtn && saveBtn) {
        closeAlertBtn.addEventListener('click', () => {
            modalOverlay.style.display = 'none';
        });

        saveBtn.addEventListener('click', () => {
            modalOverlay.style.display = 'none';
        });

        addAlarmBtn.addEventListener('click', () => {
            modalOverlay.style.display = 'flex';
        });
    }

});