$(function () {
    loadTheme()
})

function preventNonNumeric(that) {
    var t = $(that)
    t.val(t.val().replace(/[^0-9]+/g, ''))
}

$(document).on('livewire:load reload', () => {
    dataTableReload()
    select2Load()
})

function dataTableReload() {
    var findTables = $('.datatable')
    if (findTables.length) {
        $(".datatable").DataTable({
            paging: false,
            searching: false
        })
        var datatableFilterInput = $('.dataTables_filter')
        if (datatableFilterInput) {
            $.each(datatableFilterInput, (i, input) => {
                $(input).find('input').addClass('form-control m-0 ml-1')
            })
        }
    }
}

function select2Load() {
    var select2 = $('.select2')
    $.each(select2, (i, select) => {
        $(select).select2({
            dropdownAutoWidth: true,
            // dropdownParent: $(".modal-body"),
            dropdownParent: $(select).parent(),
            width: '100%'
        })
    })
}

function livewirePageExpired() {
    Swal.fire({
        title: 'The session has expired.',
        text: "You need to refresh the page",
        type: 'warning',
        showCancelButton: false,
        confirmButtonText: 'Refresh',
        confirmButtonClass: 'btn btn-primary',
        buttonsStyling: false,
    }).then(function (result) {
        location.reload()
    })
}

function deleteData(id, emitWhat = 'deleteData') {
    Swal.fire({
        title: 'are you Sure?',
        text: "Deleted data cannot be recovered.",
        type: 'error',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        confirmButtonClass: 'btn btn-danger',
        cancelButtonClass: 'btn btn-success mx-2',
        buttonsStyling: false,
    }).then(function (result) {
        if (result.value) {
            Livewire.emit(emitWhat, id)
        }
    })
}

function sweetError(text, c = false) {
    Swal.fire({
        title: 'Error',
        text: text,
        confirmButtonText: 'OK',
        confirmButtonClass: 'btn btn-label-success',
        type: 'error',
    }).then(function () {
        if (c) {
            closeModals()
        }
    })
}

Livewire.on('sweetError', function (data) {
    if (data[1]) {
        sweetError(data[0], true)
    } else {
        sweetError(data[0])
    }
})

function sweetConfirm(emitWhat, text = null, loading = false) {
    Swal.fire({
        title: 'are you Sure?',
        text: text,
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        confirmButtonClass: 'btn btn-label-success',
        cancelButtonClass: 'btn btn-label-danger mx-2',
        buttonsStyling: false,
    }).then(function (result) {
        if (loading) {
            // show_loading()
        }
        if (result.value) {
            Livewire.emit(emitWhat)
        }
    })
}

Livewire.on('sweetConfirm', (emitWhat, text = null) => {
    sweetConfirm(emitWhat, text)
})


Livewire.on('closeModals', () => {
    closeModals()
})

function closeModals() {
    const modals = $('.modal')
    // $('.modal-backdrop').hide()
    $.each(modals, (i, modal) => {
        $(modal).modal('hide')
        // const m = new bootstrap.Modal('#'+$(modal).attr('id'),{hide:true})
        // m.hide()
    })
}


Livewire.on('consoleLog', (data) => {
    console.log(data)
})


function sweetSuccess(text, close = false) {
    Swal.fire({
        text: text,
        confirmButtonText: 'OK',
        confirmButtonClass: 'btn btn-label-success',
        type: 'success',
    }).then(function (result) {
        if (result.value) {
            if (close) {
                closeModals()
            }
        }
    })
}

Livewire.on('sweetSuccess', (text, close = false) => {
    sweetSuccess(text, close)
})

Livewire.on('showModal', function (e) {
    const find = $('#' + e)
    if (find.length) {
        // find.modal('show')
        const modal = new bootstrap.Modal(find)
        modal.show()
    }
})


Livewire.on('toast', function (data) {
    toast(data)
})

function toast(data, sound = null, timeout = 3500, primary = false) {
    toastr.options.progressBar = true;
    if (data[0] === 'info') {
        toastr.info(data[2], data[1], {"showMethod": "slideDown", "hideMethod": "slideUp", timeOut: timeout})
    } else if (data[0] === 'success') {
        toastr.success(data[2], data[1], {"showMethod": "slideDown", "hideMethod": "slideUp", timeOut: timeout})
    } else if (data[0] === 'warning') {
        toastr.warning(data[2], data[1], {"showMethod": "slideDown", "hideMethod": "slideUp", timeOut: timeout})
    } else {
        if (primary) {
            toastr.info(data[2], data[1], {"showMethod": "slideDown", "hideMethod": "slideUp", timeOut: timeout})
        } else {
            toastr.error(data[2], data[1], {"showMethod": "slideDown", "hideMethod": "slideUp", timeOut: timeout})
        }
    }
    if (sound) {
        var audio = new Audio($("#notification_sound").val())
        audio.play()
    }
}

function pad(val) {
    return val < 10 ? "0" + val : val;
}

Livewire.on('removeLoading', function () {
    $(".loading").fadeOut().hide().addClass('d-none').removeClass('d-flex')
})

function loading() {
    $(".loading").hide().addClass('d-flex').removeClass('d-none').fadeIn()
}

function loadTheme() {
    var theme = getCookie('the6fallenangels-theme')
    if (!theme) {
        theme = 'light'
    }
    setTheme(theme)
    return theme
}

function toggleTheme() {
    var theme = loadTheme()
    if (theme === "light") {
        theme = 'dark'
    } else {
        theme = 'light'
    }
    setTheme(theme)
}

function setTheme(theme) {
    $('html').attr('data-bs-theme', theme)
    setCookie('the6fallenangels-theme', theme)
    var icon = $('.toggleTheme i')
    if (theme === 'dark') {
        icon.removeClass('ti-sun-high').addClass('ti-moon')
    } else {
        icon.addClass('ti-sun-high').removeClass('ti-moon')
    }
}

function setCookie(cname, cvalue) {
    const d = new Date();
    d.setTime(d.getTime() + 2592000000);
    let expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function readMore(that) {
    $('.readMore,.summary').show()
    $('.more').hide().removeClass('d-none')
    var more = $($(that).parent().find('.more')[0])
    var summary = $($(that).parent().find('.summary')[0])
    summary.hide()
    more.show()
    $(that).hide()
}

Livewire.on('selectItem', function (item_id) {
    $(".item_img").removeClass('border-info shadow-lg border-4')
    $(".item_img_" + item_id).addClass('border-info shadow-lg border-4')
})
