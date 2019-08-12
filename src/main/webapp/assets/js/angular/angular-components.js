angular.module('components', [])
        .directive('uppercased', function () {
            return {
                require: 'ngModel',
                link: function (scope, element, attrs, modelCtrl) {
                    modelCtrl.$parsers.push(function (input) {
                        return input ? input.toUpperCase() : "";
                    });
                    element.css("text-transform", "uppercase");
                }
            };
        })
        .directive('autoComplete', function () {
            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    $(element).autocomplete({
                        source: scope.$eval(attrs.autoComplete),
                        select: function (ev, ui) {
                            ev.preventDefault();
                            if (ui.item) {
                                scope.seleccion(ui.item);
                            }
                        }
                    });
                }
            };
        })
        .directive('autoComplete2', function () {
            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    $(element).autocomplete({
                        source: scope.$eval(attrs.autoComplete2),
                        select: function (ev, ui) {
                            ev.preventDefault();
                            if (ui.item) {
                                scope.seleccion2(ui.item);
                            }
                        }
                    });
                }
            };
        })
        .directive('autoComplete3', function () {
            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    $(element).autocomplete({
                        source: scope.$eval(attrs.autoComplete3),
                        select: function (ev, ui) {
                            ev.preventDefault();
                            if (ui.item) {
                                scope.seleccion3(ui.item);
                            }
                        }
                    });
                }
            };
        })
        .directive('ngEnter', function () {
            return function (scope, element, attrs) {
                element.bind("keydown keypress", function (event) {
                    if (event.which === 13) {
                        scope.$apply(function () {
                            scope.$eval(attrs.ngEnter);
                        });
                        event.preventDefault();
                    }
                });
            };
        })
        .directive("decimals", function ($filter) {
            return {
                restrict: "A",
                require: "?ngModel",
                scope: {
                    decimals: "@"
                },
                link: function (scope, element, attr, ngModel) {
                    var decimalCount = parseInt(scope.decimals) || 2;
                    ngModel.$render = function () {
                        if (ngModel.$modelValue !== null && ngModel.$modelValue >= 0) {
                            if (typeof decimalCount === "number") {
                                element.val(ngModel.$modelValue.toFixed(decimalCount));
                            } else {
                                element.val(ngModel.$modelValue);
                            }
                        }
                    };
                    ngModel.$parsers.unshift(function (newValue) {
                        if (typeof decimalCount === "number") {
                            var floatValue = parseFloat(newValue);
                            if (decimalCount === 0) {
                                return parseInt(floatValue);
                            }
                            return parseFloat(floatValue.toFixed(decimalCount));
                        }
                        return parseFloat(newValue);
                    });
                    element.on("change", function (e) {
                        var floatValue = parseFloat(element.val());
                        if (!isNaN(floatValue) && typeof decimalCount === "number") {
                            if (decimalCount === 0) {
                                element.val(parseInt(floatValue));
                            } else {
                                var strValue = floatValue.toFixed(decimalCount);
                                element.val(strValue);
                            }
                        }
                    });
                }
            };
        })
        .service('notify', function () {
            this.notificar = function (titulo, tipo, mensaje) {
                new PNotify({
                    title: titulo,
                    type: tipo,
                    text: mensaje,
                    nonblock: {
                        nonblock: true
                    },
                    before_close: function (PNotify) {
                        PNotify.update({
                            title: PNotify.options.title + ' - Disfrute su estadia',
                            before_close: null
                        });
                        PNotify.queueRemove();
                        return false;
                    }
                });
            };
        })
        .service('dateParser', function () {
            this.parse = function (date) {
                var dateParts = date.split("/");
                return new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
            };
        });