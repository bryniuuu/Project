$(document).ready(function() {

    $.validator.addMethod('cenaformat', function (value, element) {
        return /^\d{5,6}?$/.test(value);
    }, 'Podany format jest nieprawidłowy');

    $('#add_model').validate({
        rules: {
            //atrybut name: {reguły}
            nazwa_model: {
                required: true,
                minlength: 2,
                maxlength: 40
            },
            cena: {
                required: true,
                cenaformat:true
            },
            foto: {
                required: true,
                extension: "jpg,jpeg,png"
            }
        },

        messages: {
            nazwa_model: {
                required: 'Pole wymagane',
                minlength: jQuery.validator.format("Pole musi zawierać minimum {0} znaki!"),
                maxlength: jQuery.validator.format("Pole musi zawierać maksimum {0} znaki!")
            },
            cena:{
                required: 'Pole wymagane'
            },
            foto:{
                required: 'Pole wymagane',
                extension: 'Plik musi być w odpowiednim formacie'
            }
        },
        highlight: function(element, errorClass, validClass) {
            //znajdz najbliższy element form-group
            $(element).closest('input').addClass(errorClass).removeClass(validClass);
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).closest('input').removeClass(errorClass).addClass(validClass);
        },
        errorClass: 'is-invalid',
        validClass: 'is-valid',

        invalidHandler: function(event, validator) {
            // 'this' to referencja do form
            var errors = validator.numberOfInvalids();
            if (errors) {
                var message = errors == 1
                    ? 'Nie wypełniono poprawnie 1 pola. Zostało podświetlone'
                    : 'Nie wypełniono poprawnie ' + errors + ' pól. Zostały podświetlone';
                $("div.alert-danger").html(message);
                $("div.alert-danger").show();
            } else {
                $("div.alert-danger").hide();
            }
        },
    });
});