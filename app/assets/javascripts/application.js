//= require vue
//= require vue-router
//= require vue-resource
//= require vuex
$( document ).ready(function() {
    var projects = new Vue({
        el: '#projects',
        data: {
            projects: [],
        },
        mounted: function() {
            var that;
            that = this;
            $.ajax({
                url: '/projects.json',
                success: function(res) {
                    that.projects = res;
                }
            });
        },
        methods: {
            vote: function (project, _for) {
                var that = this;
                if (project.current_user.logged_user)
                    $.ajax({
                        method: 'POST',
                        url: _for ? project.urls.vote_for : project.urls.vote_against,
                        success: function(res) {
                            $.ajax({
                                url: '/projects.json',
                                success: function(res) {
                                    that.projects = res;
                                }
                            });
                        }
                    });
                else
                    location.href = "users/sign_in";
            },
            join: function (project, join) {
                var that = this;
                if (project.current_user.logged_user)
                    $.ajax({
                        method: 'POST',
                        url: join ? project.urls.join : project.urls.leave,
                        success: function(res) {
                            $.ajax({
                                url: '/projects.json',
                                success: function(res) {
                                    that.projects = res;
                                }
                            });
                        }
                    });
                else
                    location.href = "users/sign_in";
            },
            edit: function (project) {
                location.href = project.urls.edit

            }
        }

    });
});

