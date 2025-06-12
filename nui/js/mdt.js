window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action === "open") {
        document.getElementById("skinFrame").src = `skins/${data.skin}.html`;
    }

    if (data.action === "openAdmin") {
        document.getElementById("skinFrame").src = `skins/admin.html`;
    }
});
