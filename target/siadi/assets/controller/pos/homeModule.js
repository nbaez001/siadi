angular.module('homeModule', ['components'])
        .controller('homeController', ['$scope', '$http', '$timeout', function (s, h, t) {
                s.mostrar = true;

                t(function () {
                    s.mostrar = false;
                }, 20000);
            }
        ]);

        