FosterPet.Views.UserShowView = Backbone.View.extend({
  templateStructure: JST['users/show'],
  templateHeader: JST['users/header'],


  render: function() {
    this.$el.html(this.templateStructure());
    this.$('.top_header').html(this.templateHeader({
      user: this.model
    }));

    this.userWall = new FosterPet.Views.UserWallView({
      $el: this.$('.user_wall'),
      user: this.model,
      id: this.id
    });

    this.$('.user_wall').html(this.userWall.render().$el);
    return this;
  }



});