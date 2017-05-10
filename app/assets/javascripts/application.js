//= require vue
//= require vue-router
//= require vue-resource
//= require vuex
//= require typed
//= require moment
//= require moment/fr.js


$( document ).ready(function() {
    $("#yourelement").typed({
        strings: ["projets", "idées"],
        loop: true,
        backDelay: 3000,
        startDelay: 1000,
        backSpeed: 100,
        typeSpeed: 100,
        backspace: function(curString, curStrPos){

            setTimeout(function() {

                // check string array position
                // on the first string, only delete one word
                // the stopNum actually represents the amount of chars to
                // keep in the current string. In my case it's 3.
                if (self.arrayPos == 1) {
                    self.stopNum = 3;
                }
                //every other time, delete the whole typed string
                else {
                    self.stopNum = 0;
                }
            })
        }
    });
    console.log("ekjbvdsjkfb")
});

// Vue.http.interceptors.push({
//     request: function (request) {
//         Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content');
//         return request;
//     },
//     response: function (response) {
//         return response;
//     }
// });