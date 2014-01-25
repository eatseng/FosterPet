FosterPet.Views.UserWallView = Backbone.View.extend({
  events: {
    "click img.post_photo" : "photo"
  },

  initialize: function(options) {
    this.user = options.user;
  },

  templateWall: JST['users/userwall'],

  render: function() {
    var that = this;
    var userWallPost = new FosterPet.Collections.UserWallPosts(this.id)
    userWallPost.fetch({
      success: function(){
        var renderedContent = that.templateWall({
          user: that.user,
          wallPosts: userWallPost
        });
        that.$el.html(renderedContent);
      }
    });
    return this;
  },

  photo: function() {
    $('img.modal_photo').attr('src', $(event.target).attr('src'));
    $('img.modal_photo').attr('alt', $(event.target).attr('alt'));
    $('.modal-photo-title').text($(event.target).attr('alt'));
    debugger
    $('#pictureModal').modal();
  }
});