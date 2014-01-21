FosterPet.Views.UserWallView = Backbone.View.extend({
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
  }
});