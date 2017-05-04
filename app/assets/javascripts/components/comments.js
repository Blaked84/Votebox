$( document ).ready(function() {

    Vue.component('comment-row', {
       template: '#comment-row',
       props: {
           comment: Object,
       },
       data: function () {
            return {
                vcomment: this.comment,
                editMode: false
            }
       },
       computed: {
            dateshow : function (){
                console.log(this.published_at);
                var that = this;
                var date=moment(that.comment.published_at,"YYYYMMDD h:mm").fromNow();
                return date;
            }
       },
       methods: {
           update_comment: function () {
               var that = this;
               Vue.http.patch(that.vcomment.url,{
                   text: that.vcomment.text
               }).then( function (response) {
                       that.vcomment = response.body;
                       that.editMode = false},
                   console.log("error")
               )
           }
       }
    });


    var comments = new Vue({
        el: '#comments',
        data: function (){
            return {
                comments: [],
                currentRoute: window.location.pathname,
                comment: {
                    author: '',
                    text: ''
                },
                projectId: window.location.pathname.match(/([^\/]*)\/*$/)[1],
                commentMode: false
            }

        },
        mounted: function() {
            var that;
            that = this;
            $.ajax({
                url: this.commentUrl,
                success: function(res) {
                    that.comments = res.constructor === Array ? res : [res];
                }
            });
        },
        computed: {
            commentUrl: function () {
                return this.currentRoute + "/comments.json"
            }
        },
        methods: {
            addComment: function () {
                var that = this;
                Vue.http.post(that.commentUrl,{
                    text: that.comment.text,
                    project_id: that.projectId
                }).then( function (response) {
                        var comment = response.body;
                        that.comments.push(comment);
                        that.comment = ""
                        },
                    console.log("error")
                )
            }
        }
    });


});