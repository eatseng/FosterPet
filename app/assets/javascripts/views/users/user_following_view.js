FosterPet.Views.UserFollowingView = Backbone.View.extend({
  template: JST['users/following_pets'],

  render: function() {
    var renderedContent = this.template({
      user: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }
});