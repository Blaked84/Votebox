//= require vue
//= require vue-router
//= require vue-resource
//= require vuex
//= require_tree "./components"

// Vue.http.interceptors.push({
//     request: function (request) {
//         Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content');
//         return request;
//     },
//     response: function (response) {
//         return response;
//     }
// });