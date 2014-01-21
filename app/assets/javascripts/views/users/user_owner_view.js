FosterPet.Views.UserOwnerView = Backbone.View.extend({
  template: JST['users/ownership'],

  render: function() {
  
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});