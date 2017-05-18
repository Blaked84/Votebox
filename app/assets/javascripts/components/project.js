$( document ).ready(function() {

    Vue.component('project-row', {
       template: '#project-row',
       props: {
           project: Object,
           categories: Array
       },
       data: function () {
            return {
                vproject: this.project,
                editMode: false,
                commentMode: false
            }
        },
       methods: {
           vote: function (_for) {
               var that = this;
               if (that.project.current_user.logged_user)
                    Vue.http.post(_for ? that.project.urls.vote_for : that.project.urls.vote_against).then(
                       function (response) {
                           that.vproject = response.body;},
                       console.log("error")
                    );
               else
                   location.href = "users/sign_in";
           },
           join: function (join) {
               var that = this;
               if (that.project.current_user.logged_user)
                   Vue.http.post(join ? that.project.urls.join : that.project.urls.leave).then(
                       function (response) {
                           that.vproject = response.body;},
                       console.log("error")
                   );
               else
                   location.href = "users/sign_in";
           },
           edit: function () {
               var that = this;
               location.href = that.vproject.urls.edit
           },
           update_project: function () {
               var that = this;
               Vue.http.patch(that.vproject.url,{
                   name: that.vproject.name,
                   description: that.vproject.description,
                   category_id: that.vproject.category.id
               }).then(
                   function (response) {
                       that.vproject = response.body;
                       that.editMode = false},
                   console.log("error")
               )
           }
       }
    });


    var projects = new Vue({
        el: '#projects',
        data: function (){
            return {
                projects: [],
                currentRoute: window.location.pathname,
                categories: [],
                categoriesFilter: null
            }

        },
        mounted: function() {
            var that;
            that = this;

            this.$http.get(this.ProjectsUrl).then(
                function(response){
                    that.projects = response.body.constructor === Array ?
                        response.body :
                        [response.body];
            });
            this.$http.get("/categories.json").then(
                function(response){
                    that.categories = response.body.constructor === Array ?
                        response.body :
                        [response.body];
            });
        },
        computed: {
            ProjectsUrl: function () {
                var that = this;
                var filter = that.categoriesFilter === null ? "" : "?category_id=" + that.categoriesFilter;
                if (this.currentRoute === "/")
                    return "/projects.json" + filter
                else
                    return this.currentRoute + ".json";
            }
        },
        methods: {
            filter: function (id) {
                var that;
                that = this;
                that.categoriesFilter = id;
                that.projects = []
                this.$http.get(this.ProjectsUrl).then(
                    function(response){
                        that.projects = response.body
                });
            }
        }
    });
});